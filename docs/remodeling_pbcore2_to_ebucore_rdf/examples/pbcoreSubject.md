# Handling 'pbcoreSubject'


EBUCore has hasSubject as property
SubjectClass is a free-text, also has Topic as a subclass of Subject

We recommend discarding the "subjectType" sub-property, straight mapping to hasSubject or hasTopic, and then relying on a URI, except in cases of Folksonomies, which will be under a separate property Folksonomy)

So, example for an asset with multiple associated dates:

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
