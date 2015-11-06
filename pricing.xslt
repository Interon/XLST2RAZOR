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
  <xsl:variable name="currentProduct" select="$currentPage/parent::*/parent::*/parent::*/parent::*"></xsl:variable>
  <div class="std_inner pricing clearfix">
    <h2>
      Range Pricing
    </h2>
    <p>
      Select the model trim you wish to view. You can add additional models to compare
      their pricing by using the filters below.
    </p>
    <div class="range_select clearfix">
      <h3>
        The <xsl:value-of select="$currentProduct/Product/@nodeName"/> Range
      </h3>
      <div class="select">
        <label for="model_select">
          Add another model
        </label>
        <select id="model_select" name="model_select" class="custom_dd_reg">
          <option value="null">Select</option>
          <xsl:for-each select="$currentPage/parent::*/parent::*/parent::*/parent::*/*[name()='Product']">
            <option value="{current()/@id}"><xsl:value-of select="current()/@nodeName"/></option>
          </xsl:for-each>          
        </select>
      </div>
      <div class="actions">        
        <a class="price_list_link" title="Download price list">
          <xsl:if test="$currentPage/parent::*/parent::*/parent::*/parent::*/priceList != ''">
            <xsl:attribute name="href">/downloadmedia.ashx?id=<xsl:value-of select="$currentPage/parent::*/parent::*/parent::*/parent::*/priceList"/></xsl:attribute>
          </xsl:if>
          Download price list</a>
        <a href="#" class="print_link" onclick="window.open('/email_templates/price-print.html'); return false;" title="Printer friendly version">
          Print price list
        </a>
      </div>
    </div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="pricing_table">
      <tr class="head">
        <th scope="col" class="range">
          Model Range
        </th>
        <th scope="col" class="deriv">
          Model Derivative
        </th>
        <th scope="col" class="price">
          Recommended Base Price
        </th>
        <xsl:if test = "not($currentProduct/@nodeName='Motorcycles')">   
             <th scope="col" class="Co2tax">
                CO2 Emission Tax
            </th>
        </xsl:if> 
       </tr>     
      <xsl:for-each select="$currentPage/parent::*/parent::*/parent::*/*[name()='SubProduct']">
        <tr data-idgrp="{current()/parent::*/@id}" class="current">
          <td>
            <xsl:value-of select="current()/parent::*/@nodeName"/>
          </td>
          <td>
            <xsl:value-of select="current()/@nodeName"/>
          </td>
          <td>
            <xsl:value-of select="current()/basePrice"/>
          </td>
           <xsl:if test = "not($currentProduct/@nodeName='Motorcycles')">
          <td>
            <xsl:value-of select="current()/emissionTax"/>
          </td>
          </xsl:if>
        </tr>
      </xsl:for-each>  
        
     
    </table>
  </div>

</xsl:template>

</xsl:stylesheet>