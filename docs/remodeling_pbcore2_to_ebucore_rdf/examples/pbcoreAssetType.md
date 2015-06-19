# Handling 'pbcoreAssetType'

Again, we believe that most of the use cases here can be handled by classes and properties within EBUCore.  

Object Type is a class

Program is a superclass

Series is a superclass

Radio program is a class

TV program is a class

[object] hasObjectType [URI to controlled vocabulary]

Dealing with fragments (raw footage, clips, etc.): hasMediaFragment, contained within MediaResource

````
Example 1: Defining a clip as a MediaFragment

PBCore XML

<pbcoreDescriptionDocument>
  <pbcoreAssetType ref="http://metadataregistry.org/concept/show/id/1608.html">Clip</pbcoreGenre>
</pbcoreDescriptionDocument>

EBUCore RDF-XML

<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:MediaFragment"/>
  <ebucore:hasObjectType>http://metadataregistry.org/concept/show/id/1608.html</ebucore:hasObjectType>
</rdf:Description>
````
