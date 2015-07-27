# Handling 'essenceTrackFrameRate.md'

essenceTrackFrameRate = frameRate (stated to be in fps)

PBCore suggests using annotations to indicate progressive or interlaced; can we automate sending that to ebucore:scanningFormat?

```xml
<pbcoreInstantiationDocument>
  <instantiationEssenceTrack>
    <essenceTrackType>Video</essenceTrackType>
    <essenceTrackFrameRate unitsOfMeasure="fps" annotation="progressive">50</essenceTrackFrameRate>
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
  <ebucore:frameRate>50</ebucore:frameRate>
  <ebucore:scanningFormat>progressive</ebucore:scanningFormat>
</rdf:Description>

```
