# Handling 'essenceTrackAspectRatio.md'

essenceTrackBitDepth = bitDepth

```xml
<pbcoreInstantiationDocument>
  <instantiationEssenceTrack>
    <essenceTrackType>Video</essenceTrackType>
    <essenceTrackAspectRatio source="PBCore essenceTrackAspectRatio" ref="http://metadataregistry.org/conceptprop/list/concept_id/1444.html">16:9</essenceTrackAspectRatio>
  </instantiationEssenceTrack>
</pbcoreInstantiationDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <ebucore:hasTrack rdf:resource="http://example.com#12346" />
</rdf:Description>

<rdf:Description about="http://example.com#12346">
  <rdf:type rdf:resource="ebucore:VideoTrack" />
  <ebucore:isTrackOf rdf:resource="http://example.com#12345" />
  <ebucore:aspectRatio rdf:resource="http://metadataregistry.org/conceptprop/list/concept_id/1444.html" />
</rdf:Description>

```
