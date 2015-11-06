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
  <div class="alt_inner std_content faq clearfix">
    <div class="header_wrap clearfix">
      <h1>
        <xsl:value-of select="$currentPage/title"/>
      </h1>
    </div>
    <xsl:variable name="rirNodeSet" select="$currentPage/questionsAnswers/data"/>
    <xsl:for-each select="$rirNodeSet/item">
      <div class="item_title closed">
        <h3 style="padding-right: 300px; line-height: 2.3;">
          <xsl:value-of select="question"/>
        </h3>
      </div>
      <div class="item_wrap" style="padding: 10px 15px;">
        <p style="font-size:14px; margin-bottom:0;">
          <xsl:value-of select="answer" disable-output-escaping="yes"/>
        </p>
      </div>
    </xsl:for-each>   
  </div>
</xsl:template>

</xsl:stylesheet>