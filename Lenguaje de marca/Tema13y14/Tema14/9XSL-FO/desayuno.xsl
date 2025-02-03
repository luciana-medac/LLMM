<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"> 
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/carta">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master
					master-name="A4-portrait"
					page-height="29.7cm"
					page-width="21.0cm" margin="2cm">
					<fo:region-body />
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="A4-portrait">
				<fo:flow flow-name="xsl-region-body">
					<fo:block font-size="24pt">
						<fo:block 
							margin-bottom="20pt" 
							border="solid 2px chocolate" 
							padding="3pt" 
							font-weight="bold" 
							text-align="center">
							Carta de desayunos </fo:block> 
						<xsl:apply-templates />
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	
	<xsl:template match="desayuno">
	<fo:block font-size="12pt"
				font-family="sans-serif"
				line-height="15pt"
				space-after.optimum="20pt"
				text-align="justify">
		<fo:block border-bottom="solid 2px black" margin-bottom="5pt" font-weight="bold">
			Desayuno 
		</fo:block>
		<fo:block><fo:inline font-weight="bold"> 
			Nombre: </fo:inline><xsl:value-of select="nombre"/>
		</fo:block>
		<fo:block><fo:inline font-weight="bold"> 
			Precio: </fo:inline><xsl:value-of select="precio"/>
		</fo:block>
		<fo:block><fo:inline font-weight="bold">
			Descripción: </fo:inline><xsl:value-of select="descripcion"/>
		</fo:block>
		<fo:block><fo:inline font-weight="bold"> 
			Calorias: </fo:inline> <xsl:value-of select="calorias"/>
		</fo:block>
	</fo:block>
	</xsl:template>
</xsl:stylesheet>