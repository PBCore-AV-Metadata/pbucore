# Handling 'essenceTrackIdentifier'

As with other identifier properties, this either becomes the UID or is commuted to an annotation.

## If UID:

```xml
<pbcoreInstantiationDocument>
  <instantiationEssenceTrack>
    <essenceTrackType>Video</essenceTrackType>
    <essenceTrackIdentifier ref="ftp://WABC_drive2/edit1/sourcefiles/">98097.mov</essenceTrackIdentifier>
  </instantiationEssenceTrack>
</pbcoreInstantiationDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <ebucore:hasTrack rdf:resource="ftp://WABC_drive2/edit1/sourcefiles/" />
</rdf:Description>

<rdf:Description about="ftp://WABC_drive2/edit1/sourcefiles/98097.mov">
  <rdf:type rdf:resource="ebucore:VideoTrack" />
  <ebucore:isTrackOf rdf:resource="http://example.com#12345" />
</rdf:Description>

```

## If annotation

```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <ebucore:hasTrack rdf:resource="http://example.com#12346" />
</rdf:Description>

<rdf:Description about="http://example.com#12346">
  <rdf:type rdf:resource="ebucore:VideoTrack" />
  <ebucore:isTrackOf rdf:resource="http://example.com#12345" />
  <ebucore:hasAnnotation rdf:resource="http://example.com#12347">
</rdf:Description>

<rdf:Description about="http://example.com#12347">
  <rdf:type rdf:resource="ebucore:Annotation" />
  <ebucore:isTrackOf rdf:resource="http://example.com#12345" />
  <ebucore:isAnnotationOf rdf:resource="http://example.com#12345" />
  <ebucore:textualAnnotation>PBCore essenceTrackIdentifier: 98097.mov, ref ftp://WABC_drive2/edit1/sourcefiles/</ebucore:textualAnnotation>
</rdf:Description>

```
