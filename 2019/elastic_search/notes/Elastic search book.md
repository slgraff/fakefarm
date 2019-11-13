# Elastic search book


- Installation
    - brew install
## Getting started

### run `elasticsearch`
### configurations

Can happen in a settings or a command line. Simple node and cluster names can be done at the command line like so:

```
    elasticsearch -Ecluster.name=fakefarm -Enode.name=dadzoo
```


### health checks
- localhost:9200

#### curl 'localhost:9200/_cat/health?v&pretty'

This will return a group of content that looks like this, but at a horizontal level:

```
epoch 1572983490
timestamp 19:51:30
cluster fakefarm
status fakefarm
node.total 1
node.data 1
shards 0
pri 0
relo 0
init 0
unassign 0
pending_tasks 0
max_task_wait_time -
active_shards_percent 100%
```

##### Look at localhost:/9200/_cat
This is a collection of content for health checks


### HTTP
### CRUD
- create indices
`curl -XPUT localhost:9200/products`
### JSON
### Query

Context
A collection of portions which make this work.
- included
- relevance score


### Filter
A yes/no

#### params
#### body
### Terminology
### Aggregations
### Concepts
### Response
### Links

