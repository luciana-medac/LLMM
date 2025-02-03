<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:output method="xml" indent="yes"/> <!-- el metodo de salida va a ser xml y va a salir tabulado -->
	<xsl:template match="/"> <!--  nos vamos al elemento raiz y aplicamos un template--> 
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="desayuno"> <!-- dentro de la etiqueta desayuno, va a cambiar calorias a atributo y al precio se le aplica el IVA-->
		<desayuno>
			<xsl:attribute name="calorias">
				<xsl:value-of select="calorias"/>
			</xsl:attribute>
			<nombre>
				<xsl:value-of select="nombre"/>
			</nombre>
			<precio>
				<xsl:value-of select="precio"/>
			</precio>
			<descripcion>
				<xsl:value-of select="descripcion"/>
			</descripcion>
			<xsl:element name="precio_con_iva">
				<xsl:value-of select="precio*1.16"/>
			</xsl:element>
		</desayuno>
	</xsl:template>
</xsl:stylesheet>