# Handling 'pbcoreAssetDate'

Asset date = date created

EBUCore has date created, date digitized, date issued; match to one of these based on combination of asset date and dateType

Considers publication date as publication event 

Let’s state: asset date = date created
issued, podcast, webcast = date issued

copyrightdate is in Bibframe, so we recommend that people use that

properties to add: dateBroadcast, dateLicensed, endLicenseDate, dateDistributed

So, example for an asset with multiple associated dates:

```xml
<pbcoreDescriptionDocument>
  <pbcoreAssetDate dateType="Created">2000-08-14</pbcoreAssetDate>
  <pbcoreAssetDate dateType="Broadcast">2000-09-14</pbcoreAssetDate>
</pbcoreDescriptionDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <ebucore:dateCreated>2000-08-14</ebucore:dateCreated>
  <ebucore:dateBroadcast>2000-09-14</ebucore:dateBroadcast>
</rdf:Description>
```
