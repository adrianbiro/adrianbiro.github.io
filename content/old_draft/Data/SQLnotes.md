+++
title = 'SQL Notes'
date = 2023-01-15T09:00:00-07:00
draft = true
tags = ['data', 'SLQ']
+++
# SQL Notes

## .psqlrc

```
\set ON_ERROR_ROLLBACK interactive
\set COMP_KEYWORD_CASE upper
\pset pager always
\pset null '[null]'
\timing
\x auto
\encoding unicode
\set HISTFILE ~/.psql_history- :HOST - :DBNAME
\set HISTSIZE 5000
\set HISTCONTROL ignoredups
\set ECHO_HIDDEN ON
\set VERBOSITY verbose
```

## Useful PostgreSQL

### Get percent change

```sql
CREATE OR REPLACE FUNCTION
percent_change(new_value numeric,
               old_value numeric,
               decimal_places integer DEFAULT 1)
RETURNS numeric AS
'SELECT round(
       ((new_value - old_value) / old_value) * 100, decimal_places
);'
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

/*
SELECT percent_change(110, 108, 2); -- 1.85
SELECT percent_change(100, 98, 5);  -- 2.04082
SELECT percent_change(100, 50);     -- 100.0
SELECT percent_change(NULL, 50);    -- [null]

SELECT percent_change(num_2020, num_2010) AS "Percent change" FROM table_of_foo;
*/
```

### Table size in postgres

```sql
SELECT relname as "Table",
       pg_size_pretty(pg_total_relation_size(relid)) As "Size",
       pg_size_pretty(pg_total_relation_size(relid) - pg_relation_size(relid)) as "External Size"
  FROM pg_catalog.pg_statio_user_tables 
ORDER BY pg_total_relation_size(relid) DESC;
```

### Settings

```sql
select
    name,
    setting,
    unit,
    context
from
    pg_settings;
```

### Locks

```sql
SELECT
    bl.pid AS blocked_pid,
    a.usename AS blocked_user,
    kl.pid AS blocking_pid,
    ka.usename AS blocking_user,
    a.query AS blocked_statement
FROM
    pg_catalog.pg_locks bl
    JOIN pg_catalog.pg_stat_activity a ON bl.pid = a.pid
    JOIN pg_catalog.pg_locks kl
    JOIN pg_catalog.pg_stat_activity ka ON kl.pid = ka.pid ON bl.transactionid = kl.transactionid
    AND bl.pid != kl.pid
WHERE
    NOT bl.granted;
```

### Connection info

```sql
select
    usename,
    count(*)
from
    pg_stat_activity
group by
    usename;
```

### Show Activity

```sql
select
    datname,
    pid,
    usename,
    application_name,
    client_addr,
    client_hostname,
    client_port,
    query,
    state
from
    pg_stat_activity;
```

### Waits

```sql
SELECT
    pg_stat_activity.pid,
    pg_stat_activity.query,
    pg_stat_activity.waiting,
    now() - pg_stat_activity.query_start AS totaltime,
    pg_stat_activity.backend_start
FROM
    pg_stat_activity
WHERE
    pg_stat_activity.query !~ '%IDLE%' :: text
    AND pg_stat_activity.waiting = true;
```

### Dbsize

```sql
SELECT
    datname,
    pg_size_pretty(pg_database_size(datname)) db_size
FROM
    pg_database
ORDER BY
    db_size;
```

### Uselesscol

```sql
SELECT
    nspname,
    relname,
    attname,
    typname,
    (stanullfrac * 100) :: int AS null_percent,
    case
        when stadistinct >= 0 then stadistinct
        else abs(stadistinct) * reltuples
    end AS distinct,
    case
        1
        when stakind1 then stavalues1
        when stakind2 then stavalues2
    end AS
values
FROM
    pg_class c
    JOIN pg_namespace ns ON (ns.oid = relnamespace)
    JOIN pg_attribute ON (c.oid = attrelid)
    JOIN pg_type t ON (t.oid = atttypid)
    JOIN pg_statistic ON (
        c.oid = starelid
        AND staattnum = attnum
    )
WHERE
    nspname NOT LIKE E 'pg\\_%'
    AND nspname != information_schema
    AND relkind = 'r'
    AND NOT attisdropped
    AND attstattarget != 0
    AND reltuples >= 100
    AND stadistinct BETWEEN 0
    AND 1
ORDER BY
    nspname,
    relname,
    attname;
```

### Uptime

```sql
select
    now() - pg_postmaster_start_time() AS uptime;
```

### Show running queries

```sql
SELECT
    pid,
    age(clock_timestamp(), query_start),
    usename,
    query,
    state
FROM
    pg_stat_activity
WHERE
    state != 'idle'
    AND query NOT ILIKE '%pg_stat_activity%'
ORDER BY
    query_start desc;
```

### Kill query

```sql
-- Kill running query
SELECT pg_cancel_backend(pid);
--- Kill idle query
SELECT pg_terminate_backend(pid);
```

### Show SSL details

```sql
SELECT
    name,
    setting,
    vartype,
    short_desc,
    enumvals,
    boot_val,
    reset_val,
    pending_restart
FROM
    pg_settings
WHERE
    name ILIKE '%ssl%'
    OR category ILIKE '%SSL%'
    OR short_desc ILIKE '%SSL%';
```

### Show resources

```sql
  SELECT
    name,
    setting,
    vartype,
    short_desc,
    source,
    min_val,
    max_val,
    boot_val,
    reset_val,
    pending_restart
FROM
    pg_settings
WHERE
    -- Memory Kernel Resources Asynchronous Behavior
    -- Background Writer Cost-Based Vacuum Delay Disk
    category ILIKE '%Resource%';
```

## Miscelaneus SQL snipets

```sql
select count(1), foo, bar 
    from db_name 
    group by foo, bar 
    order by count(1) desc
```

## Links

[Database security requirements guide for Department of Defense](https://www.stigviewer.com/stig/database_security_requirements_guide/)

[Useful postgresql queries](https://codefibershq.com/blog/useful-postgresql-pgsql-queries-commands-and-snippets)
