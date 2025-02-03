<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
version="1.0">
	<xsl:template match="carta">
	Número de desayunos
	<!-- esto va a contar los desayunos -->
		<xsl:value-of select="count(desayuno)"/>
	Tipo de carta
	<!-- esto va a decir el tipo de carta que es -->
		<xsl:value-of select="@tipo"/>
	</xsl:template>
</xsl:stylesheet>