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

  <xsl:variable name="mcpNodeSet" select="$currentPage/financingModules/MultiNodePicker"/>
  <xsl:for-each select="$mcpNodeSet/*">
    <xsl:variable name="currentItem" select="umbraco.library:GetXmlNodeById(.)"/>
    <div class="module">
      <h4>
        <xsl:value-of select="$currentItem/title"/>
      </h4>
      <xsl:value-of select="$currentItem/content" disable-output-escaping="yes"/>
      <!--<a href="{umbraco.library:NiceUrl($currentItem/link)}">
        <xsl:variable name="imageUrl" select="umbraco.library:GetMedia($currentItem/image,0)"></xsl:variable>
        <img src="{$imageUrl/umbracoFile}" width="239" height="187" alt=""/>
      </a>-->
    </div>
  </xsl:for-each>

</xsl:template>

</xsl:stylesheet>