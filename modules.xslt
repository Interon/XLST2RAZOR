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
  <xsl:variable name="mcpNodeSet" select="$currentPage/modules/MultiNodePicker"/>
  <xsl:variable name="currentRegionId" select="$currentPage/parent::*/parent::*/@id" />
  <xsl:variable name="rootNode" select="$currentPage/parent::*/parent::*/parent::*" />
  <div class="clearfix">
  <xsl:for-each select="$mcpNodeSet/*">
    <xsl:variable name="currentItem" select="umbraco.library:GetXmlNodeById(.)"/>
    <div class="module">
      <h4>
        <xsl:value-of select="$currentItem/title"/>
      </h4>
      <xsl:value-of select="$currentItem/content" disable-output-escaping="yes"/>
    </div>
  </xsl:for-each>
  <div class="module regionalSites">
      <h4>
        Regional Honda Sites
      </h4>
      <ul>
        <xsl:for-each select="$rootNode/Region">
          <xsl:if test="@nodeName != 'New South Africa'">
      <xsl:if test="@nodeName != 'South Africa UAT'">
        <xsl:variable name="imageUrl" select="umbraco.library:GetMedia(flag/data/item/image,0)"></xsl:variable>
         <xsl:variable name="country" select="@nodeName"></xsl:variable>
        <li class="{$country}">
        <a href="{umbraco.library:NiceUrl(umbracoRedirect)}">
          <img src="{$imageUrl/umbracoFile}" width="30" height="20" alt=""/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="@nodeName" />
        </a>
        </li>
      </xsl:if>
          </xsl:if>
        </xsl:for-each>
      </ul>
    </div>
</div>
</xsl:template>

</xsl:stylesheet>