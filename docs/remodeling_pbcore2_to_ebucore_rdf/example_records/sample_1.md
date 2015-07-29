## PBCore

```xml
<?xml version="1.0" encoding="UTF-8"?>
<pbcoreDescriptionDocument xsi:schemaLocation="http://www.pbcore.org/PBCore/PBCoreNamespace.html http://www.pbcore.org/xsd/pbcore-2.0.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.pbcore.org/PBCore/PBCoreNamespace.html">
<pbcoreAssetType>Program</pbcoreAssetDate>
<pbcoreAssetDate dateType="broadcast">1972-09-13</pbcoreAssetDate>
<pbcoreIdentifier source="AAPB NET Database">dslwerwevc23v</pbcoreIdentifier>
<pbcoreTitle titleType="Program">Attica: The Official Report of the New York State Special Commission</pbcoreTitle>
<pbcoreDescription descriptionType="Program Description">The program begins with a brief description of what occurred at Attica.  Commission Chairman McKay explains why the Special Commission was formed and outlines its aims.  The Commission studied the causes of the riot in order to prevent future prison revolts, he said.
Filmed sequences include scenes of prison life inside Attica.  The report also presents excerpts from testimony on prison living conditions, and drawings showing the original prison take-over.
The films taken by the New York State Police during the actual riot are presented as part of the Commission’s investigation.  The television report also contains excerpts from the testimony about the use of force to quell an uprising, taken in Rochester and Albany, New York.  Those testifying include state prison officials, inmates, state police, observers, and newsmen. Witnesses give testimony concerning their involvement in the attack.  McKay presents the Commission’s conclusions.
The Commission’s report concludes with an examination of current conditions inside Attica.  McKay discusses the possibility of similar uprising occurring again at Attica.</pbcoreDescription>
<pbcoreCreator>
<creator>Dixon, Don</creator>
<creatorRole>Executive Producer</creatorRole>
</pbcoreCreator>
<pbcoreCreator>
<creator>Prowitt, David</creator>
<creatorRole>Executive Producer</creatorRole>
</pbcoreCreator>
<pbcoreCreator>
<creator>Potts, Robert</creator>
<creatorRole>Producer</creatorRole>
</pbcoreCreator>
<pbcoreCreator>
<creator>Wilkman, John</creator>
<creatorRole>Producer</creatorRole>
</pbcoreCreator>
<pbcoreCreator>
<creator>Sameth, Jack</creator>
<creatorRole>Director</creatorRole>
</pbcoreCreator>
<pbcoreRightsSummary>
<rightsSummary>The special report on the findings of the Commission is a production for the New York State Special Commission on Attica.  It is made possible by the American Bar Association Commission on Correctional Facilities and Services under a grant from the Ford Foundation.</rightsSummary>
</pbcoreRightsSummary>

<!--these two annotations will be added by the AMS upon export, so they don't need to be in the NET database
<pbcoreAnnotation annotationType="last_modified">2013-06-02 17:06:13</pbcoreAnnotation>

<pbcoreAnnotation annotationType="organization">NET Collection</pbcoreAnnotation> -->

</pbcoreDescriptionDocument>
```

## EBUCore RDF/XML

