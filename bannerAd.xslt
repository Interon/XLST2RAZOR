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

  <h1>
    <xsl:value-of select="$mainNode/title"/>
  </h1>
  <div id="banner_ad" class="clearfix">
    <img alt="" class="intro_img">
      <xsl:choose>
        <xsl:when test="string-length($mainNode/mainImage) > 0">
          <xsl:attribute name="src">
            <xsl:value-of select="umbraco.library:GetMedia($mainNode/mainImage,0)/umbracoFile"/>
          </xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="src"></xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
    </img>
    <xsl:value-of select="$mainNode/content" disable-output-escaping="yes"/>
    <div style="width: 400px;">
    <xsl:if test="$mainNode/hideBottomButton != '1'">      
    <a class="btn">     
        <xsl:choose>
          <xsl:when test ="string-length($mainNode/bottomButtonLink)>0">
            <xsl:attribute name="href">
              <xsl:choose>
                <xsl:when test="contains(umbraco.library:NiceUrl($mainNode/bottomButtonLink), 'book-a-test-drive')">
                  <xsl:value-of select="umbraco.library:NiceUrl($mainNode/bottomButtonLink)"/>?trimid=<xsl:value-of select="$mainNode/@id"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="umbraco.library:NiceUrl($mainNode/bottomButtonLink)"/>
                </xsl:otherwise>
              </xsl:choose>              
            </xsl:attribute>
          </xsl:when>
          <xsl:when test ="string-length($mainNode/bottomButtonLink)=0 and string-length($mainNode/bottomButtonMediaLink)>0">
            <xsl:attribute name="href">
              /downloadmedia.ashx?id=<xsl:value-of select="$mainNode/bottomButtonMediaLink"/>
            </xsl:attribute>
            <xsl:attribute name="target">_blank</xsl:attribute>
          </xsl:when>
        </xsl:choose>      
      <xsl:value-of select="$mainNode/bottomButtonText"/>
    </a>
      </xsl:if>
    <xsl:if test="$mainNode/hideSecondButton != '1'">
      <a class="btn" style="float:right; padding-right:90px;">      
        <xsl:choose>
          <xsl:when test ="string-length($mainNode/secondButtonLink)>0">
            <xsl:attribute name="href">
              <xsl:choose>
                <xsl:when test="contains(umbraco.library:NiceUrl($mainNode/secondButtonLink), 'book-a-test-drive')">
                  <xsl:value-of select="umbraco.library:NiceUrl($mainNode/secondButtonLink)"/>?trimid=<xsl:value-of select="$mainNode/@id"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="umbraco.library:NiceUrl($mainNode/secondButtonLink)"/>
                </xsl:otherwise>
              </xsl:choose>              
            </xsl:attribute>
          </xsl:when>
          <xsl:when test ="string-length($mainNode/secondButtonLink)=0 and string-length($mainNode/secondButtonMediaLink)>0">
            <xsl:attribute name="href">
              /downloadmedia.ashx?id=<xsl:value-of select="$mainNode/bottomButtonMediaLink"/>
            </xsl:attribute>
            <xsl:attribute name="target">_blank</xsl:attribute>
          </xsl:when>
        </xsl:choose>      
      <xsl:value-of select="$mainNode/secondButtonText"/>
    </a>
    </xsl:if>
    </div>
    </div>
</xsl:template>

</xsl:stylesheet>