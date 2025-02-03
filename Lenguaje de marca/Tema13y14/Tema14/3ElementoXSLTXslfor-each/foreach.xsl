<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
version="1.0">
	<xsl:template match="/carta">
		<html>
		<head>
			<style>
				table {border:solid 2px black;
				box-shadow:10px 10px 10px grey;}
				th{color:white; background-color:#159dcc;} td{border:solid 2px black; }
			</style>
		</head>
		<body>
			<table>
				<th>Nombre</th>
				<th>Precio</th> <!-- Estas son las columnas -->
				<xsl:for-each select="desayuno"> <!--  Por cada desayuno, haz lo siguiente-->
				<tr>
				<!--  va a hacer una fila por cada desayuno, va a escribir el nombre y el precio-->
				<td><xsl:value-of select="nombre"/></td>
				 <td><xsl:value-of select="precio"/></td>
				</tr> </xsl:for-each>
			</table>
		</body>
		</html>
	</xsl:template>
</xsl:stylesheet>