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
  <xsl:variable name="backgroundImgs" select="$currentPage/parent::*/backgroundImage/data/item" />
  <xsl:variable name="img1600x1200">
    <xsl:if test="not(string-length($backgroundImgs/image1600x1200) = 0)">
      <xsl:value-of select="umbraco.library:GetMedia($backgroundImgs/image1600x1200,0)/umbracoFile"/>
    </xsl:if>
  </xsl:variable>
  <xsl:variable name="img1024x768">
    <xsl:if test="not(string-length($backgroundImgs/image1024x768) = 0)">
      <xsl:value-of select="umbraco.library:GetMedia($backgroundImgs/image1024x768,0)/umbracoFile"/>
    </xsl:if>
  </xsl:variable>
  <xsl:variable name="img1280x720">
    <xsl:if test="not(string-length($backgroundImgs/image1280x720) = 0)">
      <xsl:value-of select="umbraco.library:GetMedia($backgroundImgs/image1280x720,0)/umbracoFile"/>
    </xsl:if>
  </xsl:variable>
  <xsl:variable name="specId" select="$currentPage/TrimOverview/Specifications/@id" />
  <h1>
    <xsl:value-of select="$mainNode/title"/>
  </h1>
  <a href="#intro_expanded" class="expander">Expand</a>
  <div id="intro_expanded" class="clearfix">
    <img alt="" class="intro_img"
     data-backgroundImage1600="{$img1600x1200}"
     data-backgroundImage1280="{$img1280x720}"
     data-backgroundImage1024="{$img1024x768}">
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
	  <xsl:if test="$mainNode/disclaimer != ''">
		  <b style="font-size:8px;position:absolute;top:220px;right:-40px">
			  <xsl:value-of select="$mainNode/disclaimer"/> </b>
	  </xsl:if>
    <xsl:value-of select="$mainNode/content" disable-output-escaping="yes"/>
    <div style="width: 475px;">
  <xsl:if test="$mainNode/specButtonText != ''">      
      <a class="btn spec-generate" style="padding-right:20px;cursor:pointer" data-specId="{$specId}" target="_blank">
          <xsl:value-of select="$mainNode/specButtonText"/>
      </a>
    </xsl:if>
    <xsl:if test="$mainNode/hideBottomButton != '1'">      
    <a class="btn" style="padding-right:20px;">     
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
          <xsl:otherwise>
            <xsl:text>#</xsl:text>
          </xsl:otherwise>
        </xsl:choose>      
      <xsl:value-of select="$mainNode/bottomButtonText"/>
    </a>
      </xsl:if>
    <xsl:if test="$mainNode/hideSecondButton != '1'">
      <a class="btn" style="padding-right:20px;">      
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
          <xsl:otherwise>
            <xsl:text>#</xsl:text>
          </xsl:otherwise>
        </xsl:choose>      
      <xsl:value-of select="$mainNode/secondButtonText"/>
    </a>
    </xsl:if>

        <xsl:if test="$mainNode/hideThirdButton != '1'">      
         
        <xsl:choose>
      <xsl:when test="$currentPage/parent::*/@nodeName = 'Brio'">
      <xsl:if test="$mainNode/thirdButtonText != ''">
              <a class="btn" style="padding-right:20px" href="http://www.morereliablethan.co.za" target="blank">
                <xsl:value-of select="$mainNode/thirdButtonText"/>
              </a>
            </xsl:if>
          </xsl:when>
          <xsl:when test ="string-length($mainNode/thirdButtonLink)>0">
            <a class="btn" style="padding-right:20px">
      <xsl:attribute name="href">
              <xsl:choose>
                <xsl:when test="contains(umbraco.library:NiceUrl($mainNode/thirdButtonLink), 'book-a-test-drive')">
                  <xsl:value-of select="umbraco.library:NiceUrl($mainNode/thirdButtonLink)"/>?trimid=<xsl:value-of select="$mainNode/@id"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="umbraco.library:NiceUrl($mainNode/thirdButtonLink)"/>
                </xsl:otherwise>
              </xsl:choose>              
            </xsl:attribute>
      <xsl:value-of select="$mainNode/thirdButtonText"/>
      </a>
          </xsl:when>
        </xsl:choose>   
      </xsl:if>
      
      <xsl:if test="$mainNode/hideFourthButton != '1'">      
          <xsl:choose>

          <xsl:when test ="string-length($mainNode/fourthButtonLink)>0">
                     
   <a class="btn"> 
      <xsl:attribute name="href">
        

                  <xsl:value-of select="$mainNode/fourthButtonLink"/>
                    
            </xsl:attribute>
                                <xsl:attribute name="target">_blank</xsl:attribute>
      <xsl:value-of select="$mainNode/fourthButtonText"/>
</a>
            
          </xsl:when>
        </xsl:choose>   
      </xsl:if>
      
    </div>
    </div>
</xsl:template>

</xsl:stylesheet>