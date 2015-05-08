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
    
    <xsl:template name="element">
        <xsl:param name="suffix"/>
        <xsl:variable name="type" select="@type"/>
        <xsl:element name="{@name}">
            <xsl:apply-templates select="/xsd:schema/xsd:complexType[@name=$type]/xsd:simpleContent/xsd:extension/xsd:attribute">
                <xsl:with-param name="element_name" select="concat(@name,'_',$suffix)"/>  
            </xsl:apply-templates>  
            <xsl:value-of select="concat(@name,'_',$suffix)"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="xsd:element[@maxOccurs='unbounded']">
        <xsl:call-template name="element">
            <xsl:with-param name="suffix">first</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="element">
            <xsl:with-param name="suffix">repeat</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="xsd:element[@maxOccurs='1']">
        <xsl:call-template name="element">
            <xsl:with-param name="suffix">only</xsl:with-param>
        </xsl:call-template>
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
