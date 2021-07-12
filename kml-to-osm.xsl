<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:kml="http://www.opengis.net/kml/2.2">
    <xsl:output encoding="UTF-8" method="xml" indent="yes" version="1.0"/>
    <xsl:template match="/">
        <osm version="0.6" upload="false" generator="JOSM">
            <xsl:for-each select="kml:kml/kml:Document/kml:Folder/kml:Placemark">
                <xsl:variable name="id" select="-101752 - position()"/>
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
                            <xsl:value-of select="kml:ExtendedData/kml:Data[@name='Kaupunki']/kml:value"/>
                        </xsl:attribute>
                    </tag>
                    <tag k="ref">
                        <xsl:attribute name="v">
                            <xsl:value-of select="kml:ExtendedData/kml:Data[@name='HSY tunniste']/kml:value"/>
                        </xsl:attribute>
                    </tag>
                    <tag k="operational_status:note">
                        <xsl:attribute name="v">
                            <xsl:value-of select="kml:ExtendedData/kml:Data[@name='Lisätietoja']/kml:value"/>
                        </xsl:attribute>
                    </tag>
                    <tag k="colour">
                        <xsl:choose>
                            <xsl:when test="kml:ExtendedData/kml:Data[@name='Väri']/kml:value = 'Hopea'">
                                <xsl:attribute name="v">silver</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="kml:ExtendedData/kml:Data[@name='Väri']/kml:value = 'Vihreä'">
                                <xsl:attribute name="v">green</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="kml:ExtendedData/kml:Data[@name='Väri']/kml:value = 'Musta'">
                                <xsl:attribute name="v">black</xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="v"></xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                    </tag>
                    <tag k="handle">
                        <xsl:choose>
                            <xsl:when test="kml:ExtendedData/kml:Data[@name='Tyyppi']/kml:value = 'Nostokahva'">
                                <xsl:attribute name="v">lift_handle</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="kml:ExtendedData/kml:Data[@name='Tyyppi']/kml:value = 'T-kahva'">
                                <xsl:attribute name="v">twist_handle</xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="v">none</xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                    </tag>
                    <tag k="operational_status">
                        <xsl:choose>
                            <xsl:when test="kml:ExtendedData/kml:Data[@name='Tila']/kml:value = 'Toimii'">
                                <xsl:attribute name="v">operational</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="kml:ExtendedData/kml:Data[@name='Tila']/kml:value = 'Ei toimi'">
                                <xsl:attribute name="v">broken</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="kml:ExtendedData/kml:Data[@name='Tila']/kml:value = 'Ei käytössä'">
                                <xsl:attribute name="v">closed</xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="v">unspecified</xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                    </tag>
                    <tag k="material">
                        <xsl:choose>
                            <xsl:when test="kml:ExtendedData/kml:Data[@name='Materiaali']/kml:value = 'Teräs'">
                                <xsl:attribute name="v">steel</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="kml:ExtendedData/kml:Data[@name='Materiaali']/kml:value = 'Muovi'">
                                <xsl:attribute name="v">plastic</xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="v"></xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                    </tag>
                    <xsl:analyze-string select="kml:ExtendedData/kml:Data[@name='Osoite']/kml:value"
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
                    <xsl:variable name="dateFinnish"
                                  select="kml:ExtendedData/kml:Data[@name='Tila todettu']/kml:value"/>
                    <xsl:variable name="dateFinnishOrDefault"
                                  select="if (string-length($dateFinnish) &gt; 9) then $dateFinnish else '01.01.1970'"/>
                    <xsl:variable name="dateISO" select="xs:date(concat(
            substring($dateFinnishOrDefault,7,4),'-',
            substring($dateFinnishOrDefault,4,2),'-',
            substring($dateFinnishOrDefault,1,2)))"/>
                    <tag k="operational_status:date">
                        <xsl:attribute name="v">
                            <xsl:value-of select="$dateISO"/>
                        </xsl:attribute>
                    </tag>
                    <tag k="mapillary">
                        <xsl:attribute name="v">
                            <xsl:value-of
                                    select="replace(kml:ExtendedData/kml:Data[@name='Mapillary']/kml:value, 'https://www.mapillary.com/app/\?pKey=', '')"/>
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
                    <tag k="source:location"
                         v="https://www.hsy.fi/ymparistotieto/avoindata/avoin-data---sivut/paakaupunkiseudun-vesipostit/"/>
                    <tag k="source:ref"
                         v="https://www.hsy.fi/ymparistotieto/avoindata/avoin-data---sivut/paakaupunkiseudun-vesipostit/"/>
                    <tag k="source:addr"
                         v="https://www.hsy.fi/ymparistotieto/avoindata/avoin-data---sivut/paakaupunkiseudun-vesipostit/"/>
                    <tag k="surface" v="paved"/>
                    <tag k="website:map" v="http://www.polkupyoraily.net/hsy-vesipostit"/>
                </node>
            </xsl:for-each>
        </osm>
    </xsl:template>
</xsl:stylesheet>
