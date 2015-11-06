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
  <xsl:variable name="itemsPerRow" select="4"/>
  <xsl:variable name="divOpen">
    <xsl:text>&lt;div class='wrap_4_col clearfix'&gt;</xsl:text>
  </xsl:variable>
  <xsl:variable name="divClose">
    <xsl:text>&lt;/div&gt;</xsl:text>
  </xsl:variable>
  <xsl:variable name="mcpNodeSet" select="$currentPage/columns/MultiNodePicker"/>
  <xsl:for-each select="$mcpNodeSet/*">    
    <xsl:variable name="currentItem" select="umbraco.library:GetXmlNodeById(.)"/>
    <xsl:if test="position() mod $itemsPerRow = 1">
      <xsl:value-of select="$divOpen" disable-output-escaping="yes" />     
    </xsl:if>
    <xsl:if test ="$currentItem/image != ''">
    <div class="col">      
      
        <img src="{umbraco.library:GetMedia($currentItem/image,0)/umbracoFile}" alt="" class="thumb"></img>  
           
        <h3>
          <xsl:value-of select="$currentItem/header"/>
        </h3>
        <xsl:value-of select="$currentItem/content" disable-output-escaping="yes"/>     
      </div>
    </xsl:if> 
    <xsl:if test="position() mod $itemsPerRow = 0 or position() = last()">
      <xsl:value-of select="$divClose" disable-output-escaping="yes"/>      
    </xsl:if>
    
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>