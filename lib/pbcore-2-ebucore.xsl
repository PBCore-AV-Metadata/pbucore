<?xml version="1.0" encoding="UTF-8"?>
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
    
    <xsl:include href="lib/includes/pbcoreCollection.xsl"/>
    <xsl:include href="lib/includes/pbcoreDescriptionDocument.xsl"/>
    <xsl:include href="lib/includes/pbcoreInstantiation.xsl"/>
    <xsl:include href="lib/includes/pbcoreCreator.xsl"/>
    <xsl:include href="lib/includes/pbcoreContributor.xsl"/>
    <xsl:include href="lib/includes/pbcorePublisher.xsl"/>
    
    <xsl:template match="*">
        <xsl:message terminate="no">WARNING: Unmatched element: <xsl:value-of select="name(..)"/>/<xsl:value-of select="name()"/></xsl:message>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="/">
        <rdf:RDF>
            <xsl:apply-templates />
        </rdf:RDF>
    </xsl:template>
</xsl:stylesheet>
