# Handling 'pbcoreRightsSummary'

Object has Rights Associated (this is an context specific identifier) <br />
Rights Associated has a Rights Statement/Summary <br /> 
Rights Associated has a Start Time <br /> 
Rights Associated has an End Time <br />

ebuccdm seems to have some necessary properties that ebucore doesn't, specifically the ability to link a rights statement back to the editorial object or media resource that it's describing -- should we pull those in?  Ask Jean-Pierre

ebucore definitely does not have a rightsStartDate and rightsEndDate property, so we will need to ask Jean-Pierre to add those as well.  

Example:

```xml
<pbcoreDescriptionDocument>
  <pbcoreRightsSummary startTime="2005" endTime="2100">
  <rightsSummary source="Creative Commons" ref="http://creativecommons.org/licenses/by/3.0" version="3.0">CC BY 3.0</rightsSummary>
</pbcoreDescriptionDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <ebucore:hasRights ebucore:Rights="http://example.com#12346" />
</rdf:Description>

<rdf:Description about="http://example.com#12346">
  <rdf:type rdf:resource="ebucore:Rights" />
  <ebuccdm:applyTo rdf:resource="http://example.com#12345" />
  <ebucore:rightsLink>http://creativecommons.org/licenses/by/3.0</ebucore:rightsLink>
  <ebucore:rightsExpression>CC BY 3.0</ebucore:rightsExpression>
  <ebucore:rightsStartDate>2005</ebucore:rightsStartDate>
  <ebucore:rightsEndDate>2100</ebucore:rightsEndDate>
</rdf:Description>
```
