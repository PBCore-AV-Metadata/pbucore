# Handling 'essenceTrackSamplingRate.md'

convert to EBUCore unit of measure standard if necessary (it's not stated, but assume the more common kHz?), then use sampleRate property

```xml
<pbcoreInstantiationDocument>
  <instantiationEssenceTrack>
    <essenceTrackType>Audio</essenceTrackType>
    <essenceTrackSamplingRate unitsOfMeasure="kHz">44.1<essenceTrackSamplingRate>
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
  <ebucore:sampleRate>44.1</ebucore:sampleRate>
</rdf:Description>

```
