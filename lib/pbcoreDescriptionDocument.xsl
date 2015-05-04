<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:ebucore="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#"
    xmlns:pbcore="http://www.pbcore.org/PBCore/PBCoreNamespace.html"
    xmlns:pbcorerdf="http://www.pbcore.org/pbcore/pbcore#"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:prov="http://www.w3.org/ns/prov#"
    xmlns:foaf="xmlns.com/foaf/0.1/">

    <xsl:template match="pbcore:pbcoreDescriptionDocument">
        <!-- COMMENT: DO ALL DESCRIPTIONDOCUMENT SHARE ONE TYPE OF ID IN COMMON THAT SHOULD BE USED E.G. "MARS ASSET RECORD ID" -->
        <!-- OTHERWISE THE CURRENT TRANSFORMATION TAKES THE FIRST IDENTIFIER AS IT APPEARS (RANDOM?) -->
        <rdf:Description rdf:about="{pbcore:pbcoreIdentifier}">
            <rdf:type
                rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#EditorialObject"/>
            <!-- should be Item - extension PBCore -->
            <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                <xsl:value-of select="pbcore:pbcoreTitle[@titleType='Episode']"/>
            </rdfs:label>
            <pbcore:episodeTitle>
                <xsl:value-of select="pbcore:pbcoreTitle[@titleType='Episode']"/>
            </pbcore:episodeTitle>
            <pbcore:seriesTitle>
                <xsl:value-of select="pbcore:pbcoreTitle[@titleType='Series']"/>
            </pbcore:seriesTitle>
            <pbcore:programTitle>
                <xsl:value-of select="pbcore:pbcoreTitle[@titleType='Program']"/>
            </pbcore:programTitle>
            <xsl:for-each select="pbcore:pbcoreDescription">
                <ebucore:description>
                    <xsl:value-of select="."/>
                </ebucore:description>
            </xsl:for-each>
            <pbcore:dateBroadcast>
                <xsl:value-of select="pbcore:pbcoreAssetDate[@dateType='broadcast']"/>
            </pbcore:dateBroadcast>
            <xsl:for-each select="pbcore:pbcoreSubject[@subjectType='topic']">
                <!-- option 1 -->
                <ebucore:hasTopic>
                    <rdf:Description rdf:about="{pbcore:pbcoreSubject}">
                        <rdf:type rdf:resource="http://www.pbcore.org/pbcore/ebucore:Topic"/>
                        <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                            option 1: <xsl:value-of select="pbcore:pbcoreSubject"/>
                        </rdfs:label>
                        <skos:preferredLabel>
                            <xsl:value-of select="self::pbcore:pbcoreSubject"/>
                        </skos:preferredLabel>
                    </rdf:Description>
                </ebucore:hasTopic>
                <!-- option 2 -->
                <ebucore:hasTopic> option 2: <xsl:value-of select="pbcore:pbcoreSubject"/>
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
                <!-- Option 1 -->
                <ebucore:hasGenre>
                    <xsl:value-of select="self::pbcore:pbcoreGenre"/>
                </ebucore:hasGenre>
                <!-- Option 2 -->
                <ebucore:hasGenre>
                    <rdf:Description rdf:about="{pbcore:pbcoreGenre}">
                        <rdf:type rdf:resource="http://www.pbcore.org/pbcore/ebucore:Genre"/>
                        <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                            <xsl:value-of select="pbcore:pbcoreGenre"/>
                        </rdfs:label>
                        <skos:preferredLabel>
                            <xsl:value-of select="self::pbcore:pbcoreGenre"/>
                        </skos:preferredLabel>
                    </rdf:Description>
                </ebucore:hasGenre>
            </xsl:for-each>
            <ebucore:hasCreator
                rdf:resource="{concat(substring-before(pbcore:pbcoreCreator/pbcore:creator,','), substring-after(pbcore:pbcoreCreator/pbcore:creator,' '))}"/>
            <ebucore:hasContributor
                rdf:resource="{concat(substring-before(pbcore:pbcoreContributor/pbcore:contributor,','), substring-after(pbcore:pbcoreContributor/pbcore:contributor,' '))}"/>
            <!-- ALTERNATIVE OPTIONS FOR CREATOR-CONTRIBUTOR-PUBLISHER to avoid blank nodes in absence of vocabularies or other resources -->
            <xsl:for-each select="pbcore:pbcoreCreator">
                <!-- option 1 -->
                <!-- if persons/Contacts or organizations are not defined as classes -->
                <xsl:if test="contains(pbcore:creatorRole,'Production Unit')">
                    <pbcorerdf:hasProductionUnit>
                        <xsl:value-of select="pbcore:creator"/>
                    </pbcorerdf:hasProductionUnit>
                </xsl:if>
                <xsl:if test="contains(pbcore:creatorRole,'Producer')">
                    <pbcorerdf:hasProducer>
                        <xsl:value-of select="pbcore:creator"/>
                    </pbcorerdf:hasProducer>
                </xsl:if>
                <xsl:if test=" string(pbcore:creatorRole)=''">
                    <pbcorerdf:hasCreator>
                        <xsl:value-of select="pbcore:creator"/>
                    </pbcorerdf:hasCreator>
                </xsl:if>
                <!-- option 2 use hasCreator + agent or cast or staff -->
            </xsl:for-each>
            <xsl:for-each select="pbcore:pbcoreContributor">
                <!-- option1 -->
                <!-- if persons/Contacts or organizations are not defined as classes -->
                <!--xsl:if test="contains(pbcore:pbcoreContributorRole,'productionUnit')">
                    <ebucore:hasProductionUnit>
                        <xsl:value-of select="pbcore:pbcoreContributor/pbcore:contributor"/>
                    </ebucore:hasProductionUnit>
                </xsl:if-->
                <!-- option 2 use hasContributor + agent or cast or staff -->
            </xsl:for-each>
            <xsl:for-each select="pbcore:pbcorePublisher">
                <ebucore:hasPublisher>
                    <!-- same as option 1 and 2 above -->
                    <!-- how long is the list of types of publishers -->
                    <xsl:value-of select="pbcore:publisher"/>
                </ebucore:hasPublisher>
            </xsl:for-each>
            <ebucore:hasRightsSummary>
                <xsl:value-of select="pbcore:pbcoreRightsSummary/pbcore:rightsSummary"/>
            </ebucore:hasRightsSummary>
            <ebucore:hasRightsLink>
                <xsl:value-of select="pbcore:pbcoreRightsSummary/pbcore:rightsLink"/>
            </ebucore:hasRightsLink>
            <xsl:for-each select="//pbcore:pbcoreCoverage">
                <xsl:if test="pbcore:coverageType='Spatial'">
                    <ebucore:hasLocation rdf:resource="{pbcore:coverage}"/>
                    <!-- different implementation if vocabulary of places and location or using geonames -->
                </xsl:if>
                <xsl:if test="pbcore:coverageType='Temporal'">
                    <ebucore:hasEvent rdf:resource="{pbcore:coverage}"/>
                    <!-- different implementation if vocabulary of events and periods -->
                </xsl:if>
            </xsl:for-each>
            <prov:generatedAtTime>
                <xsl:value-of
                    select="pbcore:pbcoreAnnotation[@annotationType='last_modified']"/>
            </prov:generatedAtTime>
            <prov:Organization>
                <foaf:name>
                    <xsl:value-of
                        select="pbcore:pbcoreAnnotation[@annotationType='organization']"/>
                </foaf:name>
            </prov:Organization>
            <xsl:if test="pbcore:pbcoreInstantiation">
                <ebucore:hasRelatedResource>
                    <xsl:apply-templates select="pbcore:pbcoreInstantiation"/>
                </ebucore:hasRelatedResource>
            </xsl:if>
        </rdf:Description>
    </xsl:template>
    
</xsl:stylesheet>
