# Handling 'essenceTrackEncoding'

essenceTrackEncoding = hasEncodingFormat.
f the track type is video or audio as specified, use hasAudioEncodingFormat or hasVideoEncodingFormat



```xml
<pbcoreInstantiationDocument>
  <instantiationEssenceTrack>
    <essenceTrackType>Video</essenceTrackType>
    <essenceTrackEncoding source="PBCore essenceTrackEncoding" ref="http://metadataregistry.org/concept/show/id/2889.html">H.264/MPEG-4 AVC: QuickTime H.264 </essenceTrackEncoding>
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
  <ebucore:hasVideoEncodingFormat rdf:resource="http://metadataregistry.org/concept/show/id/2889.html" />
</rdf:Description>

```
