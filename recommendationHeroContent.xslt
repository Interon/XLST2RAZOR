<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" xmlns:ucomponents.nodes="urn:ucomponents.nodes" xmlns:PS.XSLTsearch="urn:PS.XSLTsearch" 
  exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ucomponents.nodes PS.XSLTsearch ">


<xsl:output method="html" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>

<xsl:template match="/">  
        <div class="text_wrap">
          <div class="text_outer">

            <div class="panel_slider_wrap clearfix">
              <!--<umbraco:Macro Alias="RecommendationHeroContent" runat="server"></umbraco:Macro>-->

              <div class="text_col">
                <h1>
                  <xsl:value-of select="$currentPage/helpTitle"/>
                </h1>
                <xsl:value-of select="$currentPage/helpContent" disable-output-escaping="yes"/>
				<xsl:if test="$currentPage/firstButtonText != ''">
                <a class="btn_slider">
                  <xsl:if test="$currentPage/filterPage != ''">
                    <xsl:attribute name="href">
                      <xsl:value-of select="umbraco.library:NiceUrl($currentPage/filterPage)"/>?type=<xsl:value-of select="$currentPage/firstButtonType"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="$currentPage/firstButtonText"/>
                </a>
				</xsl:if>
				<xsl:if test="$currentPage/secondButtonText != ''">
                <a class="btn_slider">
                  <xsl:if test="$currentPage/filterPage != ''">
                    <xsl:attribute name="href">
                      <xsl:value-of select="umbraco.library:NiceUrl($currentPage/filterPage)"/>?type=<xsl:value-of select="$currentPage/secondButtonType"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="$currentPage/secondButtonText"/>
                </a>
				</xsl:if>
				<xsl:if test="$currentPage/thirdButtonText != ''">
					 <a class="btn_slider">
					  <xsl:if test="$currentPage/filterPage != ''">
						<xsl:attribute name="href">
						  <xsl:value-of select="umbraco.library:NiceUrl($currentPage/filterPage)"/>?type=<xsl:value-of select="$currentPage/thirdButtonType"/>
						</xsl:attribute>
					  </xsl:if>
					  <xsl:value-of select="$currentPage/thirdButtonText"/>
                </a>
				</xsl:if>
              </div>
              <div class="slider_col">
                <ul id="slider_panel">
                  <xsl:variable name="wNodeSet" select="$currentPage/recommendations/MultiNodePicker"/>
                  <xsl:for-each select="$wNodeSet/*">
                    <xsl:variable name="currentItem" select="umbraco.library:GetXmlNodeById(.)"/>
                    <li>
                      <xsl:if test="$currentItem/image != ''">
                        <xsl:attribute name="style">
                          background-image:url(<xsl:value-of select="umbraco.library:GetMedia($currentItem/image,0)/umbracoFile"/>)
                        </xsl:attribute>
                      </xsl:if>
                      <a class="btn_panel">
                        <xsl:attribute name="href">
                          <xsl:choose>
                            <xsl:when test="string-length($currentPage/filterPage)>0">
                              <xsl:value-of select="umbraco.library:NiceUrl($currentPage/filterPage)"></xsl:value-of>?feat=<xsl:value-of select="$currentItem/@id"/>
                            </xsl:when>
                          </xsl:choose>
                        </xsl:attribute>
                        <xsl:value-of select="$currentPage/viewButtonText"/>
                      </a>
                    </li>
                  </xsl:for-each>
                </ul>
              </div>
            </div>
          </div>
        </div>      
</xsl:template>

</xsl:stylesheet>