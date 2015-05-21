# pbcoreCollection

TODO

# pbcoreDescriptionDocument

Has no attributes, but we do need to create URIs for the resulting RDF resources.

## status quo

Arbitrarily, the first pbcoreIdentifier is taken.

## proposals

There are really two problems here:
- Where do we get the identifying information?
- How do we construct a URI from it.

### A

- Take the first pbcoreIdentifier.
- Put it under a NS we create.

This is a non-starter: I don't think we ought to make the ordering the identifiers significant, and can't enforce the consistent use of a namespace scheme in IDs across institutions.

### B

Two parameters are supplied by the user when running the mapper:

- A pbcoreIdentifier source which identifies the right ID to pull
- A URI prefix, which prepended to the extracted ID to create full resource URI.

### C

- User supplies a single XPath expression which is responsible for building a URI from any information in the document.

Probably overkill. Also, out-of-the-box XSLT does not support evaluating XPath in arbitary string: We would either need to get a library which does support this, or use an ERB template to inject the user-supplied XPath.


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


# pbcoreIdentifier

```xml
<pbcoreIdentifier 
    source="anything">
  anything
</pbcoreIdentifier>
```

We might hope that the source values fall within a small set, but I don't believe that's the case:

```xml
<pbcoreIdentifier source="Asset ID">1018184</pbcoreIdentifier>
<pbcoreIdentifier source="Episode Number">108</pbcoreIdentifier>
<pbcoreIdentifier source="Filename">iptvtst_19821225_108_DV25</pbcoreIdentifier>
<pbcoreIdentifier source="IPTV Barcode">IPTVUS-0006712</pbcoreIdentifier>
<pbcoreIdentifier source="IPTV-AAPP">IPTV-002</pbcoreIdentifier>
<pbcoreIdentifier source="Interlochen Center for the Arts">43825000002120</pbcoreIdentifier>
<pbcoreIdentifier source="KUOW Puget Sound Public Radio">weekdayb</pbcoreIdentifier>
<pbcoreIdentifier source="LPB">LSWI-3020</pbcoreIdentifier>
<pbcoreIdentifier source="MAVIS Title Number">6875</pbcoreIdentifier>
<pbcoreIdentifier source="Maryland Public Television">18037</pbcoreIdentifier>
<pbcoreIdentifier source="NOLA Code">NONOLA001817 [SDBA]</pbcoreIdentifier>
<pbcoreIdentifier source="NOLA">OOI</pbcoreIdentifier>
<pbcoreIdentifier source="OPB American Archive Pilot Project:Assets">1711</pbcoreIdentifier>
<pbcoreIdentifier source="WERU Prog List">WRF028</pbcoreIdentifier>
<pbcoreIdentifier source="WPBS-TV">Four Decades of Dedication: The 40th Anniversary Special</pbcoreIdentifier>
<pbcoreIdentifier source="WTVS DATABASE ID">WTVS000613</pbcoreIdentifier>
<pbcoreIdentifier source="WXPN Barcode">Howard Kramer</pbcoreIdentifier>
<pbcoreIdentifier source="WXPN">Larry Kane</pbcoreIdentifier>
<pbcoreIdentifier source="http://www.americanmediaarchive.org">IPTV-2010012514124212630108429072317516514806564295896</pbcoreIdentifier>
```

## status quo

Subproperties are defined for the sources which happened to be in a small subset.

## proposals

### A

- Identify a much smaller set of sources that would actually be useful across institutions.
- Tighten the schema to allow only these sources.
- The XML owner can construct pbcoreIdentifiers without a source following any rules they want.
- Define a correspondingly small set of subproperties.

### B

- No change to schema
- XSLT concatenates source and value to make a single string.

This process should not be considered to be reversible.

### C

- Tighten schema by removing source.
- XML owner is responsible for cleaning up XML.

### D

- Define a new RDF class which can capture this source-value pair structure.
   

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

 <pbcoreSubject 
		 subjectType="anything" 
		 source="anything" 
		 ref="anything" 
		 version="anything" 
		 annotation="anything" 
		 startTime="anything" 
		 endTime="anything" 
		 timeAnnotation="anything">
	anything
 </pbcoreSubject>
TODO

# pbcoreDescription

<pbcoreDescription 
	annotation="anything" 
	descriptionType="anything" 
	descriptionTypeSource="anything" 
	descriptionTypeRef="anything" 
	descriptionTypeVersion="anything" 
	descriptionTypeAnnotation="anything" 
	segmentType="anything" 
	segmentTypeSource="anything" 
	segmentTypeRef="anything" 
	segmentTypeVersion="anything" 
	segmentTypeAnnotation="anything" 
	startTime="anything" 
	endTime="anything" 
	timeAnnotation="anything">
  anything
</pbcoreDescription>

TODO

# pbcoreGenre

```xml
<pbcoreGenre 
		source="anything" 
		ref="anything" 
		version="anything" 
		annotation="anything" 
		startTime="anything" 
		endTime="anything" 
		timeAnnotation="anything">
	anything
</pbcoreGenre>

TODO

# pbcoreRelation

```xml
<pbcoreRelation>
  <pbcoreRelationType 
	  source="anything" 
	  ref="anything" 
	  version="anything" 	
	  annotation="anything">
  anything</pbcoreRelationType>
  <pbcoreRelationIdentifier 
	source="anything"
	ref="anything" 
	version="anything" 
	annotation="anything">
  anything</pbcoreRelationIdentifier>
</pbcoreRelation>
```

TODO

# pbcoreCoverage

```xml
<pbcoreCoverage>
	<coverage>anything</coverage>
	<coverageType>Spatial</coverageType>
</pbcoreCoverage>
```

TODO

# pbcoreAudienceLevel

```xml
<pbcoreAudienceLevel
  source="anything"
  ref="anything" 
  version="anything" 
  annotation="anything">
    anything
</pbcoreAudienceLevel>
```

TODO

# pbcoreAudienceRating

```xml
<pbcoreAudienceRating
  source="anything"
  ref="anything" 
  version="anything" 
  annotation="anything">
    anything
</pbcoreAudienceRating>
```

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