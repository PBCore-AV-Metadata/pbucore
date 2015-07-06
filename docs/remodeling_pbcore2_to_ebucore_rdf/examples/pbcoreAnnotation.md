# Handling 'pbcoreAnnotation'

use ebucore:hasAnnotation

Example:

```xml
<pbcoreDescriptionDocument>
  <pbcoreAnnotation>This is the edited version produced for the Digital Learning Library</pbcoreAnnotation>
</pbcoreDescriptionDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <ebucore:hasAnnotation>This is the edited version produced for the Digital Learning Library</ebucore:hasAnnotation>
</rdf:Description>
```
