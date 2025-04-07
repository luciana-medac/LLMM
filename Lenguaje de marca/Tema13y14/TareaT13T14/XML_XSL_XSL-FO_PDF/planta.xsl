<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
    
    <xsl:template match="/jardin">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4">
                    <fo:region-body margin="20mm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            
            <fo:page-sequence master-reference="A4">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="18pt" font-family="Arial" font-weight="bold"
                        text-align="center" margin-bottom="10mm">Listado de Plantas</fo:block>
                    
                    <!-- Tabla -->
                    <fo:table border="2pt solid black" border-collapse="collapse"
                        width="100%">
                        <fo:table-body>
                            
                            <!-- Encabezados -->
                            <fo:table-row background-color="#159dcc" color="white">
                                <fo:table-cell border="2pt solid black" padding="6pt">
                                    <fo:block font-weight="bold" text-align="center">Nombre</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="2pt solid black" padding="6pt">
                                    <fo:block font-weight="bold" text-align="center">Tipo</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="2pt solid black" padding="6pt">
                                    <fo:block font-weight="bold" text-align="center">Origen</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            
                            <!-- Filas de la tabla -->
                            <xsl:for-each select="planta">
                                <fo:table-row>
                                    <fo:table-cell border="2pt solid black" padding="6pt">
                                        <fo:block text-align="center">
                                            <xsl:value-of select="nombre"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    
                                    <!-- Color según el tipo de planta -->
                                    <fo:table-cell border="2pt solid black" padding="6pt">
                                        <xsl:choose>
                                            <xsl:when test="@tipo = 'flor'">
                                                <fo:block text-align="center"
                                                    background-color="pink">
                                                    <xsl:value-of select="@tipo"/>
                                                </fo:block>
                                            </xsl:when>
                                            <xsl:when test="@tipo = 'arbol'">
                                                <fo:block text-align="center"
                                                    background-color="lightgreen">
                                                    <xsl:value-of select="@tipo"/>
                                                </fo:block>
                                            </xsl:when>
                                            <xsl:when test="@tipo = 'suculenta'">
                                                <fo:block text-align="center"
                                                    background-color="lightblue">
                                                    <xsl:value-of select="@tipo"/>
                                                </fo:block>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <fo:block text-align="center"
                                                    background-color="lightgray">
                                                    <xsl:value-of select="@tipo"/>
                                                </fo:block>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </fo:table-cell>
                                    
                                    <fo:table-cell border="2pt solid black" padding="6pt">
                                        <fo:block text-align="center">
                                            <xsl:value-of select="origen"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            
                        </fo:table-body>
                    </fo:table>
                    
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    
</xsl:stylesheet>





