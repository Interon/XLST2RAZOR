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
<div>
  <table cellpadding="0" cellspacing="0" border="0" align="center" width="1000">
	<tr>
    	<td>
       	  <a href="{umbraco.library:NiceUrl($currentPage/hondaRedirect)}"><img src="{umbraco.library:GetMedia($currentPage/image/data/item/image1600x1200,0)/umbracoFile}" width="1000" height="750" usemap="#Map" border="0" /></a>
        </td>
    </tr>
  </table>
<map name="Map" id="Map">
  <area shape="rect" coords="39,43,138,85" href="http://www.myssl.co.za/honda/?c=Brio" />
  <area shape="rect" coords="846,317,957,358" href="{umbraco.library:NiceUrl($currentPage/hondaRedirect)}" />
  <area shape="rect" coords="38,352,131,388" href="http://www.myssl.co.za/honda/?c=CR-V" />
</map>
</div>
</xsl:template>

</xsl:stylesheet>