<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="2.0">
	<xsl:output method="text" />
	<xsl:strip-space elements="instituto ciclos notas modulo"/>
	<xsl:template match="//ciclos">
	En este instituto se imparten
	los ciclos de DAW, ASIR y SRM.
	Los alumnos matriculados en LLMM son:
	</xsl:template>
		<xsl:template match="//notas/modulo [@nombre!='LLMM']">
	</xsl:template>
</xsl:stylesheet>