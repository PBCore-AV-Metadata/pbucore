# Handling `pbcoreTitle`

### Example 1: Contributor name as a literal.

PBCore xml input:
```xml
<pbcoreDescriptionDocument>
  <pbcoreIdentifier>12345</pbcoreIdentifier>
  <pbcoreContributor>
    <contributor>Alice</contributor>
  </pbcoreContributor>
</pbcoreDescriptionDocument>
```

RDF-XML output:
```xml
<rdf:Description rdf:about="http://example.org/12345">
  <ebucore:hasContributor>Alice</ebucore:hasContributor>
</rdf:Description>
```

### Example 2: Contributor name as a literal, with affiliation as a literal.

PBCore xml input:
```xml
<pbcoreDescriptionDocument>
  <pbcoreIdentifier>12345</pbcoreIdentifier>
  <pbcoreContributor>
    <contributor affiliation="Acme Co.">Alice</contributor>
  </pbcoreContributor>
</pbcoreDescriptionDocument>
```

RDF-XML output using blank node for contributor:
```xml
<rdf:Description rdf:about="http://example.org/12345">
  <rdf:type rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#EditorialObject" />
  <ebucore:hasContributor rdf:nodeID="001" />
</rdf:Description>

<rdf:Description rdf:nodeID="001">
  <rdf:type rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#Contributor" />
  <ebucore:agentName>Alice</ebucore:agentName>
  <ebucore:hasAffiliation>Acme Co.</ebucore:hasAffiliation>
</rdf:Description>
```

N3 output using blank nodes for contributor:
```xml
ex:12345 a ebucore:EditorialObject ;
  ebucore:hasContributor _:001 .

_:001 a ebucore:Contributor ;
  ebucore:agentName "Alice" ;
  ebucore:hasAffiliation "WGBH" .
```

### Example 3: Contrbutor name as a literal, contributor role as a literal, portrayal as a literal

PBCore XML input:
```xml
<!-- taken from pbcore.org example -->
<pbcoreDescriptionDocument>
  <pbcoreIdentifier>12345</pbcoreIdentifier>
  <pbcoreContributor>
     <contributor>Duvall, Robert</contributor
     <contributorRole portrayal="Eulis Dewey">Actor<contributorRole>
  </pbcoreContributor>
</pbcoreDescriptionDocument>
```

RDF-XML ouptut using blank nodes for contributor and portrayal:
```xml
<rdf:Description rdf:about="http://example.org/12345">
  <rdf:type rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#EditorialObject" />
  <ebucore:hasContributor rdf:nodeID="002" />
  <ebucore:hasCharacter rdf:nodeID="003" />
</rdf:Description>

<rdf:Description rdf:nodeID="002">
  <rdf:type rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#Cast" />
  <ebucore:isCharacter rdf:nodeID="003" />
  <ebucore:hasRole>Actor</ebucore:hasRole>
  <ebucore:agentName>Robert Duvall</ebucore:agentName>
</rdf:Description>

<rdf:Description rdf:nodeID="003">
  <rdf:type rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#Character" />
  <ebucore:agentName>Eulis Dewey</ebucore:agentName>
</rdf:Description>
```

N3 output using blank nodes for contributor and portrayal:
```
ex:12345 a ebucore:EditorialObject ;
  ebucore:hasContributor _:002 ;
  ebucore:hasCharacter _:003 .

_:002 a ebucore:Cast ;
  ebucore:isCharacter _:003 ;
  ebucore:hasRole "Actor" ;
  ebucore:agentName "Robert Duvall" .

_:003 a ebucore:Character ;
  ebucore:agentName "Eulis Dewey" .
```

RDF-XML output using blank node for contributor, and a literal for portrayal:
```xml
<rdf:Description rdf:about="http:://example.org/12345">
  <rdf:type rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#EditorialObject" />
  <ebucore:hasContributor>
    <rdf:Description rdf:nodeID="_:004">
      <rdf:type rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#Cast" />
      <ebucore:isCharacter>Eulis Dewey</ebucore:isCharacter>
      <ebucore:hasRole>Actor</ebucore:hasRole>
      <ebucore:agentName>Robert Duvall</ebucore:agentName>
    </rdf:Description>
  </ebucore:hasContributor>
</rdf:Description>
```

N3 output using blank node for contributor, and a literal for portrayal:
```
ex:1234 a ebucore:EditorialObject ;
  ebucore:hasContributor _:004 .

_:004 a ebucore:Cast ;
  ebucore:isCharacter "Eulis Dewey"
  ebucore:hasRole "Actor"
  ebucore:agentName "Robert Duvall"
```

### Example 4: Contributor with a URI

PBCore XML input:
```xml
<pbcoreDescriptionDocument>
  <pbcoreIdentifier>12345</pbcoreIdentifier>
  <pbcoreContributor>
     <!-- not sure if it's valid in PBCore to not have a value for <contributor> -->
     <contributor ref="http://dbpedia.org/page/Robert_Duvall" />
  </pbcoreContributor>
</pbcoreDescriptionDocument>
```

RDF-XML output:
```xml
<rdf:Description rdf:about="http://example.org/12345">
  <rdf:type rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#EditorialObject" />
  <ebucore:hasContrbutor rdf:about="http://dbpedia.org/page/Robert_Duvall" />
</rdf:Description>
```

N3 outpt:
```
ex:12345 a ebucore:EditorialObject ;
  ebucore:hasContributor <http://dbpedia.org/page/Robert_Duvall> .

<http://dbpedia.org/page/Robert_Duvall> a ebucore:Cast ;
```

### Example 5: Contributor with a URI and contributor name as literal

```xml
<pbcoreDescriptionDocument>
  <pbcoreIdentifier>12345</pbcoreIdentifier>
  <pbcoreContributor>
     <contributor ref="http://dbpedia.org/page/Robert_Duvall">Duvall, Robert</contributor>
  </pbcoreContributor>
</pbcoreDescriptionDocument>
```

RDF-XML output
```xml
<rdf:Description rdf:about="http://example.org/12345">
  <rdf:type rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#EditorialObject" />
  <ebucore:hasContributor rdf:about="http://dbpedia.org/page/Robert_Duvall" />
</rdf:Description>

<rdf:Description rdf:about="http://dbpedia.org/page/Robert_Duvall">
  <rdf:type rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#Cast" />
  <ebucore:agentName>Robert Duvall</ebucore:agentName>
</rdf:Description>
```

N3 output:
```
ex:12345 a ebucore:EditorialObject ;
  ebucore:hasContributor <http://dbpedia.org/page/Robert_Duvall> .

<http://dbpedia.org/page/Robert_Duvall> a ebucore:Cast ;
  ebucore:agentName "Robert Duvall"
```