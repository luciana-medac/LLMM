<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<html>
			<head><title>Notas de los alumnos</title>
				<style>
					table {border:solid 2px black;}
					th{color:white; background-color:#159DCC}
					td{border:solid 2px black; }
					.aprobado {background-color:green; color:white;}
					.suspenso{background-color:red;
					color:white;}
				</style>
			</head>
			<body>
				<div>
					<h1 style="color: chocolate">
						<xsl:value-of select="instituto/@nombre"/></h1>
					<h2 style="margin-left:15px;margin-top:-10px;">
						Notas Alumnos</h2>		﻿
					<table>
						<th>Nombre</th>
						<th>Nota</th>
						<th>Modulo</th>
						<xsl:for-each select="//modulo/alumno"> 
							<xsl:sort select="nota" order="descending"/>
							<tr>
								<td><xsl:value-of select="nombre"/></td> 
								<xsl:choose>
									<xsl:when test="nota&lt;5">
										<td class="suspenso">Suspenso</td> </xsl:when>
									<xsl:when test="nota>=5 and nota&lt;6"> 
										<td class="aprobado">Suficiente</td> 
									</xsl:when>
									<xsl:when test="nota>=6 and nota&lt;7">
										<td class="aprobado">Bien</td>
									</xsl:when>
									<xsl:when test="nota>=7 and nota&lt;9">
										<td class="aprobado">Notable</td>
									</xsl:when>
									<xsl:otherwise>
										<td class="aprobado">Sobresaliente</td> 
									</xsl:otherwise>
								</xsl:choose>
								<td><xsl:value-of select="../@nombre"/></td>
							</tr>
						</xsl:for-each>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>