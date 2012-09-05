#Databases 
Types of databases and terminology (from JC Grubbs)

## Relational

ex; postgresSQL, MySQL, SQL Server, Oracle, SQLite

go-to for most web app backends.

based around structuring w/ tables, columns, rows -> through foreign keys.

Pros; great support (Active Record)

Cons; scaling on big user groups.

## Graph

ex; Neo4j, Filament, InfiteGraph, VertexDB

important when connections between indivituals - like a social network.

Great for certain use cases


## Key-value

Redis, Memcashed, Tokyo Cabinet, Riak

Best used

Most web apps use more than one data-store lightweight to server different purpose, short-term data for more than a few seconds, but will be thrown away after a period of time.

## Document

ex; MongoDB, CouchDB, RavenDB

Figure out what are the common things that belong together and group them into a single structure.

pros: scaling is built in, preparing for large users.

pros: pulls all content at once.

example; Wufoo will have a lot of optional fields that are available, but not required. Document would be more capable of handling the dynamic nature of the web apps's service.

cons; query from a lot of different sources from same source.

## Column family (least used)

ex; LucidDB, FluidDB, GreenPlum

Amazon Dynamo and other really big data centers. 
Optimized for aggregations and bulk update

## Factors to consider;

_indexing_

Goal is to speed up access.

* ? (Slowest things; database calls, then memory, )

Index optimized for how the application will use the data.

First place to go when you have performance issues.

"Are my indices right?"


_Querying_

_Scaling_

How many users can be accessing the data at any one time?

Scale up vs. Scaling out. 
Up - add more memory to single server

Out - take smaller servers and divide DB

_Modeling_

Is your schema fixed, or flexible?


_Mapping_

What am I going to do in the application layer?

Most rails apps map back to primitive ruby items.


_Analyzing_

At some point we need to perform analytics, "what's the most used feature?", etc.

_Recovering_

Never put something into production unless you know how to recover if the DB dies? How do I back up? 


## When we get a lot of users

1. scaling - move your web servers up first.

2. Then DB concerns. Look into computing capacity, or switch to a distributed structure.

- is it an indexing issue?

- or not enough 'power' to handle requests


## Symptoms and solutions;

- user monitoring tools and focus your attention on slowest piece of the pipeline.

- New Relic (heroku plugin to help figure out traffic bottleneck) 


## Questions in database planning

- Am I going to get 1

- M users, or 10k users 6 months from now.

## Optimization

_1. Universal_

- what is my platform's indexing options

- duplication - while sometimes it's not preferred, it might be the most pragmatic way to solve the problem.

_2. Relational_

- De-normalization

- Pivoting - Take data structure and flip rows and columns. 
- Materialized views - (Not typically done in rails)

_3. Non-relational_

- Nested relationships

- parallel queries

## Adding an index

Adding an index will help the database view content while limiting the calls to the disk.

_Example syntax_

add_index(:users, [:email], unique:true)

- there's an art to what fields you put an index on. 


