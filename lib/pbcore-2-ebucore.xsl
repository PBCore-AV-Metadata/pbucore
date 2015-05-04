<?xml version="1.0" encoding="UTF-8"?>
<!-- A new namespace pbcorerdf has been added with a structure more appropriate for RDF  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:ebucore="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#"
    xmlns:pbcore="http://www.pbcore.org/PBCore/PBCoreNamespace.html"
    xmlns:pbcorerdf="http://www.pbcore.org/pbcore/pbcore#"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:prov="http://www.w3.org/ns/prov#"
    xmlns:foaf="xmlns.com/foaf/0.1/">
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    
    <xsl:include href="lib/pbcoreCollection.xsl"/>
    <xsl:include href="lib/pbcoreDescriptionDocument.xsl"/>
    <xsl:include href="lib/pbcoreInstantiation.xsl"/>
    
    <xsl:template match="*">
        <xsl:message terminate="no">WARNING: Unmatched element: <xsl:value-of select="name(..)"/>/<xsl:value-of select="name()"/></xsl:message>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="/">
        <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
            xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:dc="http://purl.org/dc/elements/1.1/"
            xmlns:dct="http://purl.org/dc/terms/" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
            xmlns:ebucore="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#">
            <xsl:apply-templates />
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
        </rdf:RDF>
    </xsl:template>
</xsl:stylesheet>
