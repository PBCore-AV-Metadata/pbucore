<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.pbcore.org/PBCore/PBCoreNamespace.html">
    
    <!--
      Generates a "kitchen-sink" document given the PBCore schema.
    -->
    
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <pbcoreCollection>
            <!-- 
              pbcoreDescriptionDocument could repeat, 
              but that would make the output too unwieldy.
            -->
            <pbcoreDescriptionDocument>
                <xsl:apply-templates select="/xsd:schema/xsd:complexType[@name='pbcoreDescriptionDocumentType']/xsd:sequence/*"/>
            </pbcoreDescriptionDocument>
        </pbcoreCollection>
    </xsl:template>

    <xsl:template priority="1" match="xsd:element[
                                        @name='pbcoreInstantiation' or 
                                        @name='instantiationEssenceTrack' or
                                        @name='extensionWrap' or
                                        @name='pbcorePublisher' or
                                        @name='pbcoreContributor' or
                                        @name='pbcoreCreator' or
                                        @name='instantiationRelation' or
                                        @name='pbcoreRelation' or
                                        @name='pbcoreCoverage']">
        <xsl:call-template name="sequence">
            <xsl:with-param name="type" select="@type"/>
        </xsl:call-template>
        <xsl:if test="@maxOccurs='unbounded'">
            <xsl:comment>TODO: Get the contents of repeated elements to be distinct.</xsl:comment>
            <!-- XSLT 2 tunnel parameters would be helpful here... -->
            <xsl:call-template name="sequence">
                <xsl:with-param name="type" select="@type"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="sequence">
        <xsl:param name="type"/>
        <xsl:element name="{@name}">
            <xsl:apply-templates select="(/xsd:schema/xsd:complexType[@name=$type] | ./xsd:complexType)/xsd:sequence/*"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template priority="1" match="xsd:element[
                                        @name='essenceTrackExtension']">
        <xsl:variable name="type" select="@type"/>
        <xsl:variable name="name" select="@name"/>
        <xsl:for-each select="/xsd:schema/xsd:complexType[@name=$type]/xsd:choice/*">
            <!-- 
              Generate parent element for each choice;
              Not necessarily valid if the parent is constrained to occur once.
            -->
            <xsl:element name="{$name}">
                <xsl:apply-templates select="."/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template priority="1" match="xsd:element[
                                        @name='pbcorePart']">
        <pbcorePart>
            <xsl:comment>pbcorePart can recursively include all the elements of a descriptionDocument</xsl:comment>
            <pbcoreIdentifier>pbcorePart_pbcoreIdentifier</pbcoreIdentifier>
        </pbcorePart>
    </xsl:template>
    
    <xsl:template priority="0.9" match="xsd:element[xsd:complexType]">
        ERROR: complexType element '<xsl:value-of select="@name"/>' without match.
    </xsl:template>
        
    
    <xsl:template match="xsd:element[@maxOccurs='unbounded']">
        <xsl:call-template name="element">
            <xsl:with-param name="suffix">first</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="element">
            <xsl:with-param name="suffix">repeat</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
            
    <xsl:template match="xsd:element">
        <!-- maxOccurs default is 1. -->
        <xsl:call-template name="element">
            <xsl:with-param name="suffix">only</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="element">
        <xsl:param name="suffix"/>
        <xsl:variable name="type" select="@type"/>
        <xsl:variable name="label" select="concat(@name,'_',$suffix)"/>
        <xsl:element name="{@name}">
            <xsl:apply-templates select="/xsd:schema/xsd:complexType[@name=$type]/xsd:simpleContent/xsd:extension/xsd:attribute">
                <xsl:with-param name="label" select="$label"/>  
            </xsl:apply-templates>
            <xsl:apply-templates select="/xsd:schema/xsd:complexType[@name=$type]/xsd:simpleContent/xsd:extension/xsd:attributeGroup">
                <xsl:with-param name="label" select="$label"/>  
            </xsl:apply-templates> 
            <xsl:value-of select="$label"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="xsd:attribute[@name]">
        <xsl:param name="label"/>
        <xsl:attribute name="{@name}">
            <xsl:value-of select="concat($label, '_@', @name)"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="xsd:attributeGroup[@ref]">
        <!--<attribute ref <xsl:value-of select="@ref">-->
    </xsl:template>
    
</xsl:stylesheet>
