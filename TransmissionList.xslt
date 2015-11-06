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

  <ul class="transmission_options clearfix">
    <xsl:variable name="wNodeSet" select="$currentPage/transmission/MultiNodePicker"/>
    <xsl:for-each select="$wNodeSet/*">
      <xsl:variable name="currentItem" select="umbraco.library:GetXmlNodeById(.)"/>
      <xsl:variable name="imageUrl">
        <xsl:if test="$currentItem/image != ''">
          <xsl:value-of select="umbraco.library:GetMedia($currentItem/image,0)/umbracoFile"/>
        </xsl:if>
      </xsl:variable>
      <li>
        <a href="#" id="{$currentItem/@id}" data-image="{$imageUrl}"
     data-price="{$currentItem/price}" title="{$currentItem/@nodeName}">
          <img src="{$imageUrl}" alt=""/>
        </a>
      </li>
    </xsl:for-each>
    <!--<li>
      <a href="#" id="trans_cvt" data-image="/images/content/car-builder/jazz/comfort/wheels/spinner_mags.jpg"
    data-price="10000" title='CVT'>
        <img src="/images/content/car-builder/transmission/jazz-cvt.jpg" alt="">
      </a>
    </li>-->
  </ul>

</xsl:template>

</xsl:stylesheet>