<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1s.0"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:ebucore="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#"
    >
        
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
            xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:dc="http://purl.org/dc/elements/1.1/"
            xmlns:dct="http://purl.org/dc/terms/" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
            xmlns:ebucore="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#"
            >
            <xsl:for-each select="pbcoreCollection">
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
                    <xsl:for-each select="pbcoreDescriptionDocument">
                        <ebucore:hasMember rdf:resource="{pbcoreIdentifier}"/>
                    </xsl:for-each>
                </rdf:Description>
            </xsl:for-each>
            <xsl:for-each select="pbcoreCollection/pbcoreDescriptionDocument">
                <rdf:Description rdf:about="{pbcoreIdentifier}">
                    <rdf:type
                        rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#EditorialObject"/>
                    <!-- should be Item - extension PBCore -->
                    <rdf:type
                        rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#EditorialObject"/>
                    <!-- should be Raw - extension PBCore -->
                    <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                        <xsl:value-of select="pbcoreTitle[@titleType='Episode']"/>
                    </rdfs:label>
                    <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                        <xsl:value-of select="pbcoreTitle[@titleType='Main']"/>
                    </rdfs:label>
                    <ebucore:hasPublicationHistory>
                        <ebucore:hasPublicationEvent>
                            <ebucore:publishedStarDateTime>
                                <xsl:value-of select="pbcoreAssetDate[@dateType='broadcast']"/>
                            </ebucore:publishedStarDateTime>
                        </ebucore:hasPublicationEvent>
                    </ebucore:hasPublicationHistory>
                    <ebucore:title>
                        <xsl:value-of select="pbcoreTitle[@titleType='Episode']"/>
                    </ebucore:title>
                    <ebucore:title>
                        <xsl:value-of select="pbcoreTitle[@titleType='Program']"/>
                    </ebucore:title>
                    <xsl:for-each select="pbcoreSubject[@subjectType='topic']">     
                    <ebucore:hasTopic>
                        <xsl:value-of select="self::pbcoreSubject"/>    
                    </ebucore:hasTopic>                
                    </xsl:for-each>
                    <xsl:for-each select="pbcoreSubject[@subjectType='topical']">  
                        <ebucore:hasTopic>
                            <xsl:value-of select="self::pbcoreSubject"/> 
                        </ebucore:hasTopic>
                    </xsl:for-each>
                    <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                        <xsl:value-of select="pbcoreSubject[@subjecType='geographic']"/>
                    </rdfs:label>
                    <xsl:for-each select="pbcoreDescription">
                        <ebucore:description>
                            <xsl:value-of select="pbcoreDescription"/>
                        </ebucore:description>
                    </xsl:for-each>
                    <xsl:for-each select="pbcoreDescription[@descriptionType='Summary']">  
                        <ebucore:summary>
                            <xsl:value-of select="self::pbcoreDescription[@descriptionType='Summary]"/> 
                        </ebucore:summary>
                    </xsl:for-each>
                    <xsl:for-each select="pbcoreGenre">
                        <ebucore:hasGenre>
                            <xsl:value-of select="self::pbcoreGenre"/>    
                        </ebucore:hasGenre>                
                    </xsl:for-each>
                    <ebucore:hasCreator rdf:resource="{concat(substring-before(pbcoreCreator/creator,','), substring-after(pbcoreCreator/creator,' '))}"/>
                    <ebucore:hasContributor rdf:resource="{concat(substring-before(pbcoreContributor/contributor,','), substring-after(pbcoreContributor/contributor,' '))}"/>
                    <xsl:for-each select="pbcoreInstantiation">
                        <ebucore:hasRelatedResource rdf:resource="{instantiationIdentifier}"/>
                    </xsl:for-each>
                </rdf:Description>     
            </xsl:for-each>
            <xsl:for-each select="pbcoreCollection/pbcoreDescriptionDocument/pbcoreCoverage">
                    <xsl:if test="spatial">
                        <ebucore:hascoverage rdf:resource="{coverage}"/>
                        <rdf:Description rdf:about="{coverage}">
                            <rdf:type
                                rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#Location"/>
                            <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of select="coverage"/>
                            </rdfs:label>
                            <ebucore:locationName>
                                <xsl:value-of select="coverage"/>
                            </ebucore:locationName>
                        </rdf:Description>
                       
                    </xsl:if>
    
                    <xsl:if test="temporal">
                            <ebucore:hascoverage rdf:resource="{coverage}"/>
                            <rdf:Description rdf:about="{coverage}">
                                <rdf:type
                                    rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#Event"/>
                                <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                    <xsl:value-of select="coverage"/>
                                </rdfs:label>
                                <ebucore:eventName>
                                    <xsl:value-of select="coverage"/>
                                </ebucore:eventName>
                            </rdf:Description>
                    </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="pbcoreCollection/pbcoreDescriptionDocument/pbcoreCreator">
                <rdf:Description rdf:about="{concat(substring-before(creator,','), substring-after(creator,' '))}">
                    <rdf:type
                        rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#Cast"/>
                    <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                        <xsl:value-of select="creator"/>
                    </rdfs:label>
                    <ebucore:agentName>
                        <xsl:value-of select="creator"/>
                    </ebucore:agentName>
                    <ebucore:hasRole>
                        <xsl:value-of select="creatorRole"/>                        
                    </ebucore:hasRole>
                </rdf:Description>                    
            </xsl:for-each>
            <xsl:for-each select="pbcoreCollection/pbcoreDescriptionDocument/pbcoreContributor">
                <rdf:Description rdf:about="{concat(substring-before(contributor,','), substring-after(contributor,' '))}">
                    <rdf:type
                        rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#Cast"/>
                    <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                        <xsl:value-of select="contributor"/>
                    </rdfs:label>
                    <ebucore:agentName>
                        <xsl:value-of select="contributor"/>
                    </ebucore:agentName>
                    <ebucore:hasRole>
                        <xsl:value-of select="contributorRole"/>                        
                    </ebucore:hasRole>
                </rdf:Description>                    
            </xsl:for-each>
            <xsl:for-each select="pbcoreCollection/pbcoreDescriptionDocument/pbcorePublisher">
                <rdf:Description rdf:about="{concat(substring-before(publisher,','), substring-after(publisher,' '))}">
                    <rdf:type
                        rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#Cast"/>
                    <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                        <xsl:value-of select="publisher"/>
                    </rdfs:label>
                    <ebucore:agentName>
                        <xsl:value-of select="publisher"/>
                    </ebucore:agentName>
                    <ebucore:hasRole>
                        <xsl:value-of select="publisherRole"/>                        
                    </ebucore:hasRole>
                </rdf:Description>                    
            </xsl:for-each>
            <xsl:for-each select="pbcoreCollection/pbcoreDescriptionDocument/pbcoreRightsSummary">
                <rdf:Description rdf:about="{concat(substring-before(rights,','), substring-after(rights,' '))}">
                    <rdf:type
                    rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#Rights"/>
                    <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                        <xsl:value-of select="rights"/>
                    </rdfs:label>
                   <ebucore:rightsExpression>
                       <xsl:value-of select="rightssummary"/>
                   </ebucore:rightsExpression>
                </rdf:Description>
            </xsl:for-each>
            <xsl:for-each select="pbcoreCollection/pbcoreDescriptionDocument/pbcoreInstantiation">
                <rdf:Description rdf:about="{instantiationIdentifier}">
                    <rdf:type
                        rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#MediaResource"/>
                    <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                        <xsl:value-of select="instantiationIdentifier"/>
                    </rdfs:label>
                    <ebucore:dateIssued>
                        <xsl:value-of select="instantiationDate[@dateType='published']"/>
                    </ebucore:dateIssued>
                    <ebucore:hasFormat>
                        <xsl:value-of select="instantiationDigital"/>
                    </ebucore:hasFormat>
                    <ebucore:locator>
                        <xsl:value-of select="instantiationLocation"/>
                    </ebucore:locator>
                    <ebucore:hasMimeType>
                        <xsl:value-of select="instantiationMediaType"/>
                    </ebucore:hasMimeType>
                    <durationNormalPlayTime>
                        <xsl:value-of select="instantiationDuration"/>
                    </durationNormalPlayTime>
                </rdf:Description>                    
            </xsl:for-each>
        </rdf:RDF>
    </xsl:template>
</xsl:stylesheet>
