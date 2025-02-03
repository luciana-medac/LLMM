<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- Escribe el siguiente texto -->
	<xsl:template match="carta"> 
	  Precio del desayuno 1:
		<xsl:value-of select="desayuno [3]/precio" /> <!-- va a mostrar el precio del desayuno 3 --> 
	</xsl:template>
</xsl:stylesheet>