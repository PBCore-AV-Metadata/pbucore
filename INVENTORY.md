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

TODO

# pbcoreDescription

TODO

# pbcoreGenre

TODO

# pbcoreRelation

TODO

# pbcoreCoverage

TODO

# pbcoreAudienceLevel

TODO

# pbcoreAudienceRating

TODO

# pbcoreCreator / pbcoreContributor / pbcorePublisher

```xml
<pbcoreCreator>
  <creator 
	  affiliation="anything" 
	  ref="anything" 
	  annotation="anything" 
	  startTime="anything" 
	  endTime="anything" 
	  timeAnnotation="anything">
    anything
  </creator>
  <creatorRole 
	  source="anything" 
	  ref="anything" 
	  version="anything" 
	  annotation="anything">
    anything
  </creatorRole>
</pbcoreCreator>
<pbcoreContributor>
  <contributor 
	  affiliation="anything" 
	  ref="anything" 
	  annotation="anything" 
	  startTime="anything" 
	  endTime="anything" 
	  timeAnnotation="anything">
    anything
  </contributor>
  <contributorRole 
	  portrayal="anything" 
	  source="anything" 
	  ref="anything" 
	  version="anything" 
	  annotation="anything">
    anything
  </contributorRole>
</pbcoreContributor>
<pbcorePublisher>
  <publisher 
	  affiliation="anything" 
	  ref="anything" 
	  annotation="anything" 
	  startTime="anything" 
	  endTime="anything" 
	  timeAnnotation="anything">
    anything
  </publisher>
  <publisherRole 
	  source="anything" 
	  ref="anything" 
	  version="anything" 
	  annotation="anything">
    anything
  </publisherRole>
</pbcorePublisher>
```

I have found a handful of uses of the affiliation attribute:

```xml
<creator affiliation="WGBH-TV">Morganthau, Henry</creator>
<contributor affiliation="WGBH Educational Foundation">Davis, Al</contributor>
<contributor affiliation="City University of New York. City College">Clark, Kenneth Bancroft, 1914-2005</contributor>
```

The ref attribute is actually used frequently on creatorRole:

```xml
<creatorRole ref="http://metadataregistry.org/concept/show/id/1425.html">Producer</creatorRole>
```

## status quo

All attributes are dropped, as are the *Role elements.

## proposals

### A

- Tighten schema by dropping all attributes and all *Role.
- Use XSLT as-is.

### B

- Tighten schema, but...
- Leave affiliation in schema; preserve human readable data by including in parenthesis after name

### C

- Tighten schema, but...
- Leave role in schema; preserve by defining a small number of subproperties,
- and tighten schema to define legitimate roles.


# pbcoreRightsSummary

```xml
<pbcoreRightsSummary>
  <rightsSummary 
    source="anything" 
    ref="anything" 
    version="anything" 
    annotation="anything">
     anything
  </rightsSummary>
</pbcoreRightsSummary>
<pbcoreRightsSummary>
  <rightsLink
    annotation="anything">
      anything
  </rightsLink>
</pbcoreRightsSummary>
<pbcoreRightsSummary>
  <rightsEmbedded>
    <random>
      <xml>anything</xml>
    </random>
  </rightsEmbedded>
</pbcoreRightsSummary>
```

In OV there are examples like this:

```xml
<pbcoreRightsSummary>
  <rightsSummary annotation="rights summary" source="WGBH MARS">
    RE-USE RIGHTS AND RESTRICTIONS NOT CONFIRMED - CONSULT THE PROGRAM'S LEGAL FILE(S)
  </rightsSummary>
</pbcoreRightsSummary>
```

```xml
<pbcoreRightsSummary>
  <rightsEmbedded>
    <WGBH_RIGHTS 
      RIGHTS_CREDIT="WGBH Educational Foundation"
      RIGHTS_TYPE="All"
      RIGHTS_HOLDER="WGBH Educational Foundation"/>
  </rightsEmbedded>
</pbcoreRightsSummary>
```

## status quo

`rightsSummary` and `rightsLink` are mapped to the corresponding EBU terms, ignoring the attributess.

## proposals

In all cases, validate that `rightsLink` is a URI.

### A

- Tighten the pbcore schema accordingly: Drop all attributes as well as `rightsEmbedded`

### B

- Allow the attributes to remain, and concatenate then on to the EBU `hasRightsSummary`

We accept more current PBCore documents, but we lose reversibility.

### C

- Extend that to the `rightsEmbedded`: Actually capturing the XML structure in XSL would be hard, but we could try to capture at least the names of elements and their values.

Even less reversible, but more human readable information is preserved.

# pbcoreInstantiation

TODO

# pbcoreAnnotation

```xml
<pbcoreAnnotation
  annotationType="anything"
  ref="anything">
    anything
</pbcoreAnnotation>
```

In OV there are a number of examples:

```xml
<pbcoreAnnotation annotationType="SOURCE">LOC Reproduction Number</pbcoreAnnotation>
<pbcoreAnnotation annotationType="SOURCE">LOC Digital ID</pbcoreAnnotation>
<pbcoreAnnotation annotationType="Audio Quality2">(Audio Track 4) compression format : in24 24-bit Integer </pbcoreAnnotation>
<pbcoreAnnotation annotationType="Movie Quality">(Video Track 1) duration : 3619.052 seconds </pbcoreAnnotation>
```

## status quo

Two values of annotationType are handled: "last_modified" and "organization": any others are lost.

## proposals

### A

- Tighten PBCore schema to allow only those two values.

### B

- Tighten PBCore schema by simply removing `pbcoreAnnotation`. It seems to just be a bucket, and institutions would need to determine on a case-by-case basis whether the information here is worth preserving.

### C

- If it's just a human readable description, keep it, but use an existing description property, concatenating attribute values first.

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