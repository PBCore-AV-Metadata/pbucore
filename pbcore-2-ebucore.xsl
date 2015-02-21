<?xml version="1.0" encoding="UTF-8"?>
<!-- A new namespace pbcorerdf has been added with a structure more appropriate for RDF  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:ebucore="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#"
    xmlns:pbcore="http://www.pbcore.org/PBCore/PBCoreNamespace.html"
    xmlns:pbcorerdf="http://www.pbcore.org/pbcore/pbcore#">
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
            xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:dc="http://purl.org/dc/elements/1.1/"
            xmlns:dct="http://purl.org/dc/terms/" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
            xmlns:ebucore="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#">
            <xsl:for-each select="pbcore:pbcoreCollection">
                <rdf:Description rdf:about="collection_id1">
                    <rdf:type
                        rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#Group"/>
                    <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                        <xsl:value-of select="@collectionTitle"/>
                    </rdfs:label>
                    <ebucore:title>
                        <xsl:value-of select="@collectionTitle"/>
                    </ebucore:title>
                    <ebucore:description>
                        <xsl:value-of select="@collectionTitle"/>
                    </ebucore:description>
                    <ebucore:date>
                        <xsl:value-of select="@collectionDate"/>
                    </ebucore:date>
                    <!-- COMMENT: DO ALL DESCRIPTIONDOCUMENT SHARE ONE TYPE OF ID IN COMMON THAT SHOULD BE USED E.G. "MARS ASSET RECORD ID" -->
                    <!-- OTHERWISE THE CURRENT TRANSFORMATION TAKES THE FIRST IDENTIFIER AS IT APPEARS (RANDOM?) -->
                    <xsl:for-each select="pbcore:pbcoreDescriptionDocument">
                        <ebucore:hasMember rdf:resource="{pbcore:pbcoreIdentifier}"/>
                    </xsl:for-each>
                </rdf:Description>
            </xsl:for-each>
            <xsl:for-each select="//pbcore:pbcoreDescriptionDocument">
                <rdf:Description rdf:about="{pbcore:pbcoreIdentifier}">
                    <rdf:type
                        rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#EditorialObject"/>
                    <!-- should be Item - extension PBCore -->
                    <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                        <xsl:value-of select="pbcore:pbcoreTitle[@titleType='Episode']"/>
                    </rdfs:label>
                    <ebucore:hasPublicationHistory>
                        <ebucore:hasPublicationEvent>
                            <ebucore:publishedStarDateTime>
                                <xsl:value-of select="pbcore:pbcoreAssetDate[@dateType='broadcast']"
                                />
                            </ebucore:publishedStarDateTime>
                        </ebucore:hasPublicationEvent>
                    </ebucore:hasPublicationHistory>
                    <ebucore:title>
                        <xsl:value-of select="pbcore:pbcoreTitle[@titleType='Episode']"/>
                    </ebucore:title>
                    <ebucore:title>
                        <xsl:value-of select="pbcore:pbcoreTitle[@titleType='Program']"/>
                    </ebucore:title>
                    <xsl:for-each select="pbcore:pbcoreDescription">
                        <ebucore:description>
                            <xsl:value-of select="."/>
                        </ebucore:description>
                    </xsl:for-each>
                    <pbcore:dateBroadcast>
                        <xsl:value-of select="pbcore:pbcoreAssetDate[@dateType='broadcast']"/>
                    </pbcore:dateBroadcast>
                    <xsl:for-each select="pbcore:pbcoreSubject[@subjectType='topic']">
                        <ebucore:hasTopic>
                            <xsl:value-of select="self::pbcore:pbcoreSubject"/>
                        </ebucore:hasTopic>
                    </xsl:for-each>
                    <ebucore:hasObjectType>
                        <xsl:value-of select="self::pbcore:pbcoreAssetType"/>
                    </ebucore:hasObjectType>
                    <xsl:for-each select="pbcore:pbcoreIdentifier">
                        <!-- after further evaluation: (better than blank nodes)-->
                        <!-- option 1: create pbcore identifiers defining subproperties per source -->
                        <xsl:if test="contains(@source,'MARS Asset Record ID')">
                            <pbcorerdf:marsAssetRecordId>
                                <xsl:value-of select="self::pbcore:pbcoreIdentifier"/>
                            </pbcorerdf:marsAssetRecordId>
                        </xsl:if>
                        <xsl:if test="contains(@source,'MARS Source Creation Order')">
                            <pbcorerdf:marsSourceCreationOrderId>
                                <xsl:value-of select="self::pbcore:pbcoreIdentifier"/>
                            </pbcorerdf:marsSourceCreationOrderId>
                        </xsl:if>
                        <xsl:if test="contains(@source,'WGBH Old File Number')">
                            <pbcorerdf:wgbhOldFileNumber>
                                <xsl:value-of select="self::pbcore:pbcoreIdentifier"/>
                            </pbcorerdf:wgbhOldFileNumber>
                        </xsl:if>
                        <xsl:if test="contains(@source,'americanarchiveinventory')">
                            <pbcorerdf:americanArchiveInventoryId>
                                <xsl:value-of select="self::pbcore:pbcoreIdentifier"/>
                            </pbcorerdf:americanArchiveInventoryId>
                        </xsl:if>
                        <xsl:if test="contains(@source,'KGLT(MD5)')">
                            <pbcorerdf:kglt_md5>
                                <xsl:value-of select="self::pbcore:pbcoreIdentifier"/>
                            </pbcorerdf:kglt_md5>
                        </xsl:if>
                        <xsl:if test="contains(@source,'WAMU')">
                            <pbcorerdf:wamuId>
                                <xsl:value-of select="self::pbcore:pbcoreIdentifier"/>
                            </pbcorerdf:wamuId>
                        </xsl:if>
                        <xsl:if
                            test="contains(@source,'National Association of Educational Broadcasters')">
                            <pbcorerdf:naeb_Id>
                                <xsl:value-of select="self::pbcore:pbcoreIdentifier"/>
                            </pbcorerdf:naeb_Id>
                        </xsl:if>
                        <xsl:if test="contains(@source,'University of Maryland')">
                            <pbcorerdf:universityOfMaryland_Id>
                                <xsl:value-of select="self::pbcore:pbcoreIdentifier"/>
                            </pbcorerdf:universityOfMaryland_Id>
                        </xsl:if>
                        <!-- option 2: concat pbcore:identifier with source -->
                        <ebucore:identifier>
                            <xsl:value-of select="concat(@source,' - ',.)"/>
                        </ebucore:identifier>
                    </xsl:for-each>
                    <xsl:for-each select="pbcore:pbcoreGenre">
                        <ebucore:hasGenre>
                            <xsl:value-of select="self::pbcore:pbcoreGenre"/>
                        </ebucore:hasGenre>
                    </xsl:for-each>
                    <ebucore:hasCreator
                        rdf:resource="{concat(substring-before(pbcore:pbcoreCreator/pbcore:creator,','), substring-after(pbcore:pbcoreCreator/pbcore:creator,' '))}"/>
                    <ebucore:hasContributor
                        rdf:resource="{concat(substring-before(pbcore:pbcoreContributor/pbcore:contributor,','), substring-after(pbcore:pbcoreContributor/pbcore:contributor,' '))}"/>
                    <xsl:for-each select="pbcore:pbcoreInstantiation">
                        <ebucore:hasRelatedResource rdf:resource="{pbcore:instantiationIdentifier}"
                        />
                    </xsl:for-each>
                </rdf:Description>
            </xsl:for-each>
            <xsl:for-each select="//pbcore:pbcoreCoverage">
                <xsl:if test="pbcore:coverageType='Spatial'">
                    <ebucore:hasCoverage rdf:resource="{pbcore:coverage}"/>
                    <rdf:Description rdf:about="{pbcore:coverage}">
                        <rdf:type
                            rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#Location"/>
                        <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                            <xsl:value-of select="pbcore:coverage"/>
                        </rdfs:label>
                        <ebucore:locationName>
                            <xsl:value-of select="pbcore:coverage"/>
                        </ebucore:locationName>
                    </rdf:Description>
                </xsl:if>
                <xsl:if test="pbcore:coverageType='Temporal'">
                    <ebucore:hasCoverage rdf:resource="{pbcore:coverage}"/>
                    <rdf:Description rdf:about="{pbcore:coverage}">
                        <rdf:type
                            rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#Event"/>
                        <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                            <xsl:value-of select="pbcore:coverage"/>
                        </rdfs:label>
                        <ebucore:eventName>
                            <xsl:value-of select="pbcore:coverage"/>
                        </ebucore:eventName>
                    </rdf:Description>
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="//pbcore:pbcoreCreator">
                <rdf:Description
                    rdf:about="{concat(substring-before(pbcore:creator,','), substring-after(pbcore:creator,' '))}">
                    <rdf:type
                        rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#Cast"/>
                    <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                        <xsl:value-of select="pbcore:creator"/>
                    </rdfs:label>
                    <ebucore:agentName>
                        <xsl:value-of select="pbcore:creator"/>
                    </ebucore:agentName>
                    <ebucore:hasRole>
                        <xsl:value-of select="pbcore:creatorRole"/>
                    </ebucore:hasRole>
                </rdf:Description>
            </xsl:for-each>
            <xsl:for-each select="//pbcore:pbcoreContributor">
                <rdf:Description
                    rdf:about="{concat(substring-before(pbcore:contributor,','), substring-after(pbcore:contributor,' '))}">
                    <rdf:type
                        rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#Cast"/>
                    <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                        <xsl:value-of select="pbcore:contributor"/>
                    </rdfs:label>
                    <ebucore:agentName>
                        <xsl:value-of select="pbcore:contributor"/>
                    </ebucore:agentName>
                    <ebucore:hasRole>
                        <xsl:value-of select="pbcore:contributorRole"/>
                    </ebucore:hasRole>
                </rdf:Description>
            </xsl:for-each>
            <xsl:for-each select="//pbcore:pbcorePublisher">
                <rdf:Description
                    rdf:about="{concat(substring-before(pbcore:publisher,','), substring-after(pbcore:publisher,' '))}">
                    <rdf:type
                        rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#Cast"/>
                    <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                        <xsl:value-of select="pbcore:publisher"/>
                    </rdfs:label>
                    <ebucore:agentName>
                        <xsl:value-of select="pbcore:publisher"/>
                    </ebucore:agentName>
                    <ebucore:hasRole>
                        <xsl:value-of select="pbcore:publisherRole"/>
                    </ebucore:hasRole>
                </rdf:Description>
            </xsl:for-each>
            <xsl:for-each select="//pbcore:pbcoreInstantiation">
                <rdf:Description rdf:about="{pbcore:instantiationIdentifier}">
                    <rdf:type
                        rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#MediaResource"/>
                    <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                        <xsl:value-of select="pbcore:instantiationIdentifier"/>
                    </rdfs:label>
                    <xsl:for-each select="pbcore:instantiationDate">
                        <ebucore:dateIssued>
                            <xsl:if test="@dateType='published'">
                                <xsl:value-of select="."/>
                            </xsl:if>
                            <xsl:if test="@dateType='encoded'">
                                <xsl:value-of select="."/>
                            </xsl:if>
                        </ebucore:dateIssued>
                    </xsl:for-each>
                    <ebucore:hasFormat>
                        <xsl:value-of select="pbcore:instantiationPhysical"/>
                    </ebucore:hasFormat>
                    <ebucore:locator>
                        <xsl:value-of select="pbcore:instantiationLocation"/>
                    </ebucore:locator>
                    <ebucore:hasMimeType>
                        <xsl:value-of select="pbcore:instantiationDigital"/>
                    </ebucore:hasMimeType>
                    <ebucore:hasStorageType>
                        <xsl:value-of select="pbcore:instantiationPhysical"/>
                    </ebucore:hasStorageType>
                    <!-- Need to convert from all possible file sizes to bytes for ebucore requirements. Parsing engine is making GB and TB into scientific notation. -->
                    <ebucore:fileSize>
                    <xsl:choose>
                        <xsl:when test="pbcore:instantiationFileSize[contains(@unitsOfMeasure,'K')]">
                            <xsl:value-of select="pbcore:instantiationFileSize * 1024"/>
                        </xsl:when>
                        <xsl:when test="pbcore:instantiationFileSize[contains(@unitsOfMeasure,'M')]">
                            <xsl:value-of select="pbcore:instantiationFileSize * 1048576"/>
                        </xsl:when>
                        <xsl:when test="pbcore:instantiationFileSize[contains(@unitsOfMeasure,'G')]">
                            <xsl:value-of select="pbcore:instantiationFileSize * 1073741824"/>
                        </xsl:when>
                        <xsl:when test="pbcore:instantiationFileSize[contains(@unitsOfMeasure,'T')]">
                            <xsl:value-of select="pbcore:instantiationFileSize * 1099511627776"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="pbcore:instantiationFileSize"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    </ebucore:fileSize>
                    <ebucore:bitrate>
                        <xsl:choose>
                            <xsl:when test="pbcore:instantiationDataRate[contains(@unitsOfMeasure, 'K')]">
                                <xsl:value-of select="pbcore:instantiationDataRate * 1000"/>
                            </xsl:when>
                            <xsl:when test="pbcore:instantiationDataRate[contains(@unitsOfMeasure, 'M')]">
                                <xsl:value-of select="pbcore:instantiationDataRate * 1000000"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="pbcore:instantiationDataRate"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </ebucore:bitrate>  
                    <durationNormalPlayTime>
                        <xsl:value-of select="pbcore:instantiationDuration"/>
                    </durationNormalPlayTime>
                </rdf:Description>
            </xsl:for-each>
        </rdf:RDF>
    </xsl:template>
</xsl:stylesheet>
