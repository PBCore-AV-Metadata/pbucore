# pbcoreCollection

TODO

# pbcoreDescriptionDocument

TODO

# pbcoreAssetType

```xml
<pbcoreAssetType
  source="anything"
  ref="anything" 
  version="anything"
  annotation="anything">
    anything
</pbcoreAssetType>
```

In the OV and AAPB fixtures I have not found any of the attributes being used. Values do conform to any particular vocabulary.

## status quo

Mapped to ebucore:hasObjectType. All attributes are lost.

## proposals

For all tighten the schema by removing attributes.

### A

- status quo

### B

- Tighten schema by specifying vocabulary, and make the range URIs instead of just strings.

Unlikely, because this takes us farther away from the data we have in hand, and from EBUCore... but it is necessary if you want to have queries to find all X.


# pbcoreIdentifier

TODO


# pbcoreAssetDate

```xml
<pbcoreAssetDate
  dateType="anything">
    anything
</pbcoreAssetDate>
```

## status quo

Only those with dateType of "broadcast" are mapped, to pbcore:dateBroadcast, a new subproperty. The range is still just a string, limiting its future usefulness. (AAPB and OV represent dates differently, and there is some variety within OV.)

## proposals

- Under all proposals, tighten the schema to specify a date format.

### A

- If we only care about broadcast dates, then the schema might be changed to remove the attribue.

### B

- If we really need different types of dates, we should specify what those are in the schema, and create a subproperty for each.
    

# pbcoreTitle

```xml
<pbcoreTitle 
  titleType="anything" 
  source="anything" 
  ref="anything" 
  version="anything" 
  annotation="anything" 
  startTime="anything" 
  endTime="anything" 
  timeAnnotation="anything">
    anything
</pbcoreTitle>
```

In the OV and AAPB fixtures I have not found any of the attributes beyond titleType being used. titleType is usually "Program", "Series", or "Episode", but I have also seen "Image", "Clip", "Segment3", ...

## status quo
 
In the XSLT as it stands, `pbcoreTitle` is only preserved if `titleType` corresponds to one of small number of `dc:title` subproperties we will define. All other attributes are lost.

## proposals

For all, tighten PBCore schema so that the only attribute is `titleType`.

### A

- Tighten PBCore schema so it is restricted to "Program", "Series", or "Episode".
- If at ingest time we actually do encounter an unknown titleType, we might make a plain dc:title.

### B

- Concatenate all titles together, from least to most specific (or the reverse?)

Even less reversible, but we create no new properties, and at least for free text searching, the information is there.

### C

- Assume that a series title is present, in addition to other titles, it uniquely identifies a higher level asset: Use the information to create relationships between assets, rather than add a title to the asset.

On a case-by-case this might be feasible, but I don't think this is viable for something that could be run out-of-the-box.

# pbcoreSubject

# pbcoreDescription

# pbcoreGenre

# pbcoreRelation

# pbcoreCoverage

# pbcoreAudienceLevel

# pbcoreAudienceRating

# pbcoreCreator

# pbcoreContributor

# pbcorePublisher

# pbcoreRightsSummary

# pbcoreInstantiation

# pbcoreAnnotation

# pbcorePart

```xml
<pbcorePart>
  <!--pbcorePart can recurse-->
  <pbcoreIdentifier source="anything">anything</pbcoreIdentifier>
  <pbcoreTitle>anything</pbcoreTitle>
  <pbcoreDescription>anything</pbcoreDescription>
  <pbcoreCoverage>
	<coverage>anything</coverage>
	<coverageType>Spatial</coverageType>
  </pbcoreCoverage>
</pbcorePart>
```

I have not found any examples of usage.

## status quo

Not mapped.

## proposal

- Tighten the schema and remove this element.


# pbcoreExtension

```xml
<pbcoreExtension>
  <extensionWrap>
	<extensionElement>anything</extensionElement>
	<extensionValue>anything</extensionValue>
	<extensionAuthorityUsed>anything</extensionAuthorityUsed>
  </extensionWrap>
</pbcoreExtension>
<pbcoreExtension>
  <extensionEmbedded>
	<random>
	  <xml>anything</xml>
	</random>
  </extensionEmbedded>
</pbcoreExtension>
```

This is used in the OV data:

```
<pbcoreExtension>
  <extensionEmbedded annotation="Access control information">
    <SECURITY_POLICY_UOIS SEC_POLICY_ID="804"/>
  </extensionEmbedded>
</pbcoreExtension>
```

... but I don't think it's terribly useful to us going forward.

## status quo

Not mapped.

## proposal

- Tighten the schema and remove this element.