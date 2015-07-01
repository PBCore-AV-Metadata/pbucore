> [how to read example RDF snippets](../README.md#)

# Handling `pbcoreIdentifier`

## Example 1: `pbcoreIdentifier` is _not_ a URI

```xml
<pbcoreDescriptionDocument>
  <pbcoreIdentifier source="some legacy system">xun1u</pbcoreIdentifier>
</pbcoreDescriptionDocument>
```

### Creating a new ID _and_ keeping the existing `pbcoreIdentifier` value


If we don't use blank nodes, then we don't have a good way of keeping the value of `pbcoreIdentifier[@source]`.

```
# EBUCore output in N3

ex:ox4ts a ebucore:EditorialObject
ex:ox4ts ebucore:identifier 'xun1u'
```


```
# EBUCore output in N3
# ex:ox4ts is a newly created 

@prefix ex:  <http://example.org#> .
@prefix ebucore: <http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#> .

ex:ox4ts a ebucore:EditorialObject ;
  	ebucore:identifier 'xun1u' .

ebucore:identifier rdfs:Label 'some legacy system' .

```




```
# EBUCore output in N3
# ex:ox4ts is a newly created 

@prefix ex:  <http://example.org#> .
@prefix ebucore: <http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#> .

ex:ox4ts a ebucore:EditorialObject ;
  	ebucore:identifier 

 <rdf:Description about="ex:identifier">

 </rdf:Description>




```




**EBUCore RDF output:**
  1. Creating a new ID _and_ keeping the existing `pbcoreIdentifier` value
  2. No blank nodes
  2. Loses data for `pbcoreIdentifier[@source]`
```
ex:ox4ts a ebucore:EditorialObject
ex:ox4ts ebucore:identifier 'xun1u'
```

## Example 2: `pbcoreIdentifier` _is_ a URI


# Notes from Hackathon

Use ebucore:identifier

For institutions transforming PBCore XML data and using internal identifiers, recommend they set up a namespace (equivalent to @source), then provide guidelines for how to format a namespace

Other legacy identifiers that don’t need to be nodes can be put in an annotation
