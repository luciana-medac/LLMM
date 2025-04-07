<?xml version="1.0" encoding="UTF-8"?>
<!-- Enlazamos el xsl con el xml de plantas -->
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="1.0">
    
    <!-- Se aplica la transformación al elemento raíz que es jardín -->
    <xsl:template match="/jardin">
        <html>
            <head>
                <!-- Estilos que le vamos a aplicar a la tabla -->
                <style>
                    table { border: solid 2px black; box-shadow: 10px 10px 10px grey; }
                    th { color: white; background-color: #159dcc; padding: 10px; }
                    td { border: solid 2px black; padding: 8px; text-align: center; }
                    #tipo-flor { background-color: pink; }
                    #tipo-arbol { background-color: lightgreen; }
                    #tipo-suculenta { background-color: lightblue; }
                    #tipo-hierba { background-color: lightgray; }
                </style>
            </head>
            <body>
                <h2>Listado de Plantas</h2>
                
                <!-- Creamos la tabla -->
                <table>
                    <!-- Encabezados de la tabla -->
                    <tr>
                        <th>Nombre</th>
                        <th>Tipo</th>
                        <th>Origen</th>
                    </tr>
                    <!-- Recorre cada elemento "planta" y crea una fila por cada elemento -->
                    <xsl:for-each select="planta">
                        <tr>
                            <!-- Crea una celda con el nombre de la planta -->
                            <td><xsl:value-of select="nombre"/></td>
                            <!-- Asigna el color según el tipo de planta -->
                            <xsl:choose>
                                <xsl:when test="@tipo = 'flor'">
                                    <td id="tipo-flor"><xsl:value-of select="@tipo"/></td>
                                </xsl:when>
                                <xsl:when test="@tipo = 'arbol'">
                                    <td id="tipo-arbol"><xsl:value-of select="@tipo"/></td>
                                </xsl:when>
                                <xsl:when test="@tipo = 'suculenta'">
                                    <td id="tipo-suculenta"><xsl:value-of select="@tipo"/></td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td id="tipo-hierba"><xsl:value-of select="@tipo"/></td>
                                </xsl:otherwise>
                            </xsl:choose>
                            <td><xsl:value-of select="origen"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>



