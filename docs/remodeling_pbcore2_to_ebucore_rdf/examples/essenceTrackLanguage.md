# Handling 'essenceTrackLanguage'

same as instantiationLanguage


```xml
<pbcoreInstantiationDocument>
  <instantiationEssenceTrack>
    <essenceTrackType>Video</essenceTrackType>
    <essenceTrackLanguage source="ISO 639.2" ref="http://id.loc.gov/vocabulary/iso639-2/nld.html">nld</essenceTrackLanguage>
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
  <ebucore:hasLanguage rdf:resource="http://id.loc.gov/vocabulary/iso639-2/nld.html" />
</rdf:Description>

```
