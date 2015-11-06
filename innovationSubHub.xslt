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
  <xsl:variable name="itemsPerRow" select="2"/>
  <xsl:variable name="divOpen">
    <xsl:text>&lt;div class='wrap_2_col clearfix'&gt;</xsl:text>
  </xsl:variable>
  <xsl:variable name="divClose">
    <xsl:text>&lt;/div&gt;</xsl:text>
  </xsl:variable>
  <div class="content_col std_content news_summary">
    <div class="news_head_compact clearfix">
      <h2>
        <xsl:value-of select="$currentPage/title"/>
      </h2>
      <!--<a href="#" class="rss_link">RSS</a>-->
    </div>
    <p>
      <xsl:value-of select="$currentPage/content" disable-output-escaping="yes"/>
    </p>   
    <xsl:for-each select="$currentPage/*[@isDoc]">
      <xsl:if test="position() mod $itemsPerRow = 1">
        <xsl:value-of select="$divOpen" disable-output-escaping="yes" />
      </xsl:if>
      <xsl:variable name="imageUrl">
        <xsl:choose>
          <xsl:when test="introImage != ''">
            <xsl:value-of select="umbraco.library:GetMedia(introImage,0)/umbracoFile"/>
          </xsl:when>
          <!--<xsl:otherwise>
            <xsl:value-of select=""/>
          </xsl:otherwise>-->
        </xsl:choose>
      </xsl:variable>
      <div class="col">
        <a href="{umbraco.library:NiceUrl(current()/@id)}">
          <xsl:choose>
            <xsl:when test="$imageUrl != ''">
              <img src="{$imageUrl}" alt="{title}" width="290" class="thumb"></img>
            </xsl:when>
          </xsl:choose>
        </a>
        <h3>
          <a href="{umbraco.library:NiceUrl(current()/@id)}">
            <xsl:value-of select="title"/>
          </a>
        </h3>
        <p>
          <xsl:value-of select="introBlurb"/>&#160;<a href="{umbraco.library:NiceUrl(current()/@id)}">read more</a>
        </p>
      </div>
      <xsl:if test="position() mod $itemsPerRow = 0 or position() = last()">
        <xsl:value-of select="$divClose" disable-output-escaping="yes"/>
      </xsl:if>
    </xsl:for-each>
  </div>
</xsl:template>
</xsl:stylesheet>