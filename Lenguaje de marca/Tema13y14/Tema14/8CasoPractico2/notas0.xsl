<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
xmlns:xsl=
"http://www.w3.org/1999/XSL/Transform"
version="1.0">
	<xsl:strip-space elements="instituto ciclos notas"/> <xsl:output method="html"/>
	<xsl:template match="/">
		<html>
			<head><title>Ciclos</title> </head>
			<body>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="//ciclos/especialidad">
	<h2><xsl:value-of select="@nombre"/></h2>
		<ol>
			<xsl:for-each select="ciclo">
				<xsl:sort select="."/>
				<xsl:if test="@grado='Superior'">
					<li><xsl:value-of select="."/></li>
				</xsl:if>
			</xsl:for-each>
		</ol>
	</xsl:template>
	<xsl:template match="notas">
	</xsl:template>
</xsl:stylesheet>