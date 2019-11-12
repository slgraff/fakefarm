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

## Keywords in the body

This is a nested combo.

- `_source`
- query
  - match_all
  - term
- size
- from
- sort

### source

Retreive the header of the code but not the contents

```
{
  "_source" : false
}
```

This can be helpful if the goal is simply info about the `hits`, things like score, index, type, id.



### query

The `query` key will be based on the `index` that is provided in the url. For example:

```
curl 'localhost:9200/customers/_search?' -d'
{ "query" : {}}
'
```

This query will be made on the `customers` index.


#### match_all

```
 {
  "query": { "match_all": {} }
 }
```

#### term

Use term for specific data, rather than _all_ the data

```
 {
  "query": {
    "term": { "name" : "gates"}
    "term": { "name" : "gates"}
  }
 }
```


### size

The default is 10, but you can change the response size.

```
{ "size": 3  }
```

### from

Pagination works using the `from` keyword

```
{ "from": 3  }
```

### sort

Sort follows the 'toggle' concept of `key word / data word / key word / preference`

```
{
  "sort" : { "age" : { "order": "desc"}}
}
```

Where `age` is the data attribute that the sort will go by. Notice that the "order" keyword is provided the preferrence.


## Keywords in the URL

- `_search`
-