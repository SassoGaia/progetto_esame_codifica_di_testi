<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlsn="http://www.w3.org/1999/xhtml" version="1.0">

     <xsl:output method="html" encoding="UTF-8" indent="yes"/>

        <xsl:template match="/" > <!-- radice -->
            <html>
                <head>
                    <title>
                        <xsl:value-of select="//tei:msIdentifier//tei:idno"/> - Edizione digitale
                    </title>
                    <link href="stile.css" rel="stylesheet" type="text/css"/>
                    <script src="progetto.js"></script> 
                </head>
                <body>
                    <div class="home">
                        <h1> Edizione digitale lettere 1.32. I - II 
                        </h1>
                        <p class="link">
                            <a href="#32.I" id="link1">LL1.32 I</a> &#160; 
                            ||
                            &#160;  <a href="#32.II" id="link2">LL1.32 II</a>
                       </p> 
                       <!-- Informazioni generali sul documento (titoli, descrizione)-->
                        <h2>Informazioni sul documento</h2>
                        <div class="descrizione_documento">
                            
                            <xsl:apply-templates select="//tei:msContents"/>
                            <xsl:apply-templates select="//tei:physDesc"/>
                            <xsl:apply-templates select="//tei:msDesc"/>
                            <xsl:apply-templates select="//tei:additional"/>
                        </div>

                        <!-- Lettera 1-->
                        <a name="32.I"></a>
                        <div class="first">
                            <h2>LL1.32 I</h2>
                            <xsl:apply-templates select="//tei:titleStmt/tei:title[@n='1']"/> 
                            <xsl:apply-templates select="//tei:titleStmt/tei:author"/>
                            <xsl:apply-templates select="//tei:titleStmt/tei:respStmt"/>
                            <xsl:apply-templates select="//tei:body[@n='1']"/>
                            <xsl:apply-templates select="//tei:back[@n='1']"/>
                        </div>
                        <!--Lettera 2-->
                        <a name="32.II"></a>
                        <div class="second">
                            <h2>LL1.32 II</h2>
                            <xsl:apply-templates select="//tei:titleStmt/tei:title[@n='2']"/>
                            <xsl:apply-templates select="//tei:titleStmt/tei:author"/>
                            <xsl:apply-templates select="//tei:titleStmt/tei:respStmt"/>
                            <xsl:apply-templates select="//tei:body[@n='2']"/>
                            <xsl:apply-templates select="//tei:back[@n='2']"/>
                        </div>
                    </div>
                    <footer>
                        <xsl:apply-templates select="//tei:editionStmt"/>
                        <xsl:apply-templates select="//tei:licence"/>
                    </footer>
                </body> 
            </html>
        </xsl:template>    
    
    <!-- Informazioni generali sulle lettere -->
        <xsl:template match="tei:msContents"> 
            <b>Lettere: </b>
            <p>
                <xsl:value-of select="//tei:msItem[@n='1']"/>,
            </p>
            <p>
                <xsl:value-of select="//tei:msItem[@n='2']"/>.
            </p>
        </xsl:template>

        <xsl:template match="tei:physDesc"> 
        <!-- descrizione del manoscritto fisico -->
            <b>Formato del documento: </b>
            <xsl:value-of select="//tei:measure"/> folio, millimetri:
            <xsl:value-of select="//tei:height"/> x
            <xsl:value-of select="//tei:width"/>
            <br/>
            <br/>
            <b> Descrizione del documento:</b>
            <br />
            <xsl:value-of select="//tei:support/tei:p[@n='1']"/>
            <br/>
            <xsl:value-of select="//tei:support/tei:p[@n='2']"/>
            <p>
                <xsl:value-of select="//tei:physDesc//tei:foliation"/>
            </p>
            <b> Informazioni scrittura e annotazioni: </b>
            <br />
            <xsl:for-each select="//tei:handNote">
                <xsl:value-of select="./tei:p"/>
                <br/>
            </xsl:for-each>
        </xsl:template>

        <xsl:template match="tei:msDesc"> 
            <p>
                <b>Ubicazione: </b>
                <xsl:value-of select="//tei:repository"/>,
                <xsl:value-of select="//tei:settlement"/>,
                <xsl:value-of select="//tei:country"/>.
            </p>
            <p>
                <xsl:value-of select="//tei:altIdentifier/tei:idno"/>
            </p>
            <p>
                <b>Lingua: </b>
                <xsl:value-of select="//tei:textLang"/>
            </p>
        </xsl:template>
        
        <xsl:template match="tei:additional">
            <p>
                <b> Note: </b>
                <xsl:value-of select="//tei:adminInfo/tei:note"/>
            </p>
            <br/>
            <!-- Galleria foto -->
            <img id="foto"/>
            <span id="descImg"></span> 
            <br/>
            <input type="image" src="freccia-sinistra.png" id="avanti"/>
            <input type="image" src="freccia-destra.png" id="indietro"/>
        </xsl:template>

    <!-- Informazioni dettagliate per singola lettera-->
        <xsl:template match="tei:titleStmt/tei:title">
            <p>
                <b>Titolo: </b> 
                <xsl:apply-templates/>
            </p>
        </xsl:template>

        <xsl:template match="tei:titleStmt/tei:author">
            <p>
                <b>Autore: </b> 
                <xsl:apply-templates/>
            </p>
         </xsl:template>

        <xsl:template match="tei:respStmt">
            <p>
            <xsl:apply-templates/>
            </p>
        </xsl:template>

        <xsl:template match="tei:body">
            <div id="testo">
                <xsl:apply-templates/>
            </div>
        </xsl:template>

        <xsl:template match="tei:lb">
            <xsl:apply-templates/>
            <br/>
        </xsl:template>

        <xsl:template match="tei:dateline">
            <p id="dateline">
            <xsl:apply-templates/>
            </p>
        </xsl:template>

        <xsl:template match="tei:hi[@rend='first_line_indented']">
            <!-- Prima riga indentata -->
            &#160;
            <xsl:apply-templates/>
        </xsl:template>

        <xsl:template match="tei:supplied">
            <i>
                <xsl:apply-templates/>
            </i>
        </xsl:template>

        <xsl:template match="tei:del">
            <del>
                <xsl:apply-templates/>
            </del>
        </xsl:template>

        <xsl:template match="tei:add[@place='supralinear']">
            <sup>
                <xsl:apply-templates/>
            </sup>
        </xsl:template>

        <xsl:template match="tei:expan">
            [<xsl:apply-templates/>]
        </xsl:template>

        <xsl:template match="tei:reg">
            [<xsl:apply-templates/>]
        </xsl:template>

    <!-- Note delle singole lettere-->
        <xsl:template match="tei:back">
            <div id="back">
                <b>Note</b>
                <xsl:apply-templates/>
            </div>
        </xsl:template>

        <xsl:template match="tei:note">
            <br/>
            <xsl:apply-templates/>
        </xsl:template>

        <xsl:template match="tei:back//tei:head">
            <br/>
            <b>
                <xsl:apply-templates/>
            </b>
        </xsl:template> 

        <xsl:template match="tei:back//tei:bibl//tei:bibl">
                <br/>
                <xsl:apply-templates/>
        </xsl:template>


</xsl:stylesheet>

