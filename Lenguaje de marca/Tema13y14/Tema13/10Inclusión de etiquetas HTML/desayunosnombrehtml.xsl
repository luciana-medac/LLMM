﻿<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
version="1.0">
	<xsl:template match="/"> <!-- nos ubicamos en el raíz -->  
		<html>
			<head>
				<title>Desayunos</title>
			</head>
			<body>
				<h1>Carta de desayunos</h1>
				<div style="border:solid 3px chocolate;
							padding:5px;width:300px;
							box-shadow: 10px 10px 10px grey"> 
              <!-- Aplicamos en el div el primer template que encuentre -->
							<xsl:apply-templates/>
				</div>
			</body>
		</html>
		
		<!-- va a coger de cada desayuno el nombre -->
	</xsl:template>
	<xsl:template match="desayuno">
		<b><xsl:value-of select="nombre"/></b><br/>
	</xsl:template>
	
</xsl:stylesheet>