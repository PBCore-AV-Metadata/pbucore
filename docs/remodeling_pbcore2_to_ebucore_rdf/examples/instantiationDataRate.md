# Handling 'instantiationDataRate'

transform unitofMeasure into bits per second, then send to bitrate property

```xml
<pbcoreInstantiationDocument>
  <instantiationDataRate unitsOfMeasure="kbps">56</instantiationDataRate>   
</pbcoreInstantiationDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <ebucore:bitrate>56000</ebucore:bitrate>
</rdf:Description>
```
