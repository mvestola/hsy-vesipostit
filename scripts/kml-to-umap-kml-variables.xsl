<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:kml="http://www.opengis.net/kml/2.2">
    <xsl:output encoding="UTF-8" method="xml" indent="yes" version="1.0"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@name">
        <xsl:choose>
            <xsl:when test=". = 'Väri'">
                <xsl:attribute name="name">
                    <xsl:text>color</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test=". = 'Materiaali'">
                <xsl:attribute name="name">
                    <xsl:text>material</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test=". = 'Mapillary'">
                <xsl:attribute name="name">
                    <xsl:text>mapillary</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test=". = 'Tyyppi'">
                <xsl:attribute name="name">
                    <xsl:text>handle_type</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test=". = 'Tila'">
                <xsl:attribute name="name">
                    <xsl:text>status</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test=". = 'Tila todettu'">
                <xsl:attribute name="name">
                    <xsl:text>status_date</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test=". = 'HSY tunniste'">
                <xsl:attribute name="name">
                    <xsl:text>hsy_id</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test=". = 'Kuva 1'">
                <xsl:attribute name="name">
                    <xsl:text>image1</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test=". = 'Kuva 2'">
                <xsl:attribute name="name">
                    <xsl:text>image2</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test=". = 'Osoite'">
                <xsl:attribute name="name">
                    <xsl:text>address</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test=". = 'Kaupunki'">
                <xsl:attribute name="name">
                    <xsl:text>city</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test=". = 'Lisätietoja'">
                <xsl:attribute name="name">
                    <xsl:text>extra_info</xsl:text>
                </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="name">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
