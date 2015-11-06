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

  <div class="content_col std_content news_article">
    <div class="news_head">
      <h2>
        <xsl:value-of select="$currentPage/parent::*/title"/>
      </h2>
      <!--<a href="#" class="side_link">Latest Articles</a>-->
      <div class="social_row clearfix">
        <a href="#" class="email_link" title="Email this article">
          <img src="/images/icn-email.gif" alt=""/>
        </a>
        <a href="#" class="print_link" title="Print this article">
          <img src="/images/icn-print.gif" alt=""/>
        </a>
        <!--<a href="#" class="rss_link">RSS</a>-->
        <div class="plugins">
          <!-- tweet -->
          <a href="https://twitter.com/share" class="twitter-share-button" data-count="horizontal">
            Tweet
          </a>
          <!-- google+ -->
          <div class="g-plusone" data-size="medium">
          </div>
          <!-- facebook -->
          <div class="fb-like" data-send="false" data-layout="button_count" data-width="90"
            data-show-faces="false">
          </div>
        </div>
      </div>
    </div>
    <h3>
      <xsl:value-of select="$currentPage/title"/>
    </h3>
    <xsl:value-of select="$currentPage/content" disable-output-escaping="yes"/>
      <!--<div class="more_article_head">
        <h4>
          Further Articles
        </h4>
      </div>
      <div class="wrap_4_col clearfix">
        <div class="col">
          <img src="/images/content/news/sm_sample1.jpg" alt="" class="thumb"/>
            <p>
              <strong>Article Information</strong>
              <br/>
              Lorem ipsum dolor sit amet, conse ctetur
            
            </p>
          </div>
        <div class="col">
          <img src="/images/content/news/sm_sample2.jpg" alt="" class="thumb"/>
            <p>
              <strong>Article Information</strong>
              <br/>
              Lorem ipsum dolor sit amet, conse ctetur
            
            </p>
          </div>
        <div class="col">
          <img src="/images/content/news/sm_sample3.jpg" alt="" class="thumb"/>
            <p>
              <strong>Article Information</strong>
              <br/>
              Lorem ipsum dolor sit amet, conse ctetur
            
            </p>
          </div>
        <div class="col">
          <img src="/images/content/news/sm_sample4.jpg" alt="" class="thumb"/>
            <p>
              <strong>Article Information</strong>
              <br/>
              Lorem ipsum dolor sit amet, conse ctetur
            
            </p>
          </div>
      </div>-->
    </div>

</xsl:template>

</xsl:stylesheet>