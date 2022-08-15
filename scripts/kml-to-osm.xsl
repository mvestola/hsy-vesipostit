<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:kml="http://www.opengis.net/kml/2.2">
    <xsl:output encoding="UTF-8" method="xml" indent="yes" version="1.0"/>
    <xsl:template match="/">
        <osm version="0.6" upload="false">
            <xsl:for-each select="kml:kml/kml:Document/kml:Folder/kml:Placemark">
                <xsl:variable name="id" select="-101752 - position()"/>
                <xsl:variable name="extraInfo"
                              select="kml:ExtendedData/kml:Data[@name='Lisätietoja']/kml:value"/>
                <xsl:variable name="extraInfoOrDefault"
                              select="if (string-length($extraInfo) &gt; 1) then $extraInfo else 'Toimii'"/>
                <xsl:variable name="color" select="kml:ExtendedData/kml:Data[@name='Väri']/kml:value"/>
                <xsl:variable name="city" select="kml:ExtendedData/kml:Data[@name='Kaupunki']/kml:value"/>
                <xsl:variable name="hsyId" select="kml:ExtendedData/kml:Data[@name='HSY tunniste']/kml:value"/>
                <xsl:variable name="image1" select="kml:ExtendedData/kml:Data[@name='Kuva 1']/kml:value"/>
                <xsl:variable name="type" select="kml:ExtendedData/kml:Data[@name='Tyyppi']/kml:value"/>
                <xsl:variable name="status" select="kml:ExtendedData/kml:Data[@name='Tila']/kml:value"/>
                <xsl:variable name="statusDate" select="kml:ExtendedData/kml:Data[@name='Tila todettu']/kml:value"/>
                <xsl:variable name="statusDateOrDefault"
                              select="if (string-length($statusDate) &gt; 9) then $statusDate else '01.01.1970'"/>
                <xsl:variable name="statusDateISO" select="xs:date(concat(
                    substring($statusDateOrDefault,7,4),'-',
                    substring($statusDateOrDefault,4,2),'-',
                    substring($statusDateOrDefault,1,2)))"
                />
                <xsl:variable name="material" select="kml:ExtendedData/kml:Data[@name='Materiaali']/kml:value"/>
                <xsl:variable name="address" select="kml:ExtendedData/kml:Data[@name='Osoite']/kml:value"/>
                <xsl:variable name="mapillary" select="kml:ExtendedData/kml:Data[@name='Mapillary']/kml:value"/>
                <xsl:variable name="hsySource"
                              select="'https://www.hsy.fi/ymparistotieto/avoindata/avoin-data---sivut/paakaupunkiseudun-vesipostit/'"/>

                <node action="modify">
                    <xsl:attribute name="id">
                        <xsl:value-of select="$id"/>
                    </xsl:attribute>
                    <xsl:variable name="coordinates" select="tokenize(kml:Point/kml:coordinates, ',')"/>
                    <xsl:attribute name="lat">
                        <xsl:value-of select="normalize-space($coordinates[2])"/>
                    </xsl:attribute>
                    <xsl:attribute name="lon">
                        <xsl:value-of select="normalize-space($coordinates[1])"/>
                    </xsl:attribute>
                    <tag k="name">
                        <xsl:attribute name="v">
                            <xsl:value-of select="kml:name"/>
                        </xsl:attribute>
                    </tag>
                    <tag k="addr:city">
                        <xsl:attribute name="v">
                            <xsl:value-of select="$city"/>
                        </xsl:attribute>
                    </tag>
                    <tag k="ref">
                        <xsl:attribute name="v">
                            <xsl:value-of select="$hsyId"/>
                        </xsl:attribute>
                    </tag>
                    <tag k="operational_status:note">
                        <xsl:attribute name="v">
                            <xsl:value-of select="$extraInfoOrDefault"/>
                        </xsl:attribute>
                    </tag>
                    <tag k="colour">
                        <xsl:choose>
                            <xsl:when test="$color = 'Turkoosi'">
                                <xsl:attribute name="v">turquoise</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="$color = 'Hopea'">
                                <xsl:attribute name="v">silver</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="$color = 'Vihreä'">
                                <xsl:attribute name="v">green</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="$color = 'Musta'">
                                <xsl:attribute name="v">black</xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="v"></xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                    </tag>
                    <tag k="handle">
                        <xsl:choose>
                            <xsl:when test="$type = 'Jalkapedaali'">
                                <xsl:attribute name="v">foot_pedal</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="$type = 'Nostokahva'">
                                <xsl:attribute name="v">lift_handle</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="$type = 'T-kahva'">
                                <xsl:attribute name="v">twist_handle</xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="v">none</xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                    </tag>
                    <tag k="operational_status">
                        <xsl:choose>
                            <xsl:when test="$status = 'Toimii'">
                                <xsl:attribute name="v">operational</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="$status = 'Ei toimi'">
                                <xsl:attribute name="v">broken</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="$status = 'Ei käytössä'">
                                <xsl:attribute name="v">closed</xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="v">unspecified</xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                    </tag>
                    <tag k="material">
                        <xsl:choose>
                            <xsl:when test="$material = 'Teräs'">
                                <xsl:attribute name="v">steel</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="$material = 'Muovi'">
                                <xsl:attribute name="v">plastic</xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="v"></xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                    </tag>
                    <xsl:analyze-string select="$address"
                                        regex="^(\D+)(\d.*)$">
                        <xsl:matching-substring>
                            <tag k="addr:street">
                                <xsl:attribute name="v">
                                    <xsl:value-of select="normalize-space(regex-group(1))"/>
                                </xsl:attribute>
                            </tag>
                            <tag k="addr:housenumber">
                                <xsl:attribute name="v">
                                    <xsl:value-of select="regex-group(2)"/>
                                </xsl:attribute>
                            </tag>
                        </xsl:matching-substring>
                    </xsl:analyze-string>
                    <tag k="check_date">
                        <xsl:attribute name="v">
                            <xsl:value-of select="$statusDateISO"/>
                        </xsl:attribute>
                    </tag>
                    <tag k="mapillary">
                        <xsl:attribute name="v">
                            <xsl:value-of
                                    select="replace($mapillary, 'https://www.mapillary.com/app/\?pKey=', '')"/>
                        </xsl:attribute>
                    </tag>
                    <tag k="image">
                        <xsl:attribute name="v">
                            <xsl:value-of select="normalize-space($image1)"/>
                        </xsl:attribute>
                    </tag>
                    <tag k="access" v="yes"/>
                    <tag k="addr:country" v="FI"/>
                    <tag k="amenity" v="drinking_water"/>
                    <tag k="bottle" v="yes"/>
                    <tag k="cold_water" v="yes"/>
                    <tag k="fee" v="no"/>
                    <tag k="hot_water" v="no"/>
                    <tag k="indoor" v="no"/>
                    <tag k="operator" v="HSY"/>
                    <tag k="seasonal" v="spring;summer;autumn"/>
                    <tag k="source" v="survey"/>
                    <tag k="source:location" v="survey"/>
                    <tag k="source:ref">
                        <xsl:attribute name="v">
                            <xsl:value-of select="$hsySource"/>
                        </xsl:attribute>
                    </tag>
                    <tag k="source:addr">
                        <xsl:attribute name="v">
                            <xsl:value-of select="$hsySource"/>
                        </xsl:attribute>
                    </tag>
                    <tag k="surface" v="paved"/>
                    <tag k="website:map" v="http://www.polkupyoraily.net/hsy-vesipostit"/>
                </node>
            </xsl:for-each>
        </osm>
    </xsl:template>
</xsl:stylesheet>
