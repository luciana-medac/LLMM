<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Carta de Desayunos</title>
                			<style>
                        table {border:solid 2px black;
                        box-shadow:10px 10px 10px grey;}
                        th{color:white; background-color:#159dcc;} 
                        td{border:solid 2px black; }
                      </style>
            </head>
            <body>
                <h1>Desayunos económicos</h1>
                <table border="1">
                    <tr>
                        <th>Nombre</th>
                        <th>Precio</th>
                    </tr>
                    <xsl:for-each select="carta/desayuno">  <!--  por cada desayuno que haya en carta -->
                        <xsl:if test="precio &lt; 5"> <!-- Si el precio es menor que 5, hace lo siguiente--> 
                            <tr>
                                <td><xsl:value-of select="nombre"/></td>
                                <td><xsl:value-of select="precio"/></td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
