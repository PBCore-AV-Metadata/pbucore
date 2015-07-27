# Handling 'instantiationAlternativeModes'

use an annotation on the media resource for this information; if there’s anything important in this that’s mappable to PBCore, we recommend people break it out beforehand and use an existing EBUCore property

(Is it always necessary for the annotation to exist as a separate RDF resource, or can one make a textual annotation directly on another resource?  Question for Jean-Pierre!)


```xml
<pbcoreInstantiationDocument>
 <instantiationAlternativeModes>SAP in English</instantiationAlternativeModes>
</pbcoreInstantiationDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <ebucore:hasAnnotation rdf:resource="http://example.com#12346" />
</rdf:Description>

<rdf:Description about="http://example.com#12346">
  <rdf:type rdf:resource="ebucore:Annotation" />
  <ebucore:isAnnotationOf rdf:resource="http://example.com#12345" />
  <ebucore:textualAnnotation>PBCore instantiationAlternativeModes: SAP in English</ebucore:textualAnnotation>
</rdf:Description>
```
