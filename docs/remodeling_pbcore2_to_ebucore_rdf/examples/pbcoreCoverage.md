# Handling 'pbcoreCoverage'

spatial coverage: hasLocation [location]
temporal coverage: hasCoverage [coverage] OR hasEvent [event]

Example:

```xml
<pbcoreDescriptionDocument>
  <pbcoreCoverage>
    <coverage>1607-1631</coverage>
    <coverageType annotation="historical">Temporal</coverageType>
  </pbcoreCoverage>
  <pbcoreCoverage>
    <coverage source="Wikipedia" ref="http://en.wikipedia.org/wiki/Werowocomoco">Werowocomoco</coverage>
    <coverageType source="PBCore coverageType" ref="http://metadataregistry.org/concept/show/id/2522.html">Spatial</coverageType>
  </pbcoreCoverage>
</pbcoreDescriptionDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <ebucore:hasCoverage>1607-1631</coverage>
  <ebucore:hasLocation ebucore:location="http://metadataregistry.org/concept/show/id/2522.html" />
</rdf:Description>
```
