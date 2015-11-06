<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" xmlns:ucomponents.nodes="urn:ucomponents.nodes"
  exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ucomponents.nodes ">


<xsl:output method="xml" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>
<xsl:template match="/">
  <div id="intro">
    <div class="alt_inner brochure clearfix">
      <div class="header_wrap clearfix">
        <h1>Download a Brochure</h1>
      </div>     
      
      <xsl:variable name="itemsPerRow" select="3"/>
      <xsl:variable name="divOpen">
        <xsl:text>&lt;div class='wrap_3_col clearfix';&gt;&lt;style='border:1px #ccc; margin-bottom:0px'&gt;</xsl:text>
      </xsl:variable>
      <xsl:variable name="divOpen2">
        <xsl:text>&lt;ul&gt;</xsl:text>
      </xsl:variable>
      <xsl:variable name="divOpen3">
        <xsl:text>&lt;ul&gt;</xsl:text>
      </xsl:variable>
      <xsl:variable name="divClose">
        <xsl:text>&lt;/div&gt;</xsl:text>
      </xsl:variable>
      <xsl:variable name="divClose2">
        <xsl:text>&lt;/ul&gt;</xsl:text>
      </xsl:variable>
         <xsl:variable name="divClose3">
        <xsl:text>&lt;/ul&gt;</xsl:text>
      </xsl:variable>
      
      <xsl:for-each select="$currentPage/parent::*/Products/ProductCategory">
        <xsl:if test="Product [count(brochures/data/*) > 0]">
             
          <h2 style ="background:#3A3A3A;border-radius:2px 2px 0 0;color:#fff;
                      height:30 px;border-bottom:1px solid #B9B9B9;padding:10px;
                      margin:0px;">
                   <xsl:value-of select="@nodeName" />
                     
          </h2>
                       
        </xsl:if>
        
      <xsl:for-each select="Product [count(brochures/data/*) > 0]">
        <xsl:variable name="rirNodeSet" select="current()/brochures/data"/>
        <!--<xsl:if test="count($rirNodeSet/*) > 0">-->
          <xsl:if test="position() mod $itemsPerRow = 1">
            <xsl:value-of select="$divOpen" disable-output-escaping="yes" />
          </xsl:if>
          <div class="col" style="margin-bottom:0px; width: 283px;">
            <h3 style = "padding:5px;background-image:url('/images/user-ext-bg.gif');width:283px;">
              <xsl:value-of select="@nodeName"/>
            </h3>
            <xsl:for-each select="brochures/data/item">
              <xsl:variable name="brochureId" select="brochure" />
              <xsl:variable name="title" select="title" />
              
              <xsl:if test="position() = 1 or not($brochureId = preceding-sibling::item/brochure)">  
                <xsl:if test="position() mod $itemsPerRow = 1">
                  <xsl:value-of select="$divOpen2" disable-output-escaping="yes" />
                </xsl:if>
                <xsl:variable name="imageUrl">
                  <xsl:choose>
                    <xsl:when test="thumbnail != ''">
                      <xsl:value-of select="umbraco.library:GetMedia(thumbnail,0)/umbracoFile"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="'/images/blank.gif'" />
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:variable>
                <xsl:variable name="href">
                  <xsl:choose>
                    <xsl:when test="brochure != ''">
                      <xsl:value-of select="umbraco.library:GetMedia(brochure,0)/umbracoFile"/>
                    </xsl:when>
                    <xsl:when test="brouchure != ''">
                      <xsl:value-of select="umbraco.library:GetMedia(brouchure,0)/umbracoFile"/>
                    </xsl:when>
                    <xsl:when test="brouchure != ''">
                      <xsl:value-of select="umbraco.library:GetMedia(brouchure,0)/umbracoFile"/>
                    </xsl:when>
                    <xsl:otherwise>&#35;</xsl:otherwise>
                  </xsl:choose>
                </xsl:variable>
                <li>
                  <table style = "border-spacing:px; margin:0 auto;">
                    <tbody style="margin-bottom:20px;">
                      <tr>
                        <td style="padding:10px;">
                          <a target="_blank" href="{$href}" style="font-size:10px;" >
                            <img src="{$imageUrl}" width="68" height="85" class="thumb"/>
                             <xsl:for-each select="$rirNodeSet/item[brochure = $brochureId]">
                           
                          </xsl:for-each>
                          </a>
                        </td>
                       
                      </tr>
                    </tbody>
                  </table>               
                </li>
                <xsl:if test="position() mod $itemsPerRow = 0 or position() = last()">
                  <xsl:value-of select="$divClose2" disable-output-escaping="yes"/>
                </xsl:if>
             </xsl:if>
            </xsl:for-each>
          </div>
       
          <xsl:if test="position() mod $itemsPerRow = 0 or position() = last()">
            <xsl:value-of select="$divClose" disable-output-escaping="yes"/>
          </xsl:if>
        <!--</xsl:if>-->
      </xsl:for-each>
    </xsl:for-each>
    </div>
  </div>
</xsl:template>

</xsl:stylesheet>

