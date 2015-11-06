<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" xmlns:ucomponents.nodes="urn:ucomponents.nodes"
	exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ucomponents.nodes ">


  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="currentPage"/>

  <xsl:template match="/">

    <!--<div id="hero">
    -->
    <!--Top Left-->
    <!--
    <div class="promo tech">
      <ul class="promo_slider">
        <xsl:variable name="topLeftNodeSet" select="$currentPage/topLeftSection/data"/>
        <xsl:for-each select="$topLeftNodeSet/item">
          <li>
            <a>
              <xsl:if test="internalLink != ''">
                <xsl:attribute name="href"><xsl:value-of select="umbraco.library:NiceUrl(internalLink)"/></xsl:attribute>
              </xsl:if>
              <div class="overlay"></div>
              <div class="text {textColor}">
                <p class="title">
                  <xsl:value-of select="title"/>
                </p>
                <p class="copy">
                  <xsl:value-of select="content"/>
                </p>
              </div>
              <img alt="" width="238" height="277" class="bg">
                <xsl:if test="image != ''">
                <xsl:attribute name="src"><xsl:value-of select="umbraco.library:GetMedia(image,0)/umbracoFile"/></xsl:attribute>
              </xsl:if>
              </img>
            </a>
          </li>
        </xsl:for-each>      
      </ul>
      <div id="tech_slider_pager"></div>
    </div>
    -->
    <!--Top Middle-->
    <!--
    <div class="promo cars">
      <ul class="promo_slider">
        <xsl:variable name="topLeftNodeSet" select="$currentPage/topMiddleSection/data"/>
        <xsl:for-each select="$topLeftNodeSet/item">
          <li>
            <a>
              <xsl:if test="internalLink != ''">
                <xsl:attribute name="href"><xsl:value-of select="umbraco.library:NiceUrl(internalLink)"/></xsl:attribute>
              </xsl:if>
              <div class="overlay"></div>
              <div class="text {textColor}">
                <p class="title">
                  <xsl:value-of select="title"/>
                </p>
                <p class="copy">
                  <xsl:value-of select="content"/>
                </p>
                <xsl:if test="string-length(labelImage)>0">
                  <img src="{umbraco.library:GetMedia(labelImage,0)/umbracoFile}" alt="Create your perfect Honda" width="146" height="47"/>
                </xsl:if>                
              </div>
              <img alt="" width="515" height="155" class="bg">
                 <xsl:if test="mainImage != ''">
                <xsl:attribute name="src"><xsl:value-of select="umbraco.library:GetMedia(mainImage,0)/umbracoFile"/></xsl:attribute>
              </xsl:if>
              </img>
            </a>
          </li>
        </xsl:for-each>
      </ul>
      <div id="car_slider_pager"></div>
    </div>
    -->
    <!--Middle-->
    <!--
    <div class="promo news">
      <a>
        <xsl:if test="$currentPage/middleInternalLink != ''">
                <xsl:attribute name="href"><xsl:value-of select="umbraco.library:NiceUrl($currentPage/middleInternalLink)"/></xsl:attribute>
              </xsl:if>
        <div class="overlay"></div>
        <div class="text {$currentPage/middleTextColor}">
          <p class="title">
            <xsl:value-of select="$currentPage/middleTitle"/>
          </p>
          <p class="copy">
            <xsl:value-of select="$currentPage/middleContent"/>
          </p>
        </div>
        <img alt="" width="307" height="109" class="bg">
           <xsl:if test="$currentPage/middleImage != ''">
                <xsl:attribute name="src"><xsl:value-of select="umbraco.library:GetMedia($currentPage/middleImage,0)/umbracoFile"/></xsl:attribute>
              </xsl:if>
        </img>
      </a>
    </div>
    -->
    <!--Inside Right-->
    <!--
    <div class="promo power">
      <a>
        <xsl:if test="$currentPage/insideRightInternalLink != ''">
                <xsl:attribute name="href"><xsl:value-of select="umbraco.library:NiceUrl($currentPage/insideRightInternalLink)"/></xsl:attribute>
              </xsl:if>
        <div class="overlay"></div>
        <div class="text {$currentPage/insideRightTextColor}">
          <p class="title">
            <xsl:value-of select="$currentPage/insideRightTItle"/>
          </p>
          <p class="copy">
            <xsl:value-of select="$currentPage/insideRightContent"/>
          </p>
        </div>
        <img alt="" width="196" height="250" class="bg">
           <xsl:if test="$currentPage/insideRightImage != ''">
                <xsl:attribute name="src"><xsl:value-of select="umbraco.library:GetMedia($currentPage/insideRightImage,0)/umbracoFile"/></xsl:attribute>
              </xsl:if>
        </img>
      </a>
    </div>
    -->
    <!--Right-->
    <!--
    <div class="promo motor">
      <a>
         <xsl:if test="$currentPage/rightInternalLink != ''">
                <xsl:attribute name="href"><xsl:value-of select="umbraco.library:NiceUrl($currentPage/rightInternalLink)"/></xsl:attribute>
              </xsl:if>
        <div class="overlay"></div>
        <div class="text {$currentPage/rightTextColor}">
          <p class="title">
            <xsl:value-of select="$currentPage/rightTitle"/>
          </p>
          <p class="copy">
            <xsl:value-of select="$currentPage/rightContent"/>
          </p>
        </div>
        <img alt="" width="203" height="418" class="bg">
          <xsl:if test="$currentPage/rightImage != ''">
                <xsl:attribute name="src"><xsl:value-of select="umbraco.library:GetMedia($currentPage/rightImage,0)/umbracoFile"/></xsl:attribute>
              </xsl:if>
        </img>
      </a>
    </div>
    -->
    <!--Bottom Left-->
    <!--
    <div class="promo marine">
      <a>
        <xsl:if test="$currentPage/bottomLeftInternalLink != ''">
                <xsl:attribute name="href"><xsl:value-of select="umbraco.library:NiceUrl($currentPage/bottomLeftInternalLink)"/></xsl:attribute>
              </xsl:if>
        <div class="overlay"></div>
        <div class="text {$currentPage/bottomLeftTextColor}">
          <p class="title">
            <xsl:value-of select="$currentPage/bottomLeftTitle"/>
          </p>
          <p class="copy">
            <xsl:value-of select="$currentPage/bottomLeftContent"/>
          </p>
        </div>
        <img alt="" width="557" height="130" class="bg">
           <xsl:if test="$currentPage/bottomLeftImage != ''">
                <xsl:attribute name="src"><xsl:value-of select="umbraco.library:GetMedia($currentPage/bottomLeftImage,0)/umbracoFile"/></xsl:attribute>
              </xsl:if>
        </img>
      </a>
    </div>
  </div>-->
    <div id="hero">
      <div class="promo motor">
        <a>
          <xsl:if test="$currentPage/topLeftLink != ''">
            <xsl:attribute name="href">
              <xsl:value-of select="umbraco.library:NiceUrl($currentPage/topLeftLink)"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:variable name="topLeftNodeSet" select="$currentPage/topLeftImages/data"/>
          <xsl:for-each select="$topLeftNodeSet/item">
            <img alt="" width="218" height="287" class="bg">
              <xsl:if test="image != ''">
                <xsl:attribute name="src">
                  <xsl:value-of select="umbraco.library:GetMedia(image,0)/umbracoFile"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="rolloverImage != ''">
                <xsl:attribute name="data-oversrc">
                  <xsl:value-of select="umbraco.library:GetMedia(rolloverImage,0)/umbracoFile"/>
                </xsl:attribute>
              </xsl:if>
            </img>
          </xsl:for-each>
          <!--<img src="/images/content/hero/MTRC2-1.jpg" data-oversrc="/images/content/hero/MTRC2-2.jpg" alt="" width="218" height="287" class="bg"/>
          <img src="/images/content/hero/MTRC3-1.jpg" data-oversrc="/images/content/hero/MTRC3-2.jpg" alt="" width="218" height="287" class="bg"/>-->
        </a>
      </div>
      <div class="promo cars">
        <ul class="promo_slider">
          <xsl:variable name="topMiddleNodeSet" select="$currentPage/topMiddleImages/data"/>
          <xsl:for-each select="$topMiddleNodeSet/item">
            <li>
              <a>
                <xsl:choose>
                  <xsl:when test="externalLink != ''">
                    <xsl:attribute name="href">
                      <xsl:value-of select="externalLink"/>
                    </xsl:attribute>
                    <xsl:attribute name="target">_blank</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="link != ''">
                    <xsl:attribute name="href">
                      <xsl:value-of select="umbraco.library:NiceUrl(link)"/>
                    </xsl:attribute>
                  </xsl:when>
                </xsl:choose>
                <img alt="" width="535" height="178" class="bg">
                  <xsl:if test="image != ''">
                    <xsl:attribute name="src">
                      <xsl:value-of select="umbraco.library:GetMedia(image,0)/umbracoFile"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="rolloverImage != ''">
                    <xsl:attribute name="data-oversrc">
                      <xsl:value-of select="umbraco.library:GetMedia(rolloverImage,0)/umbracoFile"/>
                    </xsl:attribute>
                  </xsl:if>
                </img>
              </a>
            </li>
          </xsl:for-each>

          <!--<li>
            <a href="#2">
              <img src="/images/content/hero/CARS2-1.jpg" data-oversrc="/images/content/hero/CARS2-2.jpg" alt="" width="535" height="178" class="bg"/>
            </a>
          </li>
          <li>
            <a href="#3">
              <img src="/images/content/hero/CARS3-1.jpg" data-oversrc="/images/content/hero/CARS3-2.jpg" alt="" width="535" height="178" class="bg"/>
            </a>
          </li>
          <li>
            <a href="#4">
              <img src="/images/content/hero/CARS4-1.jpg" data-oversrc="/images/content/hero/CARS4-2.jpg" alt="" width="535" height="178" class="bg"/>
            </a>
          </li>-->
        </ul>
        <div id="car_slider_pager"></div>
      </div>
      <div class="promo news">
        <ul class="promo_slider">
          <xsl:variable name="middleNodeSet" select="$currentPage/middleImages/data"/>
          <xsl:for-each select="$middleNodeSet/item">
            <li>
              <a>
                <xsl:choose>
                  <xsl:when test="externalLink != ''">
                    <xsl:attribute name="href">
                      <xsl:value-of select="externalLink"/>
                    </xsl:attribute>
                    <xsl:attribute name="target">_blank</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="link != ''">
                    <xsl:attribute name="href">
                      <xsl:value-of select="umbraco.library:NiceUrl(link)"/>
                    </xsl:attribute>
                  </xsl:when>
                </xsl:choose>
                <img alt="" width="327" height="97" class="bg">
                  <xsl:if test="image != ''">
                    <xsl:attribute name="src">
                      <xsl:value-of select="umbraco.library:GetMedia(image,0)/umbracoFile"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="rolloverImage != ''">
                    <xsl:attribute name="data-oversrc">
                      <xsl:value-of select="umbraco.library:GetMedia(rolloverImage,0)/umbracoFile"/>
                    </xsl:attribute>
                  </xsl:if>
                </img>
              </a>
            </li>
          </xsl:for-each>
        </ul>
        <div id="news_slider_pager"></div>
      </div>
      <div class="promo power">

        <!--<img src="/images/content/hero/PP1-1.jpg" data-oversrc="/images/content/hero/PP1-2.jpg" alt="" width="196" height="228" class="bg"/>
          <img src="/images/content/hero/PP2-1.jpg" data-oversrc="/images/content/hero/PP2-2.jpg" alt="" width="196" height="228" class="bg"/>-->
        <a>
          <xsl:if test="$currentPage/insideRightLink != ''">
            <xsl:attribute name="href">
              <xsl:value-of select="umbraco.library:NiceUrl($currentPage/insideRightLink)"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:variable name="topLeftNodeSet" select="$currentPage/insideRightImages/data"/>
          <xsl:for-each select="$topLeftNodeSet/item">
            <img alt="" width="196" height="228" class="bg">
              <xsl:if test="image != ''">
                <xsl:attribute name="src">
                  <xsl:value-of select="umbraco.library:GetMedia(image,0)/umbracoFile"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="rolloverImage != ''">
                <xsl:attribute name="data-oversrc">
                  <xsl:value-of select="umbraco.library:GetMedia(rolloverImage,0)/umbracoFile"/>
                </xsl:attribute>
              </xsl:if>
            </img>
          </xsl:for-each>
        </a>
      </div>
      <div class="promo tech">
        <ul class="promo_slider">
          <xsl:variable name="topLeftNodeSet" select="$currentPage/rightImages/data"/>
          <xsl:for-each select="$topLeftNodeSet/item">
            <li>
              <a>
                <xsl:choose>
                  <xsl:when test="externalLink != ''">
                    <xsl:attribute name="href">
                      <xsl:value-of select="externalLink"/>
                    </xsl:attribute>
                    <xsl:attribute name="target">_blank</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="link != ''">
                    <xsl:attribute name="href">
                      <xsl:value-of select="umbraco.library:NiceUrl(link)"/>
                    </xsl:attribute>
                  </xsl:when>
                </xsl:choose>
                <img alt="" width="202" height="417" class="bg">
                  <xsl:if test="image != ''">
                    <xsl:attribute name="src">
                      <xsl:value-of select="umbraco.library:GetMedia(image,0)/umbracoFile"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="rolloverImage != ''">
                    <xsl:attribute name="data-oversrc">
                      <xsl:value-of select="umbraco.library:GetMedia(rolloverImage,0)/umbracoFile"/>
                    </xsl:attribute>
                  </xsl:if>
                </img>
              </a>
            </li>
          </xsl:for-each>
        </ul>
        <div id="tech_slider_pager"></div>
      </div>
      <div class="promo marine">
        <!--<a href="#">
          <img src="/images/content/hero/MRN1-1.jpg" data-oversrc="/images/content/hero/MRN1-2.jpg" alt="" width="557" height="119" class="bg"/>
          <img src="/images/content/hero/MRN2-1.jpg" data-oversrc="/images/content/hero/MRN2-2.jpg" alt="" width="557" height="119" class="bg"/>
        </a>-->
        <a>
          <xsl:if test="$currentPage/bottomLeftLink != ''">
            <xsl:attribute name="href">
              <xsl:value-of select="umbraco.library:NiceUrl($currentPage/bottomLeftLink)"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:variable name="bottomLeftNodeSet" select="$currentPage/bottomLeftImages/data"/>
          <xsl:for-each select="$bottomLeftNodeSet/item">
            <img alt="" width="557" height="119" class="bg">
              <xsl:if test="image != ''">
                <xsl:attribute name="src">
                  <xsl:value-of select="umbraco.library:GetMedia(image,0)/umbracoFile"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="rolloverImage != ''">
                <xsl:attribute name="data-oversrc">
                  <xsl:value-of select="umbraco.library:GetMedia(rolloverImage,0)/umbracoFile"/>
                </xsl:attribute>
              </xsl:if>
            </img>
          </xsl:for-each>
        </a>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>