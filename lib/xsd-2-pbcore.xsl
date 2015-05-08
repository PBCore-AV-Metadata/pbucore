<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.pbcore.org/PBCore/PBCoreNamespace.html">
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    

    <xsl:template match="xsd:attribute[@name]">
        <xsl:param name="element_name"/>
        <xsl:attribute name="{@name}">
            <xsl:value-of select="concat($element_name, '_@', @name)"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="xsd:element[@maxOccurs='unbounded']">
        <xsl:variable name="type" select="@type"/>
        <xsl:element name="{@name}">
            <xsl:apply-templates select="/xsd:schema/xsd:complexType[@name=$type]/xsd:simpleContent/xsd:extension/xsd:attribute">
                <xsl:with-param name="element_name" select="concat(@name,'_first')"/>  
            </xsl:apply-templates>  
            <xsl:value-of select="concat(@name,'_first')"/>
        </xsl:element>
        <xsl:element name="{@name}">
            <xsl:value-of select="concat(@name,'_repeat')"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="xsd:element[@maxOccurs='1']">
        <xsl:element name="{@name}">
            <xsl:value-of select="concat(@name,'_only')"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="/">
        <pbcoreCollection>
            <pbcoreDescriptionDocument>
                <xsl:apply-templates select="/xsd:schema/xsd:complexType[@name='pbcoreDescriptionDocumentType']/xsd:sequence/*"/>
            </pbcoreDescriptionDocument>
        </pbcoreCollection>
    </xsl:template>
    
    <xsl:template match="*[@name='pbcoreDescriptionDocument' or @name='pbcoreInstantiation' or @name='instantiationEssenceTrack']">
        <xsl:variable name="type" select="@type"/>
        <xsl:element name="{@name}">
            <xsl:apply-templates select="/xsd:schema/xsd:complexType[@name=$type]/xsd:sequence/*"/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>
