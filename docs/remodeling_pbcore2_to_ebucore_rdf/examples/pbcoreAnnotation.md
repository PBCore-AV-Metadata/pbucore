# Handling 'pbcoreAnnotation'

use ebucore:hasAnnotation

Question: ebucore defines hasAnnotation with a range of class Annotation; can we just use it to provide straight text?

Example:

```xml
<pbcoreDescriptionDocument>
  <pbcoreAnnotation>This is the edited version produced for the Digital Learning Library</pbcoreAnnotation>
</pbcoreDescriptionDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <ebucore:hasAnnotation rdf:resource="http://example.com#12346">
</rdf:Description>

<rdf:Description about="http://example.com#12346">
  <rdf:type rdf:resource="ebucore:Annotation" />
  <ebucore:isAnnotationOf rdf:resource="http://example.com#12345" />
  <ebucore:textualAnnotation>This is the edited version produced for the Digital Learning Library</ebucore:textualAnnotation>
</rdf:Description>
```
