# ResourceIndex

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'resource_index'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install resource_index

## Usage

TODO: Write usage instructions here

# RI Design

## Workflow Overview

Resources come from a variety of sources as output by [Resource Access Tools]()

## General Workflow

### From Scratch

- Introspect resource layout (column data) and create corresponding ElasticSearch document mapping
- Annotate documents using annotator dictionary and mgrep
- Store documents and annotations in ElasticSearch
    - Annotations are stored as follows:
        + Direct (int)
        + Ancestors (array of int)
    - Class ids are hashes of the ontology acronym and class URI created with xxhash

### Updating

It might be possible to update the Resource Index by looking at the dictionary generated by annotator and using the new labels to run a search in ElasticSearch and then just update the documents that contain hits for the new labels. The theory is that the dictionary actually doesn't change that much and so just looking for hits on the new labels would be better than re-annotating the entire corpus.

## ElasticSearch Configuration

The following is an example mapping for a PubMed abstract. The annotations are nested and just the tokens get stored, not the original json. Nesting them puts them in a separate index, allowing you to search just the annotations very quickly.

```json
{
    "mappings": {
        "citation": {
            "_source" : {
              "includes": ["title", "abstract"],
              "excludes": ["annotations"]
            },
            "properties": {
                "title": {
                  "type": "string"
                },
                "abstract": {
                  "type": "string"
                },
                "annotations": {
                    "type": "nested",
                    "properties": {
                        "direct": {"type": "long", "store": false, "include_in_all": false},
                        "ancestors": {"type": "long", "store": false, "include_in_all": false},
                        "count": {"type": "long", "store": false, "include_in_all": false}
                    }
                }
            }
        }
    }
}
```

### Index Size

For 29500 PubMed abstracts, here is the index size with annotations:

```
Included in _source and _all:    3699370427 bytes - 3527.9 GB
Excluded from _source and _all:  1695878836 bytes - 1617.3 GB
```

Not including the annotations is much better for index size at the cost of index updates. Annotations not included in the _source and _all will not be retrievable when getting the document (the information is tokenized and only the tokens are stored).

## Dictionary Cleaning

It's not clear how much we can prune the dictionary to remove things that will not be found or that are not useful. Some ideas:

- Remove stop words
- Remove phrases longer than N words (N = 4?)
- Remove parantheses

## Querying

### Direct Annotations

```json
{
   "query": {
      "nested": {
         "path": "annotations",
         "query": {
            "match": {
               "annotations.direct": 4242752354
            }
         }
      }
   }
}
```

### Hierarchy Annotations

```json
{
   "query": {
      "nested": {
         "path": "annotations",
         "query": {
            "match": {
               "annotations.ancestors": 3886062402
            }
         }
      }
   }
}
```

## Ruby Performance

The default MRI implementation of Ruby is not great at efficiently handling threads. There is a version of Ruby that can run in the JVM called Jruby, and switching to this provides a nice performance boost, especially as we can run the population process in threads to take advantage of a shared in-memory cache.

The code is written to work in both MRI or Jruby, but population should always be done using Jruby.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
