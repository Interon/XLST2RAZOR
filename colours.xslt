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
  <p class="title">
    <strong>*Model range may vary. Please refer to the brochure for full specifications</strong>
  </p>
  <p class="title">
    Choose your colour - metallics
  </p>
  <div class="center_list">
    <ul class="colour_options clearfix">
      <xsl:variable name="mcNodeSet" select="$currentPage/metallicColours/MultiNodePicker"/>
      <xsl:for-each select="$mcNodeSet/*">
        <xsl:variable name="currentItem" select="umbraco.library:GetXmlNodeById(.)"/>
        <xsl:variable name="imageCarUrl">          
            <xsl:if test="$currentItem/productImage != ''">
              <xsl:value-of select="umbraco.library:GetMedia($currentItem/productImage,0)/umbracoFile"/>
            </xsl:if>             
        </xsl:variable>
        <xsl:variable name="imageColourUrl">
          <xsl:if test="$currentItem/colourImage != ''">
            <xsl:value-of select="umbraco.library:GetMedia($currentItem/colourImage,0)/umbracoFile"/>
          </xsl:if>
        </xsl:variable>
        <li>
          <a href="#" id="{$currentItem/@id}" data-image="{$imageCarUrl}"
        data-price="{$currentItem/price}" title="{$currentItem/@nodeName}">
            <img src="{$imageColourUrl}" alt=""/>
        </a>
          <span class="indicator"></span>
        </li>
      </xsl:for-each>
    </ul>
  </div>
  <p class="title">
    Choose your colour - non metallics
  </p>
  <div class="center_list">
    <ul class="colour_options clearfix">
      <xsl:variable name="nmcNodeSet" select="$currentPage/nonMetallicColours/MultiNodePicker"/>
      <xsl:for-each select="$nmcNodeSet/*">
        <xsl:variable name="currentItem" select="umbraco.library:GetXmlNodeById(.)"/>
        <xsl:variable name="imageCarUrl">
          <xsl:if test="$currentItem/productImage != ''">
            <xsl:value-of select="umbraco.library:GetMedia($currentItem/productImage,0)/umbracoFile"/>
          </xsl:if>
        </xsl:variable>
        <xsl:variable name="imageColourUrl">
          <xsl:if test="$currentItem/colourImage != ''">
            <xsl:value-of select="umbraco.library:GetMedia($currentItem/colourImage,0)/umbracoFile"/>
          </xsl:if>
        </xsl:variable>
        <li>
          <a href="#" id="{$currentItem/@id}" data-image="{$imageCarUrl}"
        data-price="{$currentItem/price}" title="{$currentItem/@nodeName}">
            <img src="{$imageColourUrl}" alt=""/>
        </a>
          <span class="indicator"></span>
        </li>
      </xsl:for-each>
    </ul>
  </div>

</xsl:template>

</xsl:stylesheet>