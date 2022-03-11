## Getting started with test pages

```sql
examples/code/query.sql
```
**examples/code/query.sql**
```sql
-- File: examples/code/query.sql

SELECT role FROM user
 WHERE country = 'JHR'
```

{% capture code %}
 SELECT role FROM user
 WHERE country = 'JHR'
{% endcapture %}

{% include code.html code=code lang="sql" file="code/examples/query.sql" %}

[Hi World](/hello.md)

[Introduction](_pages/intro.md)

[Introduction](pages/intro.md)

