# Handling 'essenceTrackFrameSize.md'

Break out into width and height (not sure what to do with source/ref/annotation info though?  Send to another annotation property?)

```xml
<pbcoreInstantiationDocument>
  <instantiationEssenceTrack>
    <essenceTrackType>Video</essenceTrackType>
    <essenceTrackFrameSize source="PBCore essenceTrackFrameSize" ref="http://metadataregistry.org/conceptprop/list/concept_id/1461.html" annotation="full screen">720x480</essenceTrackFrameSize>
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
  <ebucore:width>720</ebucore:width>
  <ebucore:height>480</ebucore:width>
  <ebucore:hasAnnotation rdf:resource="http://example.com#12347" />
</rdf:Description>

<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:Annotation" />
  <ebucore:isAnnotationOf rdf:resource="http://example.com#12346" />
  <ebucore:textualAnnotation>Full screen</ebucore:textualAnnotation>
</rdf:Description>

```
