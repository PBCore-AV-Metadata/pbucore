# Handling 'instantiationEssenceTracks' and 'essenceTrackType'

Tracks become a new URI, associate those based on instantiation; the track is either classed as a VideoTrack or an AudioTrack depending on essenceTrackType (if not specified, just go to Track) 


```xml
<pbcoreInstantiationDocument>
  <instantiationEssenceTrack>
    <essenceTrackType>Video</essenceTrackType>
  </instantiationEssenceTrack>
  <instantiationEssenceTrack>
    <essenceTrackType>Audio</essenceTrackType>
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
</rdf:Description>

<rdf:Description about="http://example.com#12347">
  <rdf:type rdf:resource="ebucore:AudioTrack" />
  <ebucore:isTrackOf rdf:resource="http://example.com#12345" />
</rdf:Description>
```
```
