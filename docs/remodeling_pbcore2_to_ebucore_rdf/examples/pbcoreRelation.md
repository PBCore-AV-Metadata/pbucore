# Handling 'pbcoreRelation' and 'instantiationRelation'

EBUCore: hasRelatedResource, hasRelatedBusinessObject, hasRelatedEvent, isRelatedTo, hasRelatedMediaFragment

DublinCore object properties: hasFormat, isFormatOf, isPartOf, isReferencedBy, isReplacedBy, isRequiredBy, isVersionOf, hasVersion, requires, replaces, references, hasPart

properties to add to EBUCore: clonedTo/isClonedFrom, dubbedTo/isDubbedFrom, derivedTo/IsDerivedFrom 

These properties will map directly to relationType and relationIdentifier, as well as instantiationRelation, instantiationRelationType, and instantiationRelationIdentifier

**NOTE: in our previous analysis, we thought followsInSequence was a dc property, but now that I'm looking for it I can't find it?  Does this also need to be added?**

So, a couple different examples!

**To relate an Asset and an Instantiation**

```xml
<pbcoreDescriptionDocument>
  <pbcoreIdentifier source="MCU">MCU_a0567</pbcoreIdentifier>
  <pbcoreTitle>Death Is A Poor Man's Doctor</pbcoreTitle>
  <pbcoreDescription>Interviews from Detroit musicians</pbcoreDescription>
  <pbcoreInstantiation>
    <instantiationIdentifier source="McHale University">MCU_v0123_01</instantiationIdentifier>
    <instantiationLocation>McHale University</instantiationLocation>
  </pbcoreInstantiation>
</pbcoreDescriptionDocument>

```

```xml
<rdf:Description about="MCU_a0567">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <ebucore:title>Death Is A Poor Man's Doctor</ebucore:title>
  <ebucore:description>Interviews from Detroit musicians</a>
  <dc:hasFormat rdf:resource="MCU_v0123_01"/>
</rdf:Description>

<rdf:Description about="MCU_v0123_01">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <dc:isFormatOf rdf:resource="MCU_a0567" />
  <ebucore:locator>McHale University</ebucore:locator>
</rdf:Description>
```

**To relate two instantiations where one is dubbed from another**

```xml
<pbcoreDescriptionDocument>
  <pbcoreIdentifier source="MCU">MCU_a0567</pbcoreIdentifier>
  <pbcoreTitle>Death Is A Poor Man's Doctor</pbcoreTitle>
  <pbcoreDescription>Interviews from Detroit musicians</pbcoreDescription>
  <pbcoreInstantiation>
    <instantiationIdentifier source="McHale University">MCU_v0123_01</instantiationIdentifier>
    <instantiationLocation>McHale University</instantiationLocation>
    <instantiationRelation>
      <instantiationRelationType>Dubbed to</instantiationRelationType>
      <instantiationRelationIdentifier>MCU_v0123_02<instantiationRelationIdentifier>
    </instantiationRelation>
  </pbcoreInstantiation>
  <pbcoreInstantiation>
    <instantiationIdentifier source="McHale University">MCU_v0123_02</instantiationIdentifier>
    <instantiationLocation>McHale University</instantiationLocation>
    <instantiationRelation>
      <instantiationRelationType>Is Dub of</instantiationRelationType>
      <instantiationRelationIdentifier>MCU_v0123_01<instantiationRelationIdentifier>
    </instantiationRelation>
  </pbcoreInstantiation>
</pbcoreDescriptionDocument>

```

```xml
<rdf:Description about="MCU_a0567">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <ebucore:title>Death Is A Poor Man's Doctor</ebucore:title>
  <ebucore:description>Interviews from Detroit musicians</a>
  <dc:hasFormat rdf:resource="MCU_v0123_01" />
</rdf:Description>

<rdf:Description about="MCU_v0123_01">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <dc:isFormatOf rdf:resource="MCU_a0567" />
  <ebucore:locator>McHale University</ebucore:locator>
  <ebucore:dubbedTo rdf:resource="MCU_v0123_02" />
</rdf:Description>

<rdf:Description about="MCU_v0123_02">
  <rdf:type rdf:resource="ebucore:MediaResource" />
  <dc:isFormatOf rdf:resource="MCU_a0567" />
  <ebucore:locator>McHale University</ebucore:locator>
  <ebucore:isDubbedFrom rdf:resource="MCU_v0123_01" />
</rdf:Description>
```
