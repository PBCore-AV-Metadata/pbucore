# Handling 'instantiationColors'

use hasColourCode (Jean-Pierre says this property exists, though it doesn't show up in the OWLdoc?  I find it in the XML on GitHub, though.)

Question: can we use hasColourCode with strings or alternate URIs, or does it have to be an EBUcore code?  

Example (if other URIs are allowable)

```xml
<pbcoreInstantiationDocument>
  <instantiationColors source="instantiationColors" ref="http://metadataregistry.org/conceptprop/list/concept_id/1484.html" annotation="sepia">Toned</instantiationColors>
</pbcoreInstantiationDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <ebucore:hasColourCode rdf:resource="http://metadataregistry.org/conceptprop/list/concept_id/1484.html" />
</rdf:Description>
```
