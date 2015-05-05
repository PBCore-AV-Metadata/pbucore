<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:ebucore="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#"
    xmlns:pbcore="http://www.pbcore.org/PBCore/PBCoreNamespace.html"
    xmlns:pbcorerdf="http://www.pbcore.org/pbcore/pbcore#"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:prov="http://www.w3.org/ns/prov#"
    xmlns:foaf="xmlns.com/foaf/0.1/">

    <xsl:template match="pbcore:pbcoreCollection">
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
            <ebucore:hasMember>
                <xsl:apply-templates select="pbcore:pbcoreDescriptionDocument"/>
            </ebucore:hasMember>
        </rdf:Description>
    </xsl:template>
    
</xsl:stylesheet>