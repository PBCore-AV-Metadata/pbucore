> [how to read example RDF snippets](../README.md#)

# Handling `pbcoreIdentifier`

## Example 1: `pbcoreIdentifier` is _not_ a URI

```xml
<pbcoreDescriptionDocument>
  <pbcoreIdentifier source="some legacy system">xun1u</pbcoreIdentifier>
</pbcoreDescriptionDocument>
```


### Creating a new ID _and_ keeping the existing `pbcoreIdentifier` value

#### Without blank nodes

If we don't use blank nodes, then we don't have a good way of keeping the value of `pbcoreIdentifier[@source]`.

```
# EBUCore output in N3

ex:ox4ts a ebucore:EditorialObject
ex:ox4ts ebucore:identifier 'xun1u'
```

#### With blank nodes

**EBUCore output in N3:**
```
ex:ox4ts a ebucore:EditorialObject
ex:ox4ts ebucore:identifier [
  rdfs:label 'xun1u' ;
  ??? "some legacy system"
]
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