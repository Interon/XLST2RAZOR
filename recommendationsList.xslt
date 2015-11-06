<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" xmlns:ucomponents.nodes="urn:ucomponents.nodes" xmlns:PS.XSLTsearch="urn:PS.XSLTsearch" 
	exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ucomponents.nodes PS.XSLTsearch ">


<xsl:output method="html" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>

<xsl:template match="/">
  <ul id="slider_panel">
    <xsl:variable name="wNodeSet" select="$currentPage/recommendations/MultiNodePicker"/>
    <xsl:for-each select="$wNodeSet/*">
      <xsl:variable name="currentItem" select="umbraco.library:GetXmlNodeById(.)"/>
      <li>
        <xsl:if test="$currentItem/image != ''">
          <xsl:attribute name="style">background-image:url(<xsl:value-of select="umbraco.library:GetMedia($currentItem/image,0)/umbracoFile"/>)</xsl:attribute>
        </xsl:if>
        <a class="btn_panel">
          <xsl:attribute name="href">
            <xsl:choose>            
                  <xsl:when test="string-length($currentPage/filterPage)>0">
                    <xsl:value-of select="umbraco.library:NiceUrl($currentPage/filterPage)"></xsl:value-of>?feat=<xsl:value-of select="$currentItem/@id"/>
                  </xsl:when>                        
            </xsl:choose>            
          </xsl:attribute>
          View my recommendation</a>
      </li>
    </xsl:for-each>
  </ul>
</xsl:template>
</xsl:stylesheet>