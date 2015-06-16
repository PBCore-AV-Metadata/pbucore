# Handling `pbcoreContributor`, `contributor`, and `contributorRole`

### Example: Contributor name as a literal.

> **NOTE:** All PBCore input is using PBCore 2.0 XML unless otherwise specified.<br />
> **NOTE:** All RDF output is in Turtle format unless otherwise specified.

PBCore input:
```xml
<pbcoreDescriptionDocument>
  <pbcoreContributor>
    <contributor>Alice</contributor>
  </pbcoreContributor>
</pbcoreDescriptionDocument>
```

RDF output
```
@prefix ebucore: <http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#> .
@prefix my: <http://example.org/my-namespace#> .

[] <about> my:00001 ;
  ebucore:hasContrirbutor "Alice" .
```

### Example: Contributor name is a literal, contributor affiliation is a literal, contributor role is a literal.

PBCore input:
```xml
<pbcoreDescriptionDocument>
  <pbcoreContributor>
    <contributor affiliation="XYZ Productions">Alice</contributor>
    <contributorRole>Directory</contributorRole>
  </pbcoreContributor>
</pbcoreDescriptionDocument>
```

RDF output:
```
@prefix ebucore: <http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#> .
@prefix my: <http://example.org/my-namespace#> .

[] <about> my:00001 ;
  ebucore:hasContrirbutor my:00002 .

my:00002 a ebucore:Agent ;
  ebucore:agentName "Alice" ;
  ebucore:hasRole "Director" ;
  ebucore:hasAffiliation "XYZ Productions" .
```
> **TODO:** Not sure if range of `ebucore:hasAffiliation` can be a literal; ask Jean-Pierre Evain.


### Example: Contributor with a URI

PBCore input:
```xml
<pbcoreDescriptionDocument>
  <pbcoreContributor>
     <contributor ref="http://external.org/Alice" />
  </pbcoreContributor>
</pbcoreDescriptionDocument>
```

RDF output:
```
@prefix ebucore: <http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#> .
@prefix my: <http://example.org/my-namespace#> .
@prefix external: <http://external.org/> .

[] <about> my:00001 ;
  ebucore:hasContrirbutor external:Alice .
```

### Example: Contributor is a URI, and contributor name as literal

PBCore input:
```xml
<pbcoreDescriptionDocument>
  <pbcoreContributor>
     <contributor ref="http://external.org/Alice">Alice</contributor>
  </pbcoreContributor>
</pbcoreDescriptionDocument>
```

RDF output:
```
@prefix ebucore: <http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#> .
@prefix my: <http://example.org/my-namespace#> .
@prefix external: <http://external.org/> .
@prefix dc-terms: <http://purl.org/dc/terms/> .

[] <about> my:00001 ;
  ebucore:hasContrirbutor my:00002 .

my:00002 a ebucore:Agent ;
  ebucore:agentName "Alice" ;
  dc-terms:references external:Alice .
```
> **TODO:** Is this the right namespace for DublinCore terms?<br />
> **TODO:** Is this an appropriate use for dc-terms:referenes? If not, what is an appropriate way to establish the relationship between our ebucore:Agent and an external URI?

### Example: Contributor name as literal, contributor role is a literal _and_ has a URI reference.

PBCore input:
```xml
<pbcoreDescriptionDocument>
  <pbcoreContributor>
     <contributor>Alice</contributor>
     <contributorRole ref="http://pbcore.org/vocabularies/contributorRole#director">Director<contributorRole/>
  </pbcoreContributor>
</pbcoreDescriptionDocument>
```


RDF output:
```
@prefix ebucore: <http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#> .
@prefix my: <http://example.org/my-namespace#> .

[] <about> my:00001 ;
  ebucore:hasContrirbutor my:00002 .

my:00002 a ebucore:Agent ;
  ebucore:agentName "Alice" ;
  ebucore:hasRole <http://pbcore.org/vocabularies/contributorRole#director>, "Director" .
```
