# Handling 'instantiationMediaType'

instantiationPhysical/instantiationDigital maps to ‘hasAudioFormat’ or ‘hasVideoFormat’ depending on the information stored in Instantiation Media Type (if there is nothing stored here, it goes straight to ‘format’)


```xml
<pbcoreDescriptionDocument>
  <pbcoreIdentifier source="WGBH">12345</pbcoreIdentifier>
  <pbcoreInstantiation>
    <instantiationIdentifier>12346</instantiationIdentifier>
    <instantiationPhysical source="PBCore instantiationPhysical" ref="http://metadataregistry.org/concept/show/id/1986.html">Betacam Digital (Digi Beta)</instantiationPhysical>
    <instantiationMediaType source="PBCore instantiationMediaType" ref="http://metadataregistry.org/concept/show/id/1491.html">Moving Image</instantiationMediaType>
  </pbcoreInstantiation>
</pbcoreDescriptionDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <dc:hasFormat rdf:resource="http://example.com#12346" />
</rdf:Description>

<rdf:Description about="http://example.com#12346">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <dc:isFormatOf rdf:resource="http://example.com#12345" />
  <ebucore:hasVideoFormat rdf:resource="http://metadataregistry.org/concept/show/id/1986.html" />
</rdf:Description>

```
