# Handling 'instantiationPhysical' and'instantiationDigital'

The use of 'format' will cover both here -- we don't need to specify physical/digital when we're stating what the format is directly. 

Example:

```xml
<pbcoreDescriptionDocument>
  <pbcoreIdentifier source="WGBH">12345</pbcoreIdentifier>
  <pbcoreInstantiation>
    <instantiationIdentifier>12346</instantiationIdentifier>
    <instantiationPhysical source="PBCore instantiationPhysical" ref="http://metadataregistry.org/concept/show/id/1986.html">Betacam Digital (Digi Beta)</instantiationPhysical>
  </pbcoreInstantiation>
  <pbcoreInstantiation>
    <instantiationIdentifier>12347</instantiationIdentifier>
    <instantiationDigital source="IANA MIME Media types" ref="http://www.iana.org/assignments/media-types/video/H264">H264</instantiationDigital>
  </pbcoreInstantiation>
</pbcoreDescriptionDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <dc:hasFormat rdf:resource="http://example.com#12346" />
  <dc:hasFormat rdf:resource="http://example.com#12347" />
</rdf:Description>

<rdf:Description about="http://example.com#12346">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <dc:isFormatOf rdf:resource="http://example.com#12345" />
  <ebucore:format rdf:resource="http://metadataregistry.org/concept/show/id/1986.html" />
</rdf:Description>

<rdf:Description about="http://example.com#12346">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <dc:isFormatOf rdf:resource="http://example.com#12345" />
  <ebucore:format rdf:resource="http://www.iana.org/assignments/media-types/video/H264" />
</rdf:Description>
```
