<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:strip-space elements="instituto ciclos notas"/>
    <xsl:output method="xml"/>
    <xsl:template match="ciclos"/>
    <xsl:template match="//alumno">
        <alumno>
            <xsl:attribute name="ciclo">
                <xsl:value-of select="../@ciclo"/>
            </xsl:attribute>
            <xsl:attribute name="modulo">
                <xsl:value-of select="../@nombre"/>
            </xsl:attribute>
            <xsl:attribute name="nota">
                <xsl:value-of select="nota"/>
            </xsl:attribute>
            <xsl:value-of select="nombre"/>
        </alumno>
    </xsl:template>
</xsl:stylesheet>