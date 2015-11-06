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
    <xsl:if test="$currentPage/hasAutoModel = '1'">
      <div style="background: #e0e0e0 0 -39px no-repeat; color: #666; font-weight:bold; margin-bottom:5px; height: 39px; line-height: 39px; cursor:inherit;">
        <!--<xsl:attribute name="class">item_title</xsl:attribute>-->
        <span style="width:174px; float:left; padding-left:14px;">Model:</span>
        <span style="width:350px;  float:left; text-align:center;">
          <xsl:value-of select="$currentPage/manualModelName"/>
        </span>
        <span style="width:350px;  float:left; text-align:center;">
          <xsl:value-of select="$currentPage/autoModelName"/>
        </span>
      </div>
    </xsl:if>
    <xsl:for-each select="$currentPage/Specification">
      <xsl:variable name="rirNodeSet" select="current()/specifications/data"/>
      <xsl:choose>
        <xsl:when test="$currentPage/hasAutoModel = '1'">
          <div id="{@id}">
            <xsl:attribute name="class">item_title closed</xsl:attribute>
            <xsl:value-of select="@nodeName"/>
          </div>
          <div class="item_wrap">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <xsl:for-each select="$rirNodeSet/item">
                <xsl:variable name="style">
                  <xsl:value-of select="style" />
                </xsl:variable>
                <xsl:if test="manualContent != ''">
                  <xsl:if test="manualContent != '-'">
               

                      <tr>
                      <xsl:if test="isHeading = '0'">
                        <th style="width:399px;{style}">
                          <xsl:value-of select="title"/>
                        </th>
                      </xsl:if>
                      <xsl:if test="isHeading = '1'">
                        <th style="width:399px;font-weight:bold;font-style:italic">
                          <xsl:value-of select="title"/>
                        </th>
                      </xsl:if>

                      <td style="width:236px;">
                        <xsl:value-of select="manualContent"/>
                      </td>
                      <td style="width:236px;">
                        <xsl:choose>
                          <xsl:when test="autoContent = ''">
                            <xsl:value-of select="manualContent"/>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="autoContent"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                  </xsl:if>
            
                </xsl:if>
              </xsl:for-each>
            </table>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <div id="{@id}">
            <xsl:attribute name="class">item_title closed</xsl:attribute>
            <xsl:value-of select="@nodeName"/>
          </div>
          <div class="item_wrap">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <xsl:for-each select="$rirNodeSet/item">
                <xsl:if test="manualContent != ''">
                  <xsl:if test="manualContent != '-'">
                  
                <tr>
                  <xsl:if test="not(isHeading)">
                    <th style="width:399px;">
                      <xsl:value-of select="title"/>
                    </th>
                  </xsl:if>
                  <xsl:if test="isHeading = ''">
                    <th style="width:399px;">
                      <xsl:value-of select="title"/>
                    </th>
                  </xsl:if>
                  <xsl:if test="isHeading = '0'">
                    <th style="width:399px;{style}">
                      <xsl:value-of select="title"/>
                    </th>
                  </xsl:if>
                  <xsl:if test="isHeading = '1'">
                    <th style="width:399px;font-weight:bold;font-style:italic">
                      <xsl:value-of select="title"/>
                    </th>
                  </xsl:if>

                  <td>
                    <xsl:value-of select="manualContent"/>
                  </td>
                </tr>
                </xsl:if>
                </xsl:if>
              </xsl:for-each>
            </table>
          </div>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
    <br>

    </br>
    <span style="font-style:italic;margin-top:20px">
      <xsl:value-of select="$currentPage/ancestor-or-self::*[@isDoc]/fuelDisclaimer"/>
    </span>
    <input type="hidden" id="hidSubProduct">
      <xsl:attribute name="value">
        <xsl:value-of select="$currentPage/parent::*/parent::*/@nodeName"/>
      </xsl:attribute>
    </input>
  </xsl:template>
</xsl:stylesheet>