<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
version="1.0">
	<xsl:template match="/carta">
		<html>
			<head>
				<style>
          table {border:solid 2px black; box-shadow:10px 10px 10px grey;}
          th{color:white; background-color:#159dcc;}
          td{border:solid 2px black; }
				</style>
			</head>
				<body>
					<table>
						<th>Nombre</th>
						<th>Precio</th>
						<xsl:for-each select="desayuno">
						 <!-- Por cada desayuno, ordenalo de forma descendente-->
							<xsl:sort select="precio" order="descending"/>
							<tr>
								<td><xsl:value-of select="nombre"/></td>
								<td><xsl:value-of select="precio"/></td>
							</tr>
						</xsl:for-each>
					</table>
				</body>
		</html>
	</xsl:template>
</xsl:stylesheet>