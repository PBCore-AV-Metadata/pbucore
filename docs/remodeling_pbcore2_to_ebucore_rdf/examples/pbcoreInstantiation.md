# Handling `pbcoreInstantiation and instantiationIdentifier

Idea floated of having all legacy (non-URI) identifiers be included as strings in an annotation, which allows for the retention of @source

Can we search for 'file name' and sent that to EBUCore's filename property?


```xml
<pbcoreDescriptionDocument>
  <pbcoreIdentifier source="WGBH NAMESPACE">12345</pbcoreIdentifier>
  <pbcoreInstantiation>
    <instantiationIdentifier source="WGBH NAMESPACE">0000313536</instantiationIdentifier>
    <instantiationIdentifier source="WGBH BARCODE">SL00176</instantiationIdentifier>
    <instantiationIdentifier annotation="file name">news_20071211.mp3</instantiationIdentifier>
    <instantiationPhysical source="PBCore instantiationPhysical" ref="http://metadataregistry.org/concept/show/id/1986.html">Betacam Digital (Digi Beta)</instantiationPhysical>
  </pbcoreInstantiation>
</pbcoreDescriptionDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <dc:hasFormat rdf:resource="http://example.com#0000313536" />
</rdf:Description>

<rdf:Description about="http://example.com#0000313536">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <dc:isFormatOf rdf:resource="http://example.com#12345" />
  <ebucore:hasAnnotation rdf:resource=""http://example.com#12346">
  <ebucore:filename>news_20071211.mp3</ebucore:filename>
</rdf:Description>

<rdf:Description about="http://example.com#12346">
  <rdf:type rdf:resource="ebucore:Annotation" />
  <ebucore:isAnnotationOf rdf:resource="http://example.com#0000313536" />
  <ebucore:textualAnnotation>legacy instantiation identifier: SL00176, source = WGBH Barcode</ebucore:textualAnnotation>
</rdf:Description>
```
