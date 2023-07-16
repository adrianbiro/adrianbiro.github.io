# KQL vs Apache Licene
## TODO
[https://lucene.apache.org/core/2_9_4/queryparsersyntax.html](https://lucene.apache.org/core/2_9_4/queryparsersyntax.html)

[https://www.elastic.co/guide/en/kibana/current/kuery-query.html](https://www.elastic.co/guide/en/kibana/current/kuery-query.html)

## Syntax Comparison

| Syntax | Description | Example |
| --- | --- | --- |
| KQL | Keyword-based syntax using operators such as "AND", "OR", and "NOT". | http.response.status_code:200 AND url.original:/login/ |
| Lucene | Field-based syntax using special characters and syntax rules such as ":", "+" and "-". | http.response.status_code:200 AND url.original:/login/ |

## Examples

### Searching for exact match

| Syntax | Example |
| --- | --- |
| KQL | http.response.status_code:200 |
| Lucene | http.response.status_code:200 |

### Searching for multiple terms

| Syntax | Example |
| --- | --- |
| KQL | http.response.status_code:200 AND url.original:/login/ |
| Lucene | +http.response.status_code:200 +url.original:/login/ |

### Searching for any of multiple terms

| Syntax | Example |
| --- | --- |
| KQL | http.response.status_code:200 OR http.response.status_code:404 |
| Lucene | http.response.status_code:(200 OR 404) |

### Excluding terms

| Syntax | Example |
| --- | --- |
| KQL | NOT http.response.status_code:500 |
| Lucene | -http.response.status_code:500 |

### Searching for terms within a range

| Syntax | Example |
| --- | --- |
| KQL | response_time: [100 TO 200] |
| Lucene | response_time:[100 TO 200] |

### Wildcard searches

| Syntax | Example |
| --- | --- |
| KQL | url.original:/api/*/users |
| Lucene | url.original:/api/*/users |

## Wildcard Syntax Comparison

| Syntax | Description | Example |
| --- | --- | --- |
| KQL | Uses the "*" wildcard character to match any number of characters (including zero). | url.original : *login* |
| Lucene | Uses the "?" and "*" wildcard characters to match a single character or any number of characters (including zero), respectively. | url.original : *login* or url.original : *log?n* |

## Examples

### Matching any number of characters

| Syntax | Example |
| --- | --- |
| KQL | url.original : *login* |
| Lucene | url.original : *login* |

### Matching a single character

| Syntax | Example |
| --- | --- |
| KQL | Not supported. |
| Lucene | url.original : *log?n* |

### Matching exact number of characters

| Syntax | Example |
| --- | --- |
| KQL | Not supported. |
| Lucene | url.original : /log.{3}n/ |