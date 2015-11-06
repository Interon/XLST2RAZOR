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
  <xsl:variable name="rirNodeSet" select="$currentPage/images/data"/>
  <xsl:if test="count($rirNodeSet/item)>0">
  <xsl:for-each select="$rirNodeSet/item">
  <li>
    <a title="{imageTitle}">
      <xsl:if test="image872x480 != ''">
        <xsl:attribute name="href"><xsl:value-of select="umbraco.library:GetMedia(image872x480,0)/umbracoFile"/></xsl:attribute>
      </xsl:if>
      <xsl:if test="image1024x768 != ''">
        <xsl:attribute name="data-wallpaper-1024"><xsl:value-of select="umbraco.library:GetMedia(image1024x768,0)/umbracoFile"/></xsl:attribute>
      </xsl:if>
      <xsl:if test="image1280x720 != ''">
        <xsl:attribute name="data-wallpaper-1280"><xsl:value-of select="umbraco.library:GetMedia(image1280x720,0)/umbracoFile"/></xsl:attribute>
      </xsl:if>
      <xsl:if test="image1600x1200 != ''">
        <xsl:attribute name="data-wallpaper-1600"><xsl:value-of select="umbraco.library:GetMedia(image1600x1200,0)/umbracoFile"/></xsl:attribute>
      </xsl:if>
      <img width="48" height="48" alt="">
         <xsl:if test="image872x480 != ''">
        <xsl:attribute name="src">/image-resize?path=<xsl:value-of select="umbraco.library:GetMedia(image872x480,0)/umbracoFile"/>&amp;width=200&amp;height=200&amp;crop=true</xsl:attribute>
      </xsl:if>        
      </img>
    </a>
  </li>
  </xsl:for-each>
    </xsl:if>
</xsl:template>

</xsl:stylesheet>