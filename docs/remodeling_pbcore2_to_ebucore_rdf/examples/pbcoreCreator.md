# Handling `pbcoreCreator`, `creator`, and `creatorRole`

### Example: creator name is a literal.

> **NOTE:** All PBCore input is using PBCore 2.0 XML unless otherwise specified.<br />
> **NOTE:** All RDF output is in Turtle format unless otherwise specified.

PBCore input:
```xml
<pbcoreDescriptionDocument>
  <pbcorecreator>
    <creator>Alice</creator>
  </pbcorecreator>
</pbcoreDescriptionDocument>
```

RDF output
```
@prefix ebucore: <http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#> .
@prefix my: <http://example.org/my-namespace#> .

[] <about> my:00001 ;
  ebucore:hasCreator "Alice" .
```

### Example: creator name is a literal, creator affiliation is a literal, creator role is a literal.

PBCore input:
```xml
<pbcoreDescriptionDocument>
  <pbcorecreator>
    <creator affiliation="XYZ Productions">Alice</creator>
    <creatorRole>Director</creatorRole>
  </pbcorecreator>
</pbcoreDescriptionDocument>
```

RDF output:
```
@prefix ebucore: <http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#> .
@prefix my: <http://example.org/my-namespace#> .

[] <about> my:00001 ;
  ebucore:hasCreator my:00002 .

my:00002 a ebucore:Agent ;
  ebucore:agentName "Alice" ;
  ebucore:hasRole "Director" ;
  ebucore:hasAffiliation "XYZ Productions" .
```
> **TODO:** Not sure if range of `ebucore:hasAffiliation` can be a literal; ask Jean-Pierre Evain.


### Example: creator with a URI

PBCore input:
```xml
<pbcoreDescriptionDocument>
  <pbcorecreator>
     <creator ref="http://external.org/Alice" />
  </pbcorecreator>
</pbcoreDescriptionDocument>
```

RDF output:
```
@prefix ebucore: <http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#> .
@prefix my: <http://example.org/my-namespace#> .
@prefix external: <http://external.org/> .

[] <about> my:00001 ;
  ebucore:hasCreator external:Alice .
```

### Example: creator is a URI, and creator name is a literal

PBCore input:
```xml
<pbcoreDescriptionDocument>
  <pbcorecreator>
     <creator ref="http://external.org/Alice">Alice</creator>
  </pbcorecreator>
</pbcoreDescriptionDocument>
```

RDF output:
```
@prefix ebucore: <http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#> .
@prefix my: <http://example.org/my-namespace#> .
@prefix external: <http://external.org/> .
@prefix dc-terms: <http://purl.org/dc/terms/> .

[] <about> my:00001 ;
  ebucore:hasCreator my:00002 .

my:00002 a ebucore:Agent ;
  ebucore:agentName "Alice" ;
  dc-terms:references external:Alice .
```
> **TODO:** Is this the right namespace for DublinCore terms?<br />
> **TODO:** Is this an appropriate use for dc-terms:referenes? If not, what is an appropriate way to establish the relationship between our ebucore:Agent and an external URI?

### Example: creator name is a literal, creator role is a literal _and_ has a URI reference.

PBCore input:
```xml
<pbcoreDescriptionDocument>
  <pbcorecreator>
     <creator>Alice</creator>
     <creatorRole ref="http://pbcore.org/vocabularies/creatorRole#director">Director<creatorRole/>
  </pbcorecreator>
</pbcoreDescriptionDocument>
```


RDF output:
```
@prefix ebucore: <http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#> .
@prefix my: <http://example.org/my-namespace#> .

[] <about> my:00001 ;
  ebucore:hasCreator my:00002 .

my:00002 a ebucore:Agent ;
  ebucore:agentName "Alice" ;
  ebucore:hasRole <http://pbcore.org/vocabularies/creatorRole#director>, "Director" .
```
