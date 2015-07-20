# Handling 'instantiationDate'

Similarly to pbcoreAssetDate, the key here is to add specific properties to describe the kinds of date that we want to have covered.

date captured = dateDigitised
in an instantiation, date dubbed, date encoded, date mastered = dateCreated

properties to add: dateDeleted, dateIngested, dateMigrated, dateNormalized, dateTransferred, dateValidated



So, example for an asset with multiple associated dates:

```xml
<pbcoreDescriptionDocument>
  <instantiationDate dateType="Created">2000-08-14</instantiationDate>
  <instantiationDate dateType="Ingested">2000-09-14</instantiationDate>
</pbcoreDescriptionDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <ebucore:dateCreated>2000-08-14</ebucore:dateCreated>
  <ebucore:dateIngested>2000-09-14</ebucore:dateIngested>
</rdf:Description>
```
