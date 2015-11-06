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
  <xsl:variable name="mainNode" select="$currentPage"></xsl:variable>
  <ul class="sub_menu clearfix">
    <xsl:for-each select="$mainNode/* [@isDoc]">
    <li>
      <xsl:choose>
        <xsl:when test="@id = $currentPage/@id">
          <xsl:attribute name="class">active</xsl:attribute>
        </xsl:when>       
      </xsl:choose>
      <a href="./{current()/parent::*/@urlName}/{@urlName}/">
        <xsl:attribute name="class">ajaxy ajaxy-subpage</xsl:attribute>
        <xsl:value-of select="@nodeName"/>
      </a>      
    </li>
    </xsl:for-each> 
    <xsl:if test="contains($currentPage/pageTitle, 'Car')">
      <xsl:if test="not(count($currentPage/parent::*/parent::*/parent::*/CarCompare) = 0)">
        <li>      
          <a href="/en/products/cars/car-compare">Compare</a>
        </li>
      </xsl:if>
    </xsl:if>
  </ul>
  <script type="text/javascript" language="javascript">
    $('#content ul.sub_menu li a.ajaxy').hover(function () {
    $(this).attr('onclick', 'javascript:hideTopSection();');
    });
  </script>
</xsl:template>

</xsl:stylesheet>