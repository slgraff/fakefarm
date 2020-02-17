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
  - includes
  - excludes
- query
  - match_all
  - match
  - match_phrase
  - match_phrase_prefix
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

#### Source RegEx

`_source` can also take a regex to find specific fields to only return any that are of interest.

```
{
  "_source" : "st*"
}
```

`_source` can also provide multiple RegEx expressions by using an Array .

```
{
  "_source" : ["st*", "*n*"]
}
```

#### source modifiers

```
{
  "_source" : {
    "includes" : ["st*", "*n*"],
    "excludes" : ["*der"],
  }
}
```

These regex options will only include any key in source that begins with `st` and has an `n` in the field.
Also, it will exclude any field that ends in `der`


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

#### match

Searches for terms within the fields of the document. It is not an exact match and will return what is needed.

```
 {
  "query": {
    "match": {
      "name" : <field>
    }
  }
 }
```

`<field>` represents either a specific string value, or a hash of parameters.

The `"value"` slot can become more complex set of requirements that match the search. That is done by passing a `{}` instead of a string.
The list of parameters for `<field>` is extensive and is found [on the site](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-match-query.html).

An example of passing in parameters into message includes:

```
{
    "query": {
        "match" : {
            "name" : {
                "query" : "this is a test",
                "operator" : "and",
                "zero_terms_query": "all"
            }
        }
    }
}
```

##### operator parameter

```
{
    "query": {
        "match" : {
            "name" : {
                "query" : "frank norris",
                "operator" : "or",
            }
        }
    }
}
```

the `operator` works in a way that it will search for the `query` params based on spaces. So using `or` will search for documents with "frank" OR "norris". When no operator is provided, the default is to provide an OR.

#### match_phrase

Different from match, which will search for any words in the query, `match_phrase` will search for the entire phrase as a single query. Very useful for searching for quotes or sentences.
```
 {
  "query": {
    "match_phrase": {
      "street" : "tompkins place"
    }
  }
 }
```

#### match_phrase_prefix

Provides an ability to search for the beginning of words. Consider it a "poormans auto complete."

```
 {
  "query": { "match_phrase_prefix": {
      "name" : "Clymer st"
    }
  }
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