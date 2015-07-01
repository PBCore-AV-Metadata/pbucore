# Handling 'pbcoreDescription'

EBUCore: annotation property resourceDescription

'description’ is the property, sub-properties: abstract, bookmark, comments, description, dopesheet, highlights, playlist, promotional information, publication status, review, script, summary, synopsis, table of contents

We want to add 'shot log,' but otherwise we feel we are covered by this list.  

So, example for an asset with multiple forms of description:

```xml
<pbcoreDescriptionDocument>
  <pbcoreDescription descriptionType="abstract">An animated film about escaped experimental rats.</pbcoreDescription>
  <pbcoreDescription descriptionType="script">NICODEMUS: Jonathan Brisby was killed today while helping with the Plan...</pbcoreDescription>
</pbcoreDescriptionDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <ebucore:abstract>An animated film about escaped experimental rats.</ebucore:abstract>
  <ebucore:script>NICODEMUS: Jonathan Brisby was killed today while helping with the Plan...</ebucore:script>
</rdf:Description>
```
