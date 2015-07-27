# Handling 'essenceTrackAnnotation'

same as with pbcoreAnnotation, use ebucore:hasAnnotation

Example:
```xml
<pbcoreInstantiationDocument>
  <instantiationEssenceTrack>
    <essenceTrackType>Video</essenceTrackType>
    <essenceTrackAnnotation>transcode error at 1:11:14</essenceTrackAnnotation>
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
  <ebucore:hasAnnotation rdf:resource="http://example.com#12347" />
</rdf:Description>

<rdf:Description about="http://example.com#12347">
  <rdf:type rdf:resource="ebucore:Annotation" />
  <ebucore:isAnnotationOf rdf:resource="http://example.com#12346" />
  <ebucore:textualAnnotation>transcode error at 1:11:14</ebucore:textualAnnotation>
</rdf:Description>
```
