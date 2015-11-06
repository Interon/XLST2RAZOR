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
  <table border="0" cellspacing="0" cellpadding="0" id="model_list">
    <tr>
      <xsl:for-each select="$currentPage/Product">
      <xsl:variable name="firstChild" select="current()/SubProduct [position()=1]"></xsl:variable>        
      <td>
        <a>
		  <xsl:attribute name="href">
			<xsl:value-of select="umbraco.library:NiceUrl($firstChild/@id)"/>
		  </xsl:attribute>
          <div class="img_wrap">
            <img alt="" width="130">
              <xsl:attribute name="src">
                <xsl:choose>
                  <xsl:when test="$firstChild/scrollerImage != ''">
                    <xsl:value-of select="umbraco.library:GetMedia($firstChild/scrollerImage,0)/umbracoFile"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <!--<xsl:value-of select=" "/>-->
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <xsl:attribute name="data-over">
                <xsl:choose>
                  <xsl:when test="$firstChild/scrollerRolloverImage != ''">
                    <xsl:value-of select="umbraco.library:GetMedia($firstChild/scrollerRolloverImage,0)/umbracoFile"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <!--<xsl:value-of select=""/>-->
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
            </img>
            </div>
          <p class="title">
            <xsl:choose>
              <xsl:when test="current()/truncateTitleInScroller = '1'">
                <xsl:choose>
                  <xsl:when test="current()/numberOfCharacters != ''">
                    <xsl:variable name="numChar" select="number(current()/numberOfCharacters)"></xsl:variable>
                    <xsl:value-of select="umbraco.library:TruncateString(current()/@nodeName,$numChar,'...')"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="current()/@nodeName" />
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:variable name="numChar" select="number(current()/numberOfCharacters)"></xsl:variable>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="current()/@nodeName" />
              </xsl:otherwise>
            </xsl:choose>            
          </p>
        </a>
      </td>
      </xsl:for-each>      
    </tr>
  </table>
</xsl:template>

</xsl:stylesheet>