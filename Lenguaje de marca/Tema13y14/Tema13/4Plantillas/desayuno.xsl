<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:strip-space elements="*"/> 
	<xsl:preserve-space elements="desayuno"/> 
	<xsl:template match="desayuno[1] | desayuno[2] | desayuno[3] | desayuno[4]">
		No disponible
	</xsl:template>
</xsl:stylesheet>