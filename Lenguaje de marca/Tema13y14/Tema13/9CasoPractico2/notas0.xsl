<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="2.0">
	<xsl:output method="text"/>
	<xsl:strip-space elements="instituto ciclos notas alumno"/> 
	<xsl:template match="/">
		Los alumnos aprobados en LLMM son:
		<xsl:apply-templates select="//modulo[@nombre='LLMM']"/>
	</xsl:template>
	<xsl:template match="alumno[nota>='5']">
		<xsl:value-of select="nombre"/>
	</xsl:template>
	<xsl:template match="alumno[nota&lt;'5']">
	<!-- Cuando no esta aprobado no muestro su nombre -->
	</xsl:template>
</xsl:stylesheet>

