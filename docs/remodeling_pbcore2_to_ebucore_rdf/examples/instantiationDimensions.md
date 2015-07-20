# Handling 'instantiationDimensions'

In most cases, EBUCore specifies a unit of measure in the definition of a property.  This is not easy for instantiationDimensions because of its multiple uses within the context of PBCore.  

properties to add: hasDimensions, concatenate unitofMeasure
(or use blank nodes?  This is still under discussion.)  

Two ways we might do this:

## Concatenated units of measure

```xml
<pbcoreDescriptionDocument>
  <instantiationDimensions unitsofmeasure="inches">5x7</instantiationDimensions>
</pbcoreDescriptionDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <ebucore:hasDimensions>5x7 inches</ebucore:hasDimensions>
</rdf:Description>
```

## Blank nodes

```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <ebucore:hasDimensions rdf:nodeID="dimensions" />
</rdf:Description>

<rdf:Description rdf:nodeID="dimensions">
  <ebucore:dimensions>5x7</ebucore:dimensions>
  <ebucore:unitsofmeasure>inches</ebucore:unitsofmeasure>
</rdf:Description>
```
