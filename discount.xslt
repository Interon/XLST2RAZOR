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
  <xsl:variable name="mainNode" select="$currentPage"/>

  <h1 style="width:855px">
    <xsl:value-of select="$mainNode/headerText"/>
  </h1>
  <h4>
    <xsl:value-of select="$mainNode/subHeadingText"/>
  </h4>
  <div class="clearfix" style="background-image:url({umbraco.library:GetMedia($mainNode/rightImage,0)/umbracoFile});background-repeat: no-repeat;height: 600px;background-color:white">
    <div style="width:403px">
      <p><xsl:value-of select="$mainNode/rightText" disable-output-escaping="yes"/></p>
    </div>
  </div>
  <br/>

    <div class="clearfix" style="background-image:url({umbraco.library:GetMedia($mainNode/leftImage,0)/umbracoFile});background-repeat: no-repeat;height: 600px;background-color:white">
    <div style="float:right;width:403px">
      <p><xsl:value-of select="$mainNode/leftText" disable-output-escaping="yes"/></p>
    </div>
  </div>
</xsl:template>

</xsl:stylesheet>