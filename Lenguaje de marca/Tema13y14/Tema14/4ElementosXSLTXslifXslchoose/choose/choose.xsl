<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:template match="/carta">
		<html>
			<head>
				<style>
					table{border:solid 2px black; box-shadow:10px 10px 10px grey;}
					th{color:white;background-color: #159dcc;}
					td{border:solid 2px black; }
					#menor5{background-color:gray;}
					#mayor7{background-color: yellow; }
				</style>
			</head>
			<body>
				<table>
					<tr>
						<th>Nombre</th>
						<th>Precio</th> 
					</tr> 
					 <!--  Por cada desayuno,  escribimos -->
					<xsl:for-each select="desayuno">
						<tr>
							<td><xsl:value-of
								select="nombre"/></td>
								 <!-- cuando el precio sea menor que 5 aplicamos el precio y  le ponemos un id de menor que 5-->
							<xsl:choose>
								<xsl:when
									test="precio &lt; 5">
									<td id="menor5">
										<xsl:value-of
											select="precio"/>
									</td>
								</xsl:when>
								 <!-- Cuando el precio sea  menor que 7 se le pone un identificador -->
								<xsl:when
									test="precio &lt; 7">
									<td id="menor7">
										<xsl:value-of
											select="precio"/>
									</td>
								</xsl:when>
								 <!--  si no es ni uno ni otro, se deja igual-->
								<xsl:otherwise>
									<td><xsl:value-of
										select="precio"/>
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>