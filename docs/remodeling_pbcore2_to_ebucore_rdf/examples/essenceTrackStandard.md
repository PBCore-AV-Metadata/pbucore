# Handling 'essenceTrackStandard'

Notes say 'same hasStandard property we’re asking for above' but in fact this is going to be more complicated because we're also asking people to use 'standard' to clarify encoding formats.  However, for basic NTSC/PAL info:


```xml
<pbcoreInstantiationDocument>
  <instantiationEssenceTrack>
    <essenceTrackType>Video</essenceTrackType>
    <essenceTrackStandard source="PBCore instantiationStandard/video" ref="http://metadataregistry.org/concept/show/id/3248.html">NTSC</essenceTrackStandard>
  </instantiationEssenceTrack>
</pbcoreInstantiationDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <ebucore:hasTrack rdf:resource="http://example.com#12346" />
  <ebucore:hasTrack rdf:resource="http://example.com#12347" />
</rdf:Description>

<rdf:Description about="http://example.com#12346">
  <rdf:type rdf:resource="ebucore:VideoTrack" />
  <ebucore:isTrackOf rdf:resource="http://example.com#12345" />
  <ebucore:hasStandard rdf:resource="http://metadataregistry.org/concept/show/id/3248.html" />
</rdf:Description>

```
