
# CRUD Actions for Elastic Search 7.4

## Index & Types

Create an index, and type

## Create a index

curl -XPUT 'localhost:9200/verses?pretty=true'

curl -XPUT 'localhost:9200/ideas?pretty=true'

curl -XPUT 'localhost:9200/fruit?pretty=true'


## Create a type

```
curl -XPOST 'localhost:9200/products/books?pretty=true' -H 'Content-Type: application/json' -d'

{
  "name": "Numbers",
  "chapters": "36",
  "favorites": ["1","2","3", "13", "23", "24"]
}
'
```

```
curl -XPOST 'localhost:9200/fruit/apple?pretty=true' -H 'Content-Type: application/json' -d'

{
  "name": "apple",
  "color": "red",
  "price": "100"
}
'
```

```
curl -XPOST 'localhost:9200/fruit/apple?pretty=true' -H 'Content-Type: application/json' -d'

{
  "name": "granny",
  "color": "green",
  "price": "50"
}
'
```

## Viewing indexes

### View all of them
```
curl  'localhost:9200/_cat/indices?v&pretty'
```

### View a particular index

```
curl 'localhost:9200/products?pretty=true'
```


curl 'localhost:9200/products/books?pretty=true'


curl  -XGET 'localhost:9200/products/books/1?pretty=true'



# CRUD Matrix

## Indicies

### 1. Create Index

```
curl -XPUT 'localhost:9200/torah?pretty=true'
```

### 2. Read Index

```
curl -XGET 'localhost:9200/_cat/indices?pretty=true'
```


### 3. Update Index

coming soon...

### 4. Delete Index

```
curl -XDELETE 'localhost:9200/verses'
```


## Documents

### 5. Create Documents

```
curl -XPOST 'localhost:9200/torah/genesis?pretty=true' -H 'Content-Type: application/json' -d '
  {
    "chapter": "1",
    "verse": "1",
    "text": "In the beginning Elohim created heaven and earth"
  }'
```


```
curl -XPOST 'localhost:9200/torah/genesis/1?pretty=true' -H 'Content-Type: application/json' -d '
  {
    "chapter": "1",
    "verse": "1",
    "text": "In the beginning Elohim created Heaven and Earth"
  }'
```


```
curl -XPOST 'localhost:9200/torah/genesis/2?pretty=true' -H 'Content-Type: application/json' -d '
  {
    "chapter": "1",
    "verse": "2",
    "text": "The earth was without form and void, and darkness was over the face of the deep. And the Spirit of God was hovering over the face of the waters."
  }'
```

### 6. Read Single Documents

get all the `_source`
```
curl -XGET 'localhost:9200/torah/genesis/[id]?pretty=true'

```

no `_source`
```
curl -XGET 'localhost:9200/torah/genesis/[id]?pretty=true&_source=false'
```

get just a specific attribute from  `_source`
```
curl -XGET 'localhost:9200/torah/genesis/[id]?pretty=true&_source=chapter'
```

### 6. Read Multiple Documents

Use the `_mget` url property along with the `"docs" : [ ]`

Include the index in docs:

```
curl -XGET 'localhost:9200/_mget?pretty=true' -H 'Content-Type: application/json' -d '
{
  "docs" : [
    {
      "_index" : "torah",
      "_type" : "genesis",
      "_id" : "1"
    },
    {
      "_index" : "torah",
      "_type" : "genesis",
      "_id" : "2"
    }
  ]
}'
```

Include the index in the URL:

```
curl -XGET 'localhost:9200/torah/_mget?pretty=true' -H 'Content-Type: application/json' -d '
{
  "docs" : [
    {
      "_type" : "genesis",
      "_id" : "1"
    },
    {
      "_type" : "genesis",
      "_id" : "2"
    }
  ]
}'
```

Include the index and the type in the URL:

```
curl -XGET 'localhost:9200/torah/genesis/_mget?pretty=true' -H 'Content-Type: application/json' -d '
{
  "docs" : [
    {
      "_id" : "1"
    },
    {
      "_id" : "2"
    }
  ]
}'
```

### 7. Update Entire Documents

```
curl -XPUT 'localhost:9200/torah/genesis/jN-jPW4Bt6PUWxQFb1ar?pretty=true' -H 'Content-Type: application/json' -d '
{
  "chapter": "1",
  "verse": "1",
  "text": "In the beginning Elohim created Heaven and Earth."
}
'
```

### 7. Update Partial Documents

```
curl -XPUT 'localhost:9200/torah/genesis/_update/jt-wPW4Bt6PUWxQF4FYU?pretty=true' -H 'Content-Type: application/json' -d '
{
  "text": "In the beginning Elohim created Heaven and Earth."
}'
```

### 8. Delete Documents

```
curl -XDELETE 'localhost:9200/torah/genesis/jN-jPW4Bt6PUWxQFb1ar?pretty=true'
```

## Documents

### 9. Create Documents

```
curl -XGET 'localhost:9200/'
```

### 10. Read Documents

```
curl -XGET 'localhost:9200/'
```


### 11. Update Documents

```
curl -XGET 'localhost:9200/'
```

### 12. Delete Documents

```
curl -XGET 'localhost:9200/'
```