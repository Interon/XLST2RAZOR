<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" xmlns:ucomponents.nodes="urn:ucomponents.nodes" 
  exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ucomponents.nodes "> 

<xsl:output method="html" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>

<xsl:template match="/">
  <xsl:variable name="mainNode" select="$currentPage"></xsl:variable>
  <ul class="menu clearfix">
    <xsl:for-each select="$mainNode/* [@isDoc]">
    <li>
      <xsl:choose>
        <xsl:when test="@id = $currentPage/@id">
          <xsl:attribute name="class">active</xsl:attribute>
        </xsl:when>     
      </xsl:choose>      
      <a href="./{@urlName}/">
        <xsl:attribute name="class">ajaxy ajaxy-page</xsl:attribute>
        <xsl:value-of select="@nodeName"/>
      </a>
    </li>
    </xsl:for-each> 
    <a class="btn" href="../../" style="Float:right;margin-top:7px;margin-right:5px;color:#ffffff;background:#3A3A3A; font-size:bold;width:100px;border-radius:5px;border:1px solid #3a3a3a;">View All models</a>
 </ul>
  
</xsl:template>
</xsl:stylesheet>