```xml
<?xml version="1.0"?>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
            xmlns:dc="http://purl.org/dc/elements/1.1/"
			xmlns:ebucore="http://www.ebu.ch/metadata/ontologies/ebucore#"           
			xmlns:wgbh="http://www.wghexample.com/">

<rdf:Description about="wgbh:dslwerwevc23v">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <ebucore:dateBroadcast>1972-09-13</ebucore:dateBroadcast>
  <ebucore:title>Attica: The Official Report of the New York State Special Commission</ebucore:title>
  <ebucore:description>The program begins with a brief description of what occurred at Attica.  Commission Chairman McKay explains why the Special Commission was formed and outlines its aims.  The Commission studied the causes of the riot in order to prevent future prison revolts, he said.
Filmed sequences include scenes of prison life inside Attica.  The report also presents excerpts from testimony on prison living conditions, and drawings showing the original prison take-over.
The films taken by the New York State Police during the actual riot are presented as part of the Commission’s investigation.  The television report also contains excerpts from the testimony about the use of force to quell an uprising, taken in Rochester and Albany, New York.  Those testifying include state prison officials, inmates, state police, observers, and newsmen. Witnesses give testimony concerning their involvement in the attack.  McKay presents the Commission’s conclusions.
The Commission’s report concludes with an examination of current conditions inside Attica.  McKay discusses the possibility of similar uprising occurring again at Attica.</ebucore:description>
  <ebucore:hasCreator rdf:resource="wgbh:exampleplaceholder1" />
  <ebucore:hasCreator rdf:resource="wgbh:exampleplaceholder2" />
  <ebucore:hasCreator rdf:resource="wgbh:exampleplaceholder3" />
  <ebucore:hasCreator rdf:resource="wgbh:exampleplaceholder4" />
  <ebucore:hasCreator rdf:resource="wgbh:exampleplaceholder5" />
  <ebucore:hasRights rdf:resource="wgbh:exampleplaceholder6" />
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder1">
  <rdf:type rdf:resource="ebucore:Agent" />
  <ebucore:hasRole>Executive Producer</ebucore:role>
  <dc:references rdf:resource="wgbh:dslwerwevc23v" />
  <dc:references rdf:resource="wgbh:DonDixon" />
</rdf:Description>

<rdf:Description about="wgbh:DonDixon">
  <ebucore:agentName>Dixon, Don</ebucore:agentName>
  <rdf:type rdf:resource="ebucore:Agent" />
  <dc:references rdf:resource="wgbh:exampleplaceholder1">
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder2">
  <rdf:type rdf:resource="ebucore:Agent" />
  <ebucore:hasRole>Executive Producer</ebucore:role>
  <dc:references rdf:resource="wgbh:dslwerwevc23v" />
  <dc:references rdf:resource="wgbh:DavidProwitt" />
</rdf:Description>

<rdf:Description about="wgbh:DavidProwitt">
  <ebucore:agentName>Prowitt, David</ebucore:agentName>
  <rdf:type rdf:resource="ebucore:Agent" />
  <dc:references rdf:resource="wgbh:exampleplaceholder2">
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder3">
  <rdf:type rdf:resource="ebucore:Agent" />
  <ebucore:hasRole>Producer</ebucore:role>
  <dc:references rdf:resource="wgbh:dslwerwevc23v" />
  <dc:references rdf:resource="wgbh:RobertPotts" />
</rdf:Description />

<rdf:Description about="wgbh:RobertPotts">
  <ebucore:agentName>Potts, Robert</ebucore:agentName>
  <rdf:type rdf:resource="ebucore:Agent" />
  <dc:references rdf:resource="wgbh:exampleplaceholder3">
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder4">
  <rdf:type rdf:resource="ebucore:Agent" />
  <ebucore:hasRole>Producer</ebucore:role>
  <dc:references rdf:resource="wgbh:dslwerwevc23v" />
  <dc:references rdf:resource="wgbh:JohnWilkman" />
</rdf:Description>

<rdf:Description about="wgbh:JohnWilkmann">
  <ebucore:agentName>Wilkman, John</ebucore:agentName>
  <rdf:type rdf:resource="ebucore:Agent" />
  <dc:references rdf:resource="wgbh:exampleplaceholder4">
<rdf:Description />

<rdf:Description about="wgbh:exampleplaceholder5">
  <rdf:type rdf:resource="ebucore:Agent" />
  <ebucore:hasRole>Director</ebucore:role>
  <dc:references rdf:resource="wgbh:dslwerwevc23v" />
  <dc:references rdf:resource="wgbh:JackSameth" />
</rdf:Description>

<rdf:Description about="wgbh:JackSameth">
  <ebucore:agentName>Sameth, Jack</ebucore:agentName>
  <rdf:type rdf:resource="ebucore:Agent" />
  <dc:references rdf:resource="wgbh:exampleplaceholder5">
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder6">
  <rdf:type rdf:resource="ebucore:Rights" />
  <ebucore:applyTo rdf:resource="wgbh:dslwerwevc23v" />
  <ebucore:rightsExpression">The special report on the findings of the Commission is a production for the New York State Special Commission on Attica.  It is made possible by the American Bar Association Commission on Correctional Facilities and Services under a grant from the Ford Foundation.</ebucore:rightsExpression>
</rdf:Description>

</rdf:RDF>
```
