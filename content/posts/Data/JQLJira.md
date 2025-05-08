+++
title = 'JQL Jira'
date = 2023-01-15T09:00:00-07:00
draft = false
tags = ['data', 'jira', 'JQL']
+++
# JQL Jira

[Using wildcards in JQL search leads to errors | Jira | Atlassian Documentation](https://confluence.atlassian.com/jirakb/using-wildcards-in-jql-search-leads-to-errors-1180140317.html)

[Use advanced search with Jira Query Language (JQL) | Jira Service Management Cloud | Atlassian Support](https://support.atlassian.com/jira-service-management-cloud/docs/use-advanced-search-with-jira-query-language-jql/)

Issues > Search for issues > Advanced > [Save as]
```
assignee in (currentUser()) ORDER BY priority DESC, updated DESC
```
```
status not in (Closed, Deployed, Done, Released)  AND  assignee in (currentUser()) ORDER BY summary ASC, priority DESC, updated DESC
```
```
reporter = currentUser() and status not in (DONE, Rejected, Rejecting, Released)
```
