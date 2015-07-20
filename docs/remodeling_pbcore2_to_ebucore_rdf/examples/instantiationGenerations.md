# Handling 'instantiationGenerations'

properties to add: hasGenerations, [GenerationClass?]


```xml
<pbcoreInstantiationDocument>
  <instantiationGenerations source="PBCore instantiationGenerations" ref="http://metadataregistry.org/concept/show/id/2294.html">Master: green label</instantiationGenerations>
</pbcoreInstantiationDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <ebucore:hasGenerations rdf:resource="http://metadataregistry.org/concept/show/id/2294.html" />
</rdf:Description>
```
