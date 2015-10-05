## PBCore

```xml
<pbcoreDescriptionDocument xsi:schemaLocation="http://www.pbcore.org/PBCore/PBCoreNamespace.html http://www.pbcore.org/xsd/pbcore-2.0.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.pbcore.org/PBCore/PBCoreNamespace.html">
<pbcoreAssetType>Episode</pbcoreAssetDate>
<pbcoreAssetDate dateType="broadcast">1962-08-26</pbcoreAssetDate>
<pbcoreIdentifier source="AAPB NET Database">35fsdf52sfsf</pbcoreIdentifier>
<pbcoreIdentifier source="NOLA">ACER</pbcoreIdentifier>
<pbcoreTitle titleType="Series">About Ceramics</pbcoreTitle>
<pbcoreTitle titleType="Episode">Clay: Fountainhead of the Potter's Art</pbcoreTitle>
<pbcoreTitle titleType="Episode Number">1</pbcoreTitle>
<pbcoreDescription descriptionType="Series Description">About Ceramics explores the role of the potter in contemporary society.  Once the main supplier of functional clay objects, the potter has now become an artist.  He works in the shadow of a huge ceramic industry which overpowers him in production but cannot compete with his quality and creativity.  Professor Earl McCutchen, in a series of lecture-demonstrations, shows the artist’s work in clay and other materials and discusses the aesthetic principles and skills involved in ceramics. Earl McCutchen is a professor of art at the University of Georgia and one of America’s foremost ceramists.  He received his bachelor’s and master’s degrees in Ceramic Art from Ohio State University, and he studied ceramics for a year at Florence, Italy, under a Sarah H. Moss Fellowship.  Professor McCutchen has taught at the University of Georgia for 18 years.  His works are represented in collections of the Cleveland Museum of Art, the Cooper Union Museum of Decorative Arts, the Corning Museum of Glass, the International Business Machines Collection, and the Institute of Art Museum in Florence, the Institute of Art Museum in Florence, Italy.  In addition, his work has been exhibited throughout this country.  Professor McCutchen has also authored articles in the Journal of American Ceramic Society and Craft Horizons.  Throughout the series, Professor McCutchen is assisted by Miss Shirley Slater.</pbcoreDescription>
<pbcoreDescription descriptionType="Episode Description">In general, this episode serves as an introduction to the world of ceramics.  Professor McCutchen explores the ceramist’s work, his skills, and his aesthetic values.  Most of the episode is devoted to the actual creation of a ceramic object.  In addition, a number of technical details – the firing operation, temperatures required and the dry process – are described.</pbcoreDescription>
<pbcoreCreator>
<creator>WGTV</creator>
<creatorRole>Producer</creatorRole>
</pbcoreCreator>
<pbcoreCreator>
<creator>Michelson, Gene</creator>
<creatorRole>Director</creatorRole>
</pbcoreCreator>
<pbcoreCreator>
<creator>Dress, Sam</creator>
<creatorRole>Director</creatorRole>
</pbcoreCreator>
<pbcoreContributor>
<contributor>McCutchen, Earl</contributor>
<contributorRole>Host</contributorRole>
</pboreContributor>
<pbcoreInstantiation>
<instantiationIdentifier source="WNET barcode">00154802</instantiationIdentifier>
<instantiationPhysical>Videotape</instantiationPhysical>
<instantiationLocation>WNET: Room 2, Shelf 12</instantiationLocation>
<instantiationGenerations>Original</instantiationGenerations>
<instantiationDuration>00:30:00</instantiationDuration>
<instantiationColors>Color</instantiationColors>
</pbcoreInstantiation>
<instantiationIdentifier source="WGBH barcode">215673</instantiationIdentifier>
<instantiationPhysical>2 inch videotape</instantiationPhysical>
<instantiationLocation>WGBH: Row 43, Bay 2, Shelf 2</instantiationLocation>
<instantiationGenerations>Master</instantiationGenerations>
<instantiationDuration>00:28:58</instantiationDuration>
<instantiationColors>Color</instantiationColors>
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

<rdf:Description about="wgbh:35fsdf52sfsf">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <ebucore:dateBroadcast>1962-08-26</ebucore:dateBroadcast>
  <ebucore:title>Clay: Fountainhead of the Potter's Art</ebucore:title>
  <ebucore:title>Episode 1</ebucore:title>
  <ebucore:isEpisodeOf rdf:resource="wgbh:exampleplaceholder1" />
  <ebucore:description>In general, this episode serves as an introduction to the world of ceramics.  Professor McCutchen explores the ceramist’s work, his skills, and his aesthetic values.  Most of the episode is devoted to the actual creation of a ceramic object.  In addition, a number of technical details – the firing operation, temperatures required and the dry process – are described.</ebucore:description>
  <ebucore:hasCreator rdf:resource="wgbh:exampleplaceholder2" />
  <ebucore:hasCreator rdf:resource="wgbh:exampleplaceholder3" />
  <ebucore:hasCreator rdf:resource="wgbh:exampleplaceholder4" />
  <ebucore:hasContributor rdf:resource="wgbh:exampleplaceholder5" />
  <ebucore:hasFormat rdf:resource="wgbh:exampleplaceholder6" />
  <ebucore:hasFormat rdf:resource="wgbh:exampleplaceholder7" />
  <ebucore:hasAnnotation rdf:resource="wgbh:exampleplaceholder8" />
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder1">
  <rdf:type rdf:resource="ebucore:Series" />
  <ebucore:title>About Ceramics</ebucore:title>
  <ebucore:hasEpisode rdf:resource="wgbh:35fsdf52sfsf" />
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder2">
  <rdf:type rdf:resource="ebucore:Agent" />
  <ebucore:hasRole>Producer</ebucore:hasRole>
  <dc:references rdf:resource="wgbh:dslwerwevc23v" />
  <dc:references rdf:resource="wgbh:WGTV" />
</rdf:Description>

<rdf:Description about="wgbh:WGTV">
  <ebucore:agentName>WGTV</ebucore:agentName>
  <rdf:type rdf:resource="ebucore:Organization" />
  <dc:references rdf:resource="wgbh:exampleplaceholder2" />
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder3">
  <rdf:type rdf:resource="ebucore:Agent" />
  <ebucore:hasRole>Director</ebucore:hasRole>
  <dc:references rdf:resource="wgbh:dslwerwevc23v" />
  <dc:references rdf:resource="wgbh:GeneMichelson" />
</rdf:Description>

<rdf:Description about="wgbh:GeneMichelson">
  <ebucore:agentName>Michelson, Gene</ebucore:agentName>
  <rdf:type rdf:resource="ebucore:Organization" />
  <dc:references rdf:resource="wgbh:exampleplaceholder3" />
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder4">
  <rdf:type rdf:resource="ebucore:Agent" />
  <ebucore:hasRole>Director</ebucore:hasRole>
  <dc:references rdf:resource="wgbh:dslwerwevc23v" />
  <dc:references rdf:resource="wgbh:SamDress" />
</rdf:Description>

<rdf:Description about="wgbh:SamDress">
  <ebucore:agentName>Dress, Sam</ebucore:agentName>
  <rdf:type rdf:resource="ebucore:Organization" />
  <dc:references rdf:resource="wgbh:exampleplaceholder4" />
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder5">
  <rdf:type rdf:resource="ebucore:Agent" />
  <ebucore:hasRole>Host</ebucore:hasRole>
  <dc:references rdf:resource="wgbh:dslwerwevc23v" />
  <dc:references rdf:resource="wgbh:EarlMcCutchen" />
</rdf:Description>

<rdf:Description about="wgbh:EarlMcCutchen">
  <ebucore:agentName>McCutchen, Earl</ebucore:agentName>
  <rdf:type rdf:resource="ebucore:Organization" />
  <dc:references rdf:resource="wgbh:exampleplaceholder5" />
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder6">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <dc:isFormatOf rdf:resource="wgbh:dslwerwevc23v" />
  <ebucore:format>Videotape</ebucore:format>
  <ebucore:locator>WNET: Room 2, Shelf 12</ebucore:locator>
  <ebucore:hasGenerations>Original</ebucore:hasGenerations>
  <ebucore:duration>00:30:00</ebucore:duration>
  <ebucore:hasColourCode>Color</ebucore:hasColourCode>
  <ebucore:hasAnnotation rdf:resource="wgbh:exampleplaceholder9" />
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder7">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <dc:isFormatOf rdf:resource="wgbh:dslwerwevc23v" />
  <ebucore:format>2 inch videotape</ebucore:format>
  <ebucore:locator>WGBH: Row 43, Bay 2, Shelf 2</ebucore:locator>
  <ebucore:hasGenerations>Master</ebucore:hasGenerations>
  <ebucore:duration>00:30:00</ebucore:duration>
  <ebucore:hasColourCode>00:28:58</ebucore:hasColourCode>
  <ebucore:hasAnnotation rdf:resource="wgbh:exampleplaceholder10" />
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder8">
  <rdf:type rdf:resource="ebucore:Annotation" />  
  <ebucore:isAnnotationOf rdf:resource="wgbh:35fsdf52sfsf" />
  <ebucore:textualAnnotation>Alternate identifier="ACER" @source="NOLA"</ebucore:textualAnnotation>
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder9">
  <rdf:type rdf:resource="ebucore:Annotation" />  
  <ebucore:isAnnotationOf rdf:resource="wgbh:exampleplaceholder7" />
  <ebucore:textualAnnotation>Alternate identifier="00154802" @source="WNET Barcode"</ebucore:textualAnnotation>
</rdf:Description>

<rdf:Description about="wgbh:exampleplaceholder10">
  <rdf:type rdf:resource="ebucore:Annotation" />  
  <ebucore:isAnnotationOf rdf:resource="wgbh:exampleplaceholder8" />
  <ebucore:textualAnnotation>Alternate identifier="215673" @source="WGBH Barcode"</ebucore:textualAnnotation>
</rdf:Description>

</rdf:RDF>
```
