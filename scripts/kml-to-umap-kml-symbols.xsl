<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:kml="http://www.opengis.net/kml/2.2">
    <xsl:output encoding="UTF-8" method="xml" indent="yes" version="1.0"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="kml:ExtendedData/kml:Data[@name='Tyyppi']">
        <xsl:copy-of select="."/>
        <xsl:choose>
            <xsl:when test="kml:value = 'Nostokahva'">
                <Data name="icon_symbol">
                    <value>N</value>
                </Data>
            </xsl:when>
            <xsl:when test="kml:value = 'T-kahva'">
                <Data name="icon_symbol">
                    <value>T</value>
                </Data>
            </xsl:when>
            <xsl:when test="kml:value = 'Putki'">
                <Data name="icon_symbol">
                    <value>P</value>
                </Data>
            </xsl:when>
            <xsl:otherwise>
                <Data name="icon_symbol">
                    <value>?</value>
                </Data>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="kml:ExtendedData/kml:Data[@name='Tila']">
        <xsl:copy-of select="."/>
        <xsl:choose>
            <xsl:when test="kml:value = 'Toimii'">
                <Data name="status_color">
                    <value>DarkBlue</value>
                </Data>
            </xsl:when>
            <xsl:when test="kml:value = 'Ei toimi'">
                <Data name="status_color">
                    <value>Red</value>
                </Data>
            </xsl:when>
            <xsl:otherwise>
                <Data name="status_color">
                    <value>Grey</value>
                </Data>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
