<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
version="1.0">
	<xsl:template match="/"> <!-- se va a la raíz --> 
		Carta de desayunos
		    <!-- va a coger el primer template que haya fuera --> 
        <xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="desayuno"> <!--  si hace match con desayuno, entonces hace lo siguiente: --> 
	    <!-- este lo que hace es mapear el xml de desayuno, escribir desayuno y sacar el nombre -->
			Desayuno: <xsl:value-of select="nombre"/>
	</xsl:template>
</xsl:stylesheet>

<!-- para poner espacios <xsl:text/> <xsl:text/>