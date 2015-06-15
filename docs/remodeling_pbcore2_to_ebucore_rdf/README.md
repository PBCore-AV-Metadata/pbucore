# Remodeling PBCore 2.x to EBUCore RDF

Expressing PBCore 2 metadata in EBUCore RDF is not always a straightforward
mapping. The process oftentimes requires converting your "strings to things",
which can involve some remodeling of the data.

[**These examples**](./example_list.md) are a guide to remodelling your PBCore
[**metadata into EBUCore RDF.

### How to RDF snippets in the examples

All examples of RDF snippets written in Notation3 assume the following:

```
@prefix ex:  <http://example.org#> .
@prefix ebucore: <http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#> .
```