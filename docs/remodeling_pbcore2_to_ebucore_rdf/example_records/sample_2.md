## PBCore

```xml
<?xml version="1.0" encoding="UTF-8"?>
<pbcoreDescriptionDocument xsi:schemaLocation="http://www.pbcore.org/PBCore/PBCoreNamespace.html http://www.pbcore.org/xsd/pbcore-2.0.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.pbcore.org/PBCore/PBCoreNamespace.html">
<pbcoreAssetType>Program</pbcoreAssetDate>
<pbcoreAssetDate dateType="broadcast">1972-09-13</pbcoreAssetDate>
<pbcoreIdentifier source="AAPB NET Database">dslwerwevc23v</pbcoreIdentifier>
<pbcoreIdentifier source="NOLA">AFPR</pbcoreIdentifier>
<pbcoreTitle titleType="Program">Atoms for Power</pbcoreTitle>
<pbcoreDescription descriptionType="Program Description">This special is part of the American Assembly Conference on United States Policy in Atomic Energy Development which was held at Arden House, an extension of Columbia University.  The American Assembly was established by President Eisenhower in 1950 and holds non-partisan national conferences at Arden House, the Harriman Campus of Columbia University.  It also holds regional assemblies in several parts of the United States and publishes authoritative books on the national issues which have been discussed. Three members of the Twelfth American Assembly, Atoms for Power, appear in this program.  They are J. Carletto Ward, Jr.; Harold S. Vance, and Henry D. Smyth.  Host for this panel discussion is Henry M. Wriston, president of the American Assembly.
Mr. Ward is president of the Vitro Corporation of America, builders of nuclear reactors; Mr. Vance is a member of the United States Atomic Energy Commission and Mr. Smyth is a physicist.  Mr. Wriston is the former president of Brown University.
The men discuss the economies of nuclear power, the US nuclear power program, foreign policy aspects, government vs. private supervision and the current situation in the United States.</pbcoreDescription>
<pbcoreCreator>
<creator>META</creator>
<creatorRole>Producer</creatorRole>
</pbcoreCreator>
<pbcoreContributor>
<contributor>Ward, J. Carletto, Jr.</contributor>
<contributorRole>Panelist</contributorRole>
</pboreContributor>
<pbcoreContributor>
<contributor>Vance, Harold S.</contributor>
<contributorRole>Panelist</contributorRole>
</pboreContributor>
<pbcoreContributor>
<contributor>Smyth, Henry D.</contributor>
<contributorRole>Panelist</contributorRole>
</pboreContributor>
<pbcoreContributor>
<contributor>Wriston, Henry M.</contributor>
<contributorRole>Host</contributorRole>
</pboreContributor>
<pbcoreInstantiation>
<instantiationIdentifier source="WNET barcode">00010802</instantiationIdentifier>
<instantiationPhysical>Kinescope</instantiationPhysical>
<instantiationLocation>WNET: Room 2, Shelf 12</instantiationLocation>
<instantiationGenerations>Original</instantiationGenerations>
<instantiationDuration>00:30:00</instantiationDuration>
</pbcoreInstantiation>

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
  <ebucore:title>Atoms for Power</ebucore:title>
  <ebucore:description>This special is part of the American Assembly Conference on United States Policy in Atomic Energy Development which was held at Arden House, an extension of Columbia University.  The American Assembly was established by President Eisenhower in 1950 and holds non-partisan national conferences at Arden House, the Harriman Campus of Columbia University.  It also holds regional assemblies in several parts of the United States and publishes authoritative books on the national issues which have been discussed. Three members of the Twelfth American Assembly, Atoms for Power, appear in this program.  They are J. Carletto Ward, Jr.; Harold S. Vance, and Henry D. Smyth.  Host for this panel discussion is Henry M. Wriston, president of the American Assembly.
Mr. Ward is president of the Vitro Corporation of America, builders of nuclear reactors; Mr. Vance is a member of the United States Atomic Energy Commission and Mr. Smyth is a physicist.  Mr. Wriston is the former president of Brown University.
The men discuss the economies of nuclear power, the US nuclear power program, foreign policy aspects, government vs. private supervision and the current situation in the United States.</ebucore:description>
  <ebucore:hasCreator rdf:resource="wgbh:exampleplaceholder1" />
  <ebucore:hasContributor rdf:resource="wgbh:exampleplaceholder2" />
  <ebucore:hasContributor rdf:resource="wgbh:exampleplaceholder3" />
  <ebucore:hasContributor rdf:resource="wgbh:exampleplaceholder4" />
  <ebucore:hasContributor rdf:resource="wgbh:exampleplaceholder5" />
  <ebucore:hasAnnotation rdf:resource="wgbh:exampleplaceholder6" />
  <ebucore:hasFormat rdf:resource="wgbh:exampleplaceholder7" />
</rdf:Description>
  
<rdf:Description about="wgbh:exampleplaceholder1">
  <rdf:type rdf:resource="ebucore:Agent" />
  <ebucore:hasRole>Producer</ebucore:role>
  <dc:references rdf:resource="wgbh:dslwerwevc23v" />
  <dc:references rdf:resource="wgbh:META" />
</rdf:Description>

<rdf:Description about="wgbh:META">
  <ebucore:agentName>META</ebucore:agentName>
  <rdf:type rdf:resource="ebucore:Organization" />
  <dc:references rdf:resource="wgbh:exampleplaceholder1">
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder1">
  <rdf:type rdf:resource="ebucore:Agent" />
  <ebucore:hasRole>Producer</ebucore:role>
  <dc:references rdf:resource="wgbh:dslwerwevc23v" />
  <dc:references rdf:resource="wgbh:META" />
</rdf:Description>

<rdf:Description about="wgbh:META">
  <ebucore:agentName>META</ebucore:agentName>
  <rdf:type rdf:resource="ebucore:Organization" />
  <dc:references rdf:resource="wgbh:exampleplaceholder1">
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder2">
  <rdf:type rdf:resource="ebucore:Agent" />
  <ebucore:hasRole>Panelist</ebucore:role>
  <dc:references rdf:resource="wgbh:dslwerwevc23v" />
  <dc:references rdf:resource="wgbh:JCarlettoWardJr" />
</rdf:Description>

<rdf:Description about="wgbh:JCarlettoWardJr">
  <ebucore:agentName>Ward, J. Carletto, Jr.</ebucore:agentName>
  <rdf:type rdf:resource="ebucore:Agent" />
  <dc:references rdf:resource="wgbh:exampleplaceholder2">
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder3">
  <rdf:type rdf:resource="ebucore:Agent" />
  <ebucore:hasRole>Panelist</ebucore:role>
  <dc:references rdf:resource="wgbh:dslwerwevc23v" />
  <dc:references rdf:resource="wgbh:HaroldSVance" />
</rdf:Description>

<rdf:Description about="wgbh:HaroldSVance">
  <ebucore:agentName>Vance, Harold S.</ebucore:agentName>
  <rdf:type rdf:resource="ebucore:Agent" />
  <dc:references rdf:resource="wgbh:exampleplaceholder3">
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder4">
  <rdf:type rdf:resource="ebucore:Agent" />
  <ebucore:hasRole>Panelist</ebucore:role>
  <dc:references rdf:resource="wgbh:dslwerwevc23v" />
  <dc:references rdf:resource="wgbh:HenryDSmyth" />
</rdf:Description>

<rdf:Description about="wgbh:HenryDSmyth">
  <ebucore:agentName>Smyth, Henry D.</ebucore:agentName>
  <rdf:type rdf:resource="ebucore:Agent" />
  <dc:references rdf:resource="wgbh:exampleplaceholder4">
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder5">
  <rdf:type rdf:resource="ebucore:Agent" />
  <ebucore:hasRole>Panelist</ebucore:role>
  <dc:references rdf:resource="wgbh:dslwerwevc23v" />
  <dc:references rdf:resource="wgbh:HenryMWriston" />
</rdf:Description>

<rdf:Description about="wgbh:HenryMWriston">
  <ebucore:agentName>Wriston, Henry M.</ebucore:agentName>
  <rdf:type rdf:resource="ebucore:Agent" />
  <dc:references rdf:resource="wgbh:exampleplaceholder5">
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder6">
  <rdf:type rdf:resource="ebucore:Annotation" />  
  <ebucore:isAnnotationOf rdf:resource="wgbh:dslwerwevc23v" />
  <ebucore:textualAnnotation>Alternate identifier="APFR" @source="NOLA"</ebucore:textualAnnotation>
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder7">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <dc:isFormatOf rdf:resource="wgbh:dslwerwevc23v" />
  <ebucore:format>Kinescope</ebucore:format>
  <ebucore:locator>WNET: Room 2, Shelf 12</ebucore:locator>
  <ebucore:hasGenerations>Original</ebucore:hasGenerations>
  <ebucore:duration>00:30:00</ebucore:duration>
  <ebucore:hasAnnotation rdf:resource="wgbh:exampleplaceholder7">
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder8">
  <rdf:type rdf:resource="ebucore:Annotation" />  
  <ebucore:isAnnotationOf rdf:resource="wgbh:exampleplaceholder7" />
  <ebucore:textualAnnotation>Alternate identifier="00010802" @source="WNET barcode"</ebucore:textualAnnotation>
</rdf:Description>

</rdf:RDF>
```
