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
  <xsl:variable name="rirNodeSet" select="$currentPage/rotatingImages/data"/>
  <xsl:if test="$rirNodeSet != ''">
  <xsl:for-each select="$rirNodeSet/item">
    <xsl:variable name="imageUrl" select="umbraco.library:GetMedia(imageUrl,0)"></xsl:variable>
    <li  style="background-image:url({$imageUrl/umbracoFile}); background-color:#a4c0d5;" data-backgroundColor="{backgroundColor}">  
      <xsl:choose>
        <xsl:when test="imageLink != ''">
         <xsl:attribute name="onclick">redirectPage('<xsl:value-of select="umbraco.library:NiceUrl(imageLink)"></xsl:value-of>');</xsl:attribute>
         <xsl:attribute name="style">background-image:url(<xsl:value-of select="$imageUrl/umbracoFile"></xsl:value-of>); background-color:#a4c0d5; cursor:pointer;</xsl:attribute>          
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="style">background-image:url(<xsl:value-of select="$imageUrl/umbracoFile"></xsl:value-of>); background-color:#a4c0d5;</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
        <div class="text_wrap">
        <div class="text_outer">
          <div class="{cssClass}">
            <xsl:value-of select="content" disable-output-escaping="yes"/>
            <xsl:if test="buttonText != ''">
              <a class="btn_slider">
                <xsl:attribute name="href">
                  <xsl:choose>
                    <xsl:when test="string-length(buttonLink)>0">
                      <xsl:choose>
                        <xsl:when test="$currentPage[@nodeName = 'Cars']">
                          /en/products/cars/car-filter/?type=<xsl:value-of select="buttonLink"/>
                        </xsl:when>
                        <xsl:when test="$currentPage[@nodeName = 'Power Products']">
                          /en/products/power-products/power-product-filter/?type=<xsl:value-of select="buttonLink"/>
                        </xsl:when>
                        <xsl:when test="$currentPage[@nodeName = 'Motorcycles']">
                          /en/products/motorcycles/motorcycle-filter/?type=<xsl:value-of select="buttonLink"/>
                        </xsl:when>
                      </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text>#</xsl:text>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <xsl:value-of select="buttonText"/>
              </a>
            </xsl:if>
          </div>
        </div>
      </div>                 
    </li>
  </xsl:for-each>
  </xsl:if>
  
</xsl:template>

</xsl:stylesheet>