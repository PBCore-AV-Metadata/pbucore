# Handling 'pbcoreSubject'


EBUCore has hasSubject as property
SubjectClass is a free-text, also has Topic as a subclass of Subject

We recommend discarding the "subjectType" sub-property for the purpose of mapping and instead mapping directly to hasSubject or hasTopic, and then ideally using a URI in the class of Subject or Topic.

The exception here would be Folksonomies, which will be under a separate property (Folksonomy) until reviewed and incorporated as valid subject, topic, or descriptive data.

So, example for an asset with multiple different subjects and types:

```xml
<pbcoreDescriptionDocument>
  <pbcoreSubject subjectType="Keyword">Rats</pbcoreSubject>
  <pbcoreSubject subjectType="Topic">Rats as laboratory animals</pbcoreSubject>
  <pbcoreSubject subjectType="Folksonomy" annotation="Submitted by RobCOBrien through online portal">Rats of NIMH</pbcoreSubject>
</pbcoreDescriptionDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <ebucore:hasSubject ebucore:Subject="info:lc/authorities/sh85111538" />
  <ebucore:hasTopic ebucore:Topic="info:lc/authorities/sh85111545" />
  <ebucore:Folksonomy>Rats of NIMH, submitted by RobCOBrien through online portal</ebucore:Folksonomy>
</rdf:Description>
```
