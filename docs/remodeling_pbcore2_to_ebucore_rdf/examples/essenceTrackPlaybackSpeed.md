# Handling 'essenceTrackPlaybackSpeed.md'

No property for this in EBUCore yet.  
To get around the units of measure problem, suggest adding several properties: framesPerSecond, inchesPerSecond, rpm

```xml
<pbcoreInstantiationDocument>
  <instantiationEssenceTrack>
    <essenceTrackType>Audio</essenceTrackType>
    <essenceTrackPlaybackSpeed unitsOfMeasure="rpm">78</essenceTrackPlaybackSpeed>
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
  <ebucore:rpm>78</ebucore:rpm>
</rdf:Description>

```
The other option is to concatenate units of measure into one playbackSpeed property:

```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <ebucore:hasTrack rdf:resource="http://example.com#12346" />
</rdf:Description>

<rdf:Description about="http://example.com#12346">
  <rdf:type rdf:resource="ebucore:VideoTrack" />
  <ebucore:isTrackOf rdf:resource="http://example.com#12345" />
  <ebucore:playbackSpeed>78 rpm</ebucore:playbackSpeed>
</rdf:Description>

```
