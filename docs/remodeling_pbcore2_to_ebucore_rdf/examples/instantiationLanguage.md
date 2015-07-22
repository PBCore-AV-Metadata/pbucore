# Handling 'instantiationLanguage'

instantiationLanguage = hasLanguage


```xml
<pbcoreInstantiationDocument>
  <instantiationLanguage source="ISO 639.2" ref="http://id.loc.gov/vocabulary/iso639-2/alg.html">alg</instantiationLanguage>
</pbcoreInstantiationDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <ebucore:hasLanguage rdf:resource="http://id.loc.gov/vocabulary/iso639-2/alg.html" />
</rdf:Description>
```
