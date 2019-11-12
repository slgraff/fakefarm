# Query Demos

## Search using url params

```
curl 'localhost:9200/customers/_search?q=wyoming&pretty'
```

### sorting param
add on more params for sorting, or other needs.

```
curl 'localhost:9200/customers/_search?q=wyoming&sort=age:desc&pretty'
```

### pagination (from & size)

Choose a `from` to show which document it begins
Choose a `size` to limit the number of documents.

```
curl 'localhost:9200/customers/_search?q=kentucky&from=10&size=2&pretty=true'
```

### explain param

```
curl 'localhost:9200/customers/_search?q=kentucky&explain=true&pretty=true'
```

## Search using body

The primary key is `query`. In `query`, the `match_all` syntax is similar to a `select *`

```
curl 'localhost:9200/customers/_search?pretty=true' -H 'Content-Type:application/json' -d '
{
  "query" : { "match_all": {}}
}
'
```
