<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:ebucore="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#"
    xmlns:pbcore="http://www.pbcore.org/PBCore/PBCoreNamespace.html"
    xmlns:pbcorerdf="http://www.pbcore.org/pbcore/pbcore#"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:prov="http://www.w3.org/ns/prov#"
    xmlns:foaf="xmlns.com/foaf/0.1/">
    
    <xsl:template match="pbcore:pbcoreInstantiation">
        <rdf:Description rdf:about="{pbcore:instantiationIdentifier}">
            <rdf:type
                rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#MediaResource"/>
            <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                <xsl:value-of select="pbcore:instantiationIdentifier"/>
            </rdfs:label>
            <xsl:for-each select="pbcore:instantiationIdentifier">
                <!-- after further evaluation: (better than blank nodes)-->
                <!--create pbcore identifiers defining subproperties per source -->
                <xsl:if test="contains(@source,'MARS Barcode')">
                    <pbcorerdf:marsBarcode>
                        <xsl:value-of select="self::pbcore:instantiationIdentifier"/>
                    </pbcorerdf:marsBarcode>
                </xsl:if>
                <xsl:if test="contains(@source,'MARS File Number')">
                    <pbcorerdf:marsFileNumber>
                        <xsl:value-of select="self::pbcore:instantiationIdentifier"/>
                    </pbcorerdf:marsFileNumber>
                </xsl:if>
                <xsl:if test="contains(@source,'Tape Label')">
                    <pbcorerdf:tapeLabelId>
                        <xsl:value-of select="self::pbcore:instantiationIdentifier"/>
                    </pbcorerdf:tapeLabelId>
                </xsl:if>
                <xsl:if test="contains(@source,'mediainfo')">
                    <pbcorerdf:mediainfo>
                        <xsl:value-of select="self::pbcore:instantiationIdentifier"/>
                    </pbcorerdf:mediainfo>
                </xsl:if>
                <xsl:if test="contains(@source,'WAMU')">
                    <pbcorerdf:wamuId>
                        <xsl:value-of select="self::pbcore:pbcoreIdentifier"/>
                    </pbcorerdf:wamuId>
                </xsl:if>
                <xsl:if
                    test="contains(@source,'National Association of Educational Broadcasters')">
                    <pbcorerdf:naeb_Id>
                        <xsl:value-of select="self::pbcore:instantiationIdentifier"/>
                    </pbcorerdf:naeb_Id>
                </xsl:if>
                <xsl:if test="contains(@source,'University of Maryland')">
                    <pbcorerdf:universityOfMaryland_Id>
                        <xsl:value-of select="self::pbcore:instantiationIdentifier"/>
                    </pbcorerdf:universityOfMaryland_Id>
                </xsl:if>
                <xsl:if test="contains(@source,'WGBH Barcode')">
                    <pbcorerdf:wgbhBarcode>
                        <xsl:value-of select="self::pbcore:instantiationIdentifier"/>
                    </pbcorerdf:wgbhBarcode>
                </xsl:if>
                <xsl:if test="contains(@source,'WGBH File Number')">
                    <pbcorerdf:wgbhFileNumber>
                        <xsl:value-of select="self::pbcore:instantiationIdentifier"/>
                    </pbcorerdf:wgbhFileNumber>
                </xsl:if>
                <!-- option 2: concat pbcore:identifier with source -->
                <ebucore:identifier>
                    <xsl:value-of select="concat(@source,' - ',.)"/>
                </ebucore:identifier>
            </xsl:for-each>
            <xsl:for-each select="pbcore:instantiationDate">
                <ebucore:dateCreated>
                    <xsl:if test="@dateType='created'">
                        <xsl:value-of select="."/>
                    </xsl:if>
                </ebucore:dateCreated>
                <ebucore:dateIssued>
                    <xsl:if test="@dateType='published' or @dateType='issued'">
                        <xsl:value-of select="."/>
                    </xsl:if>
                </ebucore:dateIssued>
                <ebucore:dateDigitised>
                    <xsl:if test="@dateType='encoded'">
                        <xsl:value-of select="."/>
                    </xsl:if>
                </ebucore:dateDigitised>
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
            <!-- ALTERNATIVE TO STORAGE TYPE: option 1 -->
            <ebucore:hasMedium>
                <xsl:value-of select="pbcore:instantiationPhysical"/>
            </ebucore:hasMedium>
            <!-- option 2 using class medium if skos vocabulary-->
            <!--ebucore:hasMedium>
                <ebucore:Medium>
                    <skos:preferredLabel>
                        <xsl:value-of select="pbcore:instantiationPhysical"/>
                    </skos:preferredLabel>
                </ebucore:Medium>
            </ebucore:hasMedium-->
            <!-- option 1 -->
            <ebucore:hasMimeType>
                <xsl:value-of select="pbcore:instantiationDigital"/>
            </ebucore:hasMimeType>
            <!-- option 2 using class mimetype if skos vocabulary-->
            <!-- option 1 -->
            <ebucore:hasContainerFormat>
                <xsl:value-of select="pbcore:instantiationStandard"/>
            </ebucore:hasContainerFormat>
            <!-- option 2 using class containerformat if skos vocabulary-->
            <ebucore:locator>
                <xsl:value-of select="pbcore:instantiationLocation"/>
            </ebucore:locator>
            <pbcorerdf:hasMediaType>
                <xsl:value-of select="pbcore:instantiationMediaType"/>
            </pbcorerdf:hasMediaType>
            <pbcorerdf:generations>
                <xsl:value-of select="pbcore:instantiationGenerations"/>
            </pbcorerdf:generations>
            <pbcorerdf:instantiationTracks>
                <xsl:value-of select="pbcore:instantiationTracks"/>
            </pbcorerdf:instantiationTracks>
            <ebucore:audioTrackConfiguration>
                <xsl:value-of select="pbcore:instantiationChannelConfiguration"/>
            </ebucore:audioTrackConfiguration>
            <pbcorerdf:instantiationAlternativeModes>
                <!-- string or boolean? -->
                <xsl:value-of select="pbcore:instantiationAlternativeModes"/>
            </pbcorerdf:instantiationAlternativeModes>
            <pbcorerdf:alternateGeneration>
                <xsl:value-of
                    select="self::pbcore:instantiationAnnotation[annotationType='alternate generation']"
                />
            </pbcorerdf:alternateGeneration>
            <ebucore:hasCodec>
                <xsl:value-of
                    select="pbcore:instantiationAnnotation[@annotationType='encoded by']"/>
            </ebucore:hasCodec>
            <!-- Need to convert from all possible file sizes to bytes for ebucore requirements. Parsing engine is making GB and TB into scientific notation. -->
            <ebucore:fileSize>
                <xsl:choose>
                    <xsl:when
                        test="pbcore:instantiationFileSize[contains(@unitsOfMeasure,'K')]">
                        <xsl:value-of select="pbcore:instantiationFileSize * 1024"/>
                    </xsl:when>
                    <xsl:when
                        test="pbcore:instantiationFileSize[contains(@unitsOfMeasure,'M')]">
                        <xsl:value-of select="pbcore:instantiationFileSize * 1048576"/>
                    </xsl:when>
                    <xsl:when
                        test="pbcore:instantiationFileSize[contains(@unitsOfMeasure,'G')]">
                        <xsl:value-of select="pbcore:instantiationFileSize * 1073741824"/>
                    </xsl:when>
                    <xsl:when
                        test="pbcore:instantiationFileSize[contains(@unitsOfMeasure,'T')]">
                        <xsl:value-of select="pbcore:instantiationFileSize * 1099511627776"
                        />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="pbcore:instantiationFileSize"/>
                    </xsl:otherwise>
                </xsl:choose>
            </ebucore:fileSize>
            <!-- conversion en bps -->
            <ebucore:bitRate>
                <xsl:value-of select="pbcore:instantiationDataRate"/>
            </ebucore:bitRate>
            <pbcorerdf:hasAlternateFormat>
                <xsl:value-of
                    select="pbcore:instantiationAnnotation[@annotationType='Alternate Format']"
                />
            </pbcorerdf:hasAlternateFormat>
            <pbcorerdf:AACIP_RecordNominationStatus>
                <xsl:if
                    test="contains(pbcore:instantiationExtension/pbcore:extensionWrap/pbcore:extensionElement,'AACIP Record Nomination Status')">
                    <xsl:value-of
                        select="pbcore:instantiationExtension/pbcore:extensionWrap/pbcore:extensionValue"
                    />
                </xsl:if>
            </pbcorerdf:AACIP_RecordNominationStatus>
            <durationNormalPlayTime>
                <xsl:value-of select="pbcore:instantiationDuration"/>
            </durationNormalPlayTime>
            <xsl:for-each select="pbcore:instantiationEssenceTrack">
                <!-- inconsistent naming convention like General starting with a capital letter and not the others -->
                <xsl:if test="pbcore:essenceTrackType='video'">
                    <ebucore:hasTrack>
                        <rdf:Description
                            rdf:about="{concat(../pbcore:instantiationIdentifier,'.',pbcore:essenceTrackType,pbcore:essenceTrackIdentifier)}">
                            <rdf:type
                                rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#VideoTrack"/>
                            <rdfs:label
                                rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of
                                    select="concat(pbcore:essenceTrackType,pbcore:essenceTrackIdentifier)"
                                />
                            </rdfs:label>
                            <ebucore:trackName>
                                <xsl:value-of
                                    select="concat(pbcore:essenceTrackType,pbcore:essenceTrackIdentifier)"
                                />
                            </ebucore:trackName>
                            <pbcorerdf:mediaInfo>
                                <xsl:value-of
                                    select="pbcore:essenceTrackIdentifier[@source='mediainfo']"
                                />
                            </pbcorerdf:mediaInfo>
                            <ebucore:hasVideoEncodingFormat>
                                <!-- missing ref -->
                                <xsl:value-of select="pbcore:essenceTrackEncoding"/>
                            </ebucore:hasVideoEncodingFormat>
                            <ebucore:bitRate>
                                <xsl:value-of select="pbcore:essenceTrackDataRate"/>
                            </ebucore:bitRate>
                            <ebucore:frameRate>
                                <xsl:value-of select="pbcore:essenceTrackFrameRate"/>
                            </ebucore:frameRate>
                            <pbcorerdf:frameSize>
                                <xsl:value-of select="pbcore:essenceTrackFrameSize"/>
                            </pbcorerdf:frameSize>
                            <ebucore:aspectRatio>
                                <xsl:value-of select="pbcore:essenceTrackAspectRatio"/>
                            </ebucore:aspectRatio>
                            <ebucore:bitDepth>
                                <xsl:value-of select="pbcore:essenceTrackBitDepth"/>
                            </ebucore:bitDepth>
                            <pbcorerdf:colorSpace>
                                <xsl:value-of
                                    select="pbcore:essenceTrackAnnotation[@annotationType='colorspace']"
                                />
                            </pbcorerdf:colorSpace>
                            <pbcorerdf:subSampling>
                                <xsl:value-of
                                    select="pbcore:essenceTrackAnnotation[@annotationType='subsampling']"
                                />
                            </pbcorerdf:subSampling>
                            <ebucore:durationNormalPlayTime>
                                <xsl:value-of select="pbcore:essenceTrackDuration"/>
                            </ebucore:durationNormalPlayTime>
                        </rdf:Description>
                    </ebucore:hasTrack>
                </xsl:if>
                <xsl:if test="pbcore:essenceTrackType='audio'">
                    <ebucore:hasTrack>
                        <rdf:Description
                            rdf:about="{concat(../pbcore:instantiationIdentifier,'.',pbcore:essenceTrackType,pbcore:essenceTrackIdentifier)}">
                            <rdf:type
                                rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#AudioTrack"/>
                            <rdfs:label
                                rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                <xsl:value-of
                                    select="concat(pbcore:essenceTrackType,pbcore:essenceTrackIdentifier)"
                                />
                            </rdfs:label>
                            <ebucore:trackName>
                                <xsl:value-of
                                    select="concat(pbcore:essenceTrackType,pbcore:essenceTrackIdentifier)"
                                />
                            </ebucore:trackName>
                            <ebucore:identifier>
                                <xsl:value-of select="pbcore:essenceTrackIdentifier"/>
                            </ebucore:identifier>
                            <ebucore:hasAudioEncodingFormat>
                                <xsl:value-of
                                    select="concat(pbcore:essenceTrackEncoding/@ref,' ',pbcore:essenceTrackEncoding)"
                                />
                            </ebucore:hasAudioEncodingFormat>
                            <ebucore:bitRate>
                                <xsl:value-of select="pbcore:essenceTrackDataRate"/>
                            </ebucore:bitRate>
                            <ebucore:frameRate>
                                <xsl:value-of select="pbcore:essenceTrackSamplingRate"/>
                            </ebucore:frameRate>
                            <ebucore:sampleSize>
                                <xsl:value-of select="pbcore:essenceTrackBitDepth"/>
                            </ebucore:sampleSize>
                            <ebucore:durationNormalPlayTime>
                                <xsl:value-of select="pbcore:essenceTrackDuration"/>
                            </ebucore:durationNormalPlayTime>
                        </rdf:Description>
                    </ebucore:hasTrack>
                </xsl:if>
                <xsl:if test="pbcore:essenceTrackType='other'">
                    <xsl:if test="contains(pbcore:essenceTrackEncoding,'TC')">
                        <ebucore:hasTrack>
                            <rdf:Description
                                rdf:about="{concat(../pbcore:instantiationIdentifier,'.',pbcore:essencetrackEncoding,pbcore:essenceTrackIdentifier)}">
                                <rdf:type
                                    rdf:resource="http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#TimecodeTrack"/>
                                <rdfs:label
                                    rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
                                    <xsl:value-of
                                        select="concat(pbcore:essenceTrackEncoding,' ',pbcore:essenceTrackIdentifier)"
                                    />
                                </rdfs:label>
                                <ebucore:trackName>
                                    <xsl:value-of select="pbcore:essenceTrackEncoding"/>
                                </ebucore:trackName>
                                <pbcorerdf:mediaInfo>
                                    <xsl:value-of
                                        select="pbcore:essenceTrackIdentifier[@source='mediainfo']"
                                    />
                                </pbcorerdf:mediaInfo>
                                <ebucore:durationNormalPlayTime>
                                    <xsl:value-of select="pbcore:essenceTrackDuration"/>
                                </ebucore:durationNormalPlayTime>
                            </rdf:Description>
                        </ebucore:hasTrack>
                    </xsl:if>
                </xsl:if>
                <!-- more tests on the different formats to detect audio or video unless only audio files are of trackType 'General' -->
                <xsl:if
                    test="(pbcore:essenceTrackType='General') and (pbcore:essenceTrackEncoding/@source='MP3')">
                    <ebucore:hasAudioEncoding>
                        <xsl:value-of select="pbcore:essenceTrackEncoding"/>
                    </ebucore:hasAudioEncoding>
                </xsl:if>
            </xsl:for-each>
        </rdf:Description>
    </xsl:template>
    
</xsl:stylesheet>