# Handling `pbcoreGenre`
 
## Without URIs
 
*pbcore xml
<pbcoreDescriptionDocument>
  <pbcoreGenre>Documentary</pbcoreGenre>
</pbcoreDescriptionDocument>
```
*EBUCore RDF-XML 
 
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <ebucore:Genre>Documentary</ebucore:Genre>
</rdf:Description>
```
 
## With URIs
 
*xml
<pbcoreDescriptionDocument>
  <pbcoreGenre ref="http://www.loc.gov/rr/mopic/miggen.html#Documentary">Documentary</pbcoreGenre>
</pbcoreDescriptionDocument>
 
*EBUCore RDF-XML 
 
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <ebucore:Genre>http://www.loc.gov/rr/mopic/miggen.html#Documentary</ebucore:Genre>
</rdf:Description>
```
