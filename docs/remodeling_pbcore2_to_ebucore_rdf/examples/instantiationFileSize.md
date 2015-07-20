# Handling 'instantiationFileSize'

EBUCore stipulates that the property 'fileSize' should be provided in bytes, so transform whatever the unitofMeasure is into bytes

```xml
<pbcoreInstantiationDocument>
  <instantiationFileSize unitsOfMeasure="MB">322</instantiationFileSize>
</pbcoreInstantiationDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <ebucore:fileSize>337641472</ebucore:fileSize>
</rdf:Description>
```
