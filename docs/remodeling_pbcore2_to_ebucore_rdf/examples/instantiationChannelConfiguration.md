# Handling 'instantiationChannelConfiguration'

This also maps to numberofTracks (annotation Property)


```xml
<pbcoreInstantiationDocument>
  <instantiationChannelConfiguration>Ch. 1: Stereo L, Ch. 2: Stereo R, Ch. 3: DVS</instantiationChannelConfiguration>
</pbcoreInstantiationDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <ebucore:numberofTracks>Ch. 1: Stereo L, Ch. 2: Stereo R, Ch. 3: DVS</ebucore:numberofTracks>
</rdf:Description>
```
