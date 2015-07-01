# Handling 'pbcoreAudienceLevel'

hasTargetAudience [audienceLevel]

Example:

```xml
<pbcoreDescriptionDocument>
  <pbcoreAudienceLevel source="PBCore audienceLevel" ref="http://pbcore.org/vocabularies/pbcoreAudienceLevel#general">General</pbcoreAudienceLevel>
</pbcoreDescriptionDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <ebucore:hasTargetAudience>http://pbcore.org/vocabularies/pbcoreAudienceLevel#general</ebucore:hasTargetAudience>
</rdf:Description>
```
