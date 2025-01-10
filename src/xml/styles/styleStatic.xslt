<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xmlns:datetime="http://exslt.org/dates-and-times"
	xmlns:str="http://exslt.org/strings"
	xmlns:fn="http://www.w3.org/2005/02/xpath-functions" exclude-result-prefixes="fn datetime str">
    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/cv">
        <html>
            <head>
                <!-- Google tag (gtag.js) -->
                <script>
                    window.dataLayer = window.dataLayer || [];
                    function gtag(){dataLayer.push(arguments);}
                    gtag('js', new Date());

                    gtag('config', 'G-P0LTVJL3D1');
                </script>
                <title><xsl:value-of select="personalInfo/lastName"/> 	 <xsl:value-of select="personalInfo/firstName"/> - <xsl:value-of select="localization/label_CurrentPositionTitle"/></title>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <meta http-equiv="Content-Language"><xsl:attribute name="content"><xsl:value-of select="@locale"/> </xsl:attribute></meta>
                <meta name="robots" content="follow"/>
                <meta name="Description"><xsl:attribute name="content"> CV <xsl:value-of select="personalInfo/lastName"/> <xsl:value-of select="personalInfo/firstName"/> </xsl:attribute></meta>
                <meta name="abstarct"><xsl:attribute name="content"><xsl:value-of select="concat(normalize-space(summary), '&#xA;')"/></xsl:attribute></meta>
                <meta name="Keywords">
					<xsl:attribute name="content">
						<xsl:value-of select="personalInfo/lastName"/> <xsl:value-of select="personalInfo/firstName"/>,<xsl:value-of select="personalInfo/job-title"/>,<xsl:for-each select="languages/language/"><xsl:value-of select="name"/>,</xsl:for-each><xsl:for-each select="technologies/technology-domain"><xsl:value-of select="name"/>,</xsl:for-each>
					</xsl:attribute>
				</meta>
                <meta name="Author"><xsl:attribute name="content"> <xsl:value-of select="personalInfo/lastName"/> <xsl:value-of select="personalInfo/firstName"/> </xsl:attribute></meta>
                <link id="printId" REL="stylesheet" HREF="Ressources/style.css" type="text/css"/>
                <link REL="stylesheet" HREF="Ressources/jquery/themes/redmond/jquery.ui.all.css" type="text/css"/>
                <link rel="icon" href="favicon.ico"/>

                <script type="text/javascript" src="Ressources/jquery/jquery-1.5.2.min.js"></script>
                <script type="text/javascript" src="Ressources/jquery/ui/jquery-ui-1.8.12.custom.js"></script>
            </head>
            <body>
                <a name="topNavigation"></a>
                <table width="80%" border="0" align="center" class="none">
                	<tr>
                		<td>
                			<div id="roundedPdf">
                				<xsl:if test="@locale='fr'"><a href="pdf/cv_Voronetski.pdf" class="pdfDownloadLink"><xsl:attribute name="title"><xsl:value-of select="localization/label_DownloadPdf"/></xsl:attribute><img src="Ressources/images/pdf_icon_24x24.gif" alt="cv in pdf version" border="0" class="flagStyle"/><xsl:value-of select="localization/label_DownloadPdf"/></a></xsl:if>
								<xsl:if test="@locale='en'"><a href="pdf/cv_Voronetski_en.pdf" class="pdfDownloadLink"><xsl:attribute name="title"><xsl:value-of select="localization/label_DownloadPdf"/></xsl:attribute><img src="Ressources/images/pdf_icon_24x24.gif" alt="cv in pdf version" border="0" class="flagStyle"/><xsl:value-of select="localization/label_DownloadPdf"/></a></xsl:if>
								<xsl:if test="@locale='ua'"><a href="pdf/cv_Voronetski_ua.pdf" class="pdfDownloadLink"><xsl:attribute name="title"><xsl:value-of select="localization/label_DownloadPdf"/></xsl:attribute><img src="Ressources/images/pdf_icon_24x24.gif" alt="cv in pdf version" border="0" class="flagStyle"/><xsl:value-of select="localization/label_DownloadPdf"/></a></xsl:if>
                                <xsl:if test="@locale='it'"><a href="pdf/cv_Voronetski_it.pdf" class="pdfDownloadLink"><xsl:attribute name="title"><xsl:value-of select="localization/label_DownloadPdf"/></xsl:attribute><img src="Ressources/images/pdf_icon_24x24.gif" alt="cv in pdf version" border="0" class="flagStyle"/><xsl:value-of select="localization/label_DownloadPdf"/></a></xsl:if>
                                <xsl:if test="@locale='ru'"><a href="pdf/cv_Voronetski_ru.pdf" class="pdfDownloadLink"><xsl:attribute name="title"><xsl:value-of select="localization/label_DownloadPdf"/></xsl:attribute><img src="Ressources/images/pdf_icon_24x24.gif" alt="cv in pdf version" border="0" class="flagStyle"/><xsl:value-of select="localization/label_DownloadPdf"/></a></xsl:if>
                            </div>

                		</td>
                		<td align="right">
                			 <div id="roundedLang">
	                			 <xsl:choose>
	                                 	<xsl:when test="@locale='en'"><a href="index_en.html" title="CV in english"><img src="Ressources/images/UnitedKingdom24.png" class="activeFlag" alt="CV in english"/></a></xsl:when>
	                                 	<xsl:otherwise>				  <a href="index_en.html" title="CV in english"><img src="Ressources/images/UnitedKingdom24.png" class="flag" alt="CV in english"/></a></xsl:otherwise>
	                                 </xsl:choose>
	                                 <xsl:choose>
	                                 	<xsl:when test="@locale='fr'"><a href="index.html" title="CV en français"><img src="Ressources/images/France24.png" class="activeFlag" alt="CV en français"/></a></xsl:when>
	                                 	<xsl:otherwise>				  <a href="index.html" title="CV en français"><img src="Ressources/images/France24.png" class="flag" alt="CV en français"/></a></xsl:otherwise>
	                                 </xsl:choose>
	                                 <xsl:choose>
                                         <xsl:when test="@locale='ua'"><a href="index_ua.html" title="Резюме на українській"><img src="Ressources/images/Ukraine24.png" class="activeFlag" alt="Резюме на українській"/></a></xsl:when>
                                         <xsl:otherwise>				  <a href="index_ua.html" title="Резюме на українській"><img src="Ressources/images/Ukraine24.png" class="flag" alt="Резюме на українській"/></a></xsl:otherwise>
                                     </xsl:choose>
                                 <xsl:choose>
                                     <xsl:when test="@locale='it'"><a href="index_it.html" title="CV in italiano"><img src="Ressources/images/Italy24.png" class="activeFlag" alt="CV in italiano"/></a></xsl:when>
                                     <xsl:otherwise>				  <a href="index_it.html" title="CV in italiano"><img src="Ressources/images/Italy24.png" class="flag" alt="CV in italiano"/></a></xsl:otherwise>
                                 </xsl:choose>
                                 <xsl:choose>
                                     <xsl:when test="@locale='ru'"><a href="index_ru.html" title="Резюме на русском"><img src="Ressources/images/Russia24.png" class="activeFlag" alt="Резюме на русском"/></a></xsl:when>
                                     <xsl:otherwise>				  <a href="index_ru.html" title="Резюме на русском"><img src="Ressources/images/Russia24.png" class="flag" alt="Резюме на русском"/></a></xsl:otherwise>
                                 </xsl:choose>
                             </div>
                		</td>
                	</tr>
                </table>

                <DIV id="wrapper">
                    <table width="100%" border="0">
                        <tr>
                            <td align="left" width="25%">
	                               <xsl:for-each select="personalInfo">
	                                   <xsl:value-of select="lastName"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="firstName"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="middleName"/>
                                       <br/><span id="geo"><xsl:value-of select="address"/></span>
	                                   <br/><xsl:value-of select="mobile"/>
	                                   <br/><img src="Ressources/images/email.gif" title="AntiSpam Protection"/>
	                                   <br/><small><xsl:value-of select="additionalInfo"/></small>
	                               </xsl:for-each>
                            </td>
                            <td align="center" width="50%">

                            </td>
                            <td align="right" width="50%">
                                <img src="Ressources/images/voronetskyy.jpg" border="1" alt="my recent foto" width="200px"/>

                            </td>
                        </tr>
                    </table>
                    <table border="0" cellspacing="0" cellpadding="0">

                         <tr>
                            <td colspan="2" >
                                <div id="title">
                                    <img src="Ressources/images/user32.gif" class="floatStyle"/><a name="summary"><h1 class="titleStyle"><xsl:value-of select="summary/@title"/></h1></a>
                                </div>
                            </td>
                        </tr>

                        <section>
                        	<xsl:attribute name="title">
                                <xsl:value-of select="summary/@title"/>
                            </xsl:attribute>
	                        <tr>
	                            <td colspan="2"><xsl:value-of select="summary"/></td>
	                        </tr>
                        </section>


                        <tr><td colspan="2">
                                <div id="title">
                                    <img src="Ressources/images/studyMain32.gif" class="floatStyle"/><a name="education"><h1 class="titleStyle"><xsl:value-of select="education/@title"/></h1></a>
                                </div>
                            </td>
                        </tr>
                        <section>
                        	<xsl:attribute name="title">
                                <xsl:value-of select="education/@title"/>
                            </xsl:attribute><xsl:value-of select="title"/>
	                        <xsl:for-each select="education/organisation">
	                            <tr class="dataItem">
	                                <td class="firstCell">
	                                    <time><xsl:value-of select="date"/></time>
	                                </td>
	                                <td class="info">
	                                    <table width="100%">
	                                        <tr>
	                                            <td><strong class="org"><xsl:value-of select="name"/></strong></td>
	                                        </tr>
	                                        <tr>
	                                        	 <td><xsl:value-of select="/cv/localization/label_GeoLocalization"/> : <span id="geo"><xsl:value-of select="geolocalization"/></span></td>
	                                        </tr>
	                                        <tr>
	                                            <td colspan="2">
	                                                <img src="Ressources/images/study32.gif" class="floatStyle"/>
	                                                <xsl:value-of select="speciality"/>
	                                                <br/><xsl:value-of select="desc"/>
	                                                <xsl:value-of select="note"/>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <td colspan="2">
	                                                <xsl:value-of select="/cv/localization/label_URL"/> :
	                                                <a><xsl:attribute name="href">
	                                                        <xsl:value-of select="url"/>
	                                                    </xsl:attribute><xsl:value-of select="url"/>
	                                                </a>
	                                            </td>
	                                        </tr>
	                                    </table>

	                                </td>
	                            </tr>
	                        </xsl:for-each>
                        </section>

                        <tr>
                            <td colspan="2" >
                                <div id="title">
                                    <img src="Ressources/images/experience32.gif" class="floatStyle"/><a name="experience"><h1 class="titleStyle"><xsl:value-of select="experiences/@title"/></h1></a>
                                </div>
                            </td>
                        </tr>

                        <section>
                        	<xsl:attribute name="title">
                                <xsl:value-of select="experiences/@title"/>
                            </xsl:attribute><xsl:value-of select="title"/>
	                        <xsl:for-each select="experiences/company">
	                            <tr class="dataItem">
	                                <td class="firstCell">
	                                    <time><xsl:value-of select="date"/></time>
	                                </td>
	                                <td class="info">
	                                    <table border="0" class="none">
	                                        <tr>
	                                            <td>
	                                                <table class="none" border="0" width="100%">
	                                                    <tr>
	                                                        <td width="250">
				                                                   <xsl:value-of select="/cv/localization/label_CompanyName"/>:
	                                                        </td>
	                                                        <td><strong class="org"><xsl:value-of select="name"/></strong> -
			                                                <small><a><xsl:attribute name="href">
			                                                        <xsl:value-of select="url"/>
			                                                    </xsl:attribute>
			                                                    <xsl:value-of select="url"/>
			                                                </a></small>
			                                                </td>
	                                                    </tr>
	                                                    <tr>
	                                                    	 <td><xsl:value-of select="/cv/localization/label_GeoLocalization"/> :</td>
	                                                         <td><span id="geo"><xsl:value-of select="geolocalization"/></span></td>
	                                                    </tr>
	                                                    <tr>
	                                                        <td><xsl:value-of select="/cv/localization/label_Activity"/> :</td>
	                                                        <td colspan="2"><xsl:value-of select="activity"/></td>
	                                                    </tr>
	                                                    <tr>
	                                                        <td><img src="Ressources/images/user24.gif" class="floatStyle"/> <xsl:value-of select="/cv/localization/label_JobTitle"/> :</td>
	                                                        <td colspan="2" valign="top"><xsl:value-of select="jobTitle"/>
	                                                            <xsl:if test="@isConsulting='true'">
	                                                                <span id="consultant">***</span>
	                                                            </xsl:if>
	                                                        </td>
	                                                    </tr>
	                                                </table>
	                                              </td>
	                                            </tr>
	                                        <tr>
	                                            <td class="missionDesc" colspan="2"><strong><xsl:value-of select="/cv/localization/label_JobDecs"/></strong> : <xsl:value-of select="jobDesc"/></td>
	                                        </tr>
	                                        <xsl:if test="technologiesList"> <!-- we'll show the additional tech. section only if there is node technologiesList, for exemple, this section is ommited for DVK-Tech company -->
		                                        <tr>	<!-- technology list -->
		                                            <td class="missionDescCode" colspan="2"><strong><xsl:value-of select="/cv/localization/label_technologyList"/></strong> :<code><xsl:value-of select="technologiesList"/></code></td>
		                                        </tr>
		                                    </xsl:if>
	                                    </table>
	                                </td>
	                            </tr>
	                        </xsl:for-each>
	                    </section>


                        <tr><td colspan="2">
                                <div id="title">
                                    <img src="Ressources/images/db.gif" class="floatStyle"/><a name="technologies"><h1 class="titleStyle"><xsl:value-of select="technologies/@title"/></h1></a>
                                </div>
                            </td>
                        </tr>

                        <section>
                        	<xsl:attribute name="title">
                                <xsl:value-of select="technologies/@title"/>
                            </xsl:attribute><xsl:value-of select="title"/>

	                        <xsl:for-each select="technologies/technology-domain">
	                            <tr class="dataItem">
	                                <td class="firstCell">
	                                    <h2 class="titleStyle"><xsl:value-of select="name"/></h2>
	                                </td>
	                                <td class="info">
	                                	<code><xsl:value-of select="itemsList"/></code>
	                                </td>
	                            </tr>
	                        </xsl:for-each>
                        </section>

                        <tr><td colspan="2">
                                <div id="title">
                                    <img src="Ressources/images/languages24.gif" class="floatStyle"/><a name="languages"><h1 class="titleStyle"><xsl:value-of select="languages/@title"/></h1></a>
                                </div>
                            </td>
                        </tr>
                        <section>
                        	<xsl:attribute name="title">
                                <xsl:value-of select="languages/@title"/>
                            </xsl:attribute><xsl:value-of select="title"/>

	                        <xsl:for-each select="languages/language">
	                            <tr class="dataItem">
	                                <td class="firstCell">
	                                    <h2 class="titleStyle"><xsl:value-of select="name"/></h2>
	                                </td>
	                                <td class="info">
	                                    <xsl:value-of select="desc" disable-output-escaping="yes"/>
	                                </td>
	                            </tr>
	                        </xsl:for-each>
                        </section>

                        <tr><td colspan="2">
                                <div id="title">
                                    <img src="Ressources/images/watch24.gif" class="floatStyle"/><a name="miscellanea"><h1 class="titleStyle"><xsl:value-of select="miscellanea/@title"/></h1></a>
                                </div>
                            </td>
                        </tr>

                        <section>
                        	<xsl:attribute name="title">
                                <xsl:value-of select="miscellanea/@title"/>
                            </xsl:attribute><xsl:value-of select="title"/>

	                        <xsl:for-each select="miscellanea/item">
	                            <tr class="dataItem">
	                                <td class="firstCell">
	                                    <h2 class="titleStyle"><xsl:value-of select="name"/></h2>
	                                </td>
	                                <!-- Special processing for node with url node(see the problem with the html link to my blog) -->
	                                <td class="info">
	                                	<xsl:if test="url"><a href="{url}"><xsl:value-of select="url" /></a> - </xsl:if>
	                              		<xsl:value-of select="desc" />
	                                </td>
	                            </tr>
	                        </xsl:for-each>
	                    </section>
                    </table>
                </DIV>

                <p align="center"><small><xsl:value-of select="@version"/></small> <small class="numberSmallPolice"> <xsl:value-of select='datetime:format-date(datetime:date-time(),"yyyy/MM/dd")'/></small>.</p>
                <p> <a href="http://www.twitter.com/yevgune" title="Follow me in Twitter"> <img src="Ressources/images/twitter.png" alt="twitter link" border="0"/></a>
                	<a href="https://github.com/yev/internalization-cv" title="See the project source code on GitHub"> <img src="Ressources/images/GitHubLogo.png" alt="See the project source code on GitHub" border="1" style="margin-left: 20px;"/></a></p>
                <br/>

                <xsl:variable name="ggMapUrl">http://maps.google.com/maps/api/staticmap?center=<xsl:value-of select="personalInfo/googleMapLocationString"/>&amp;zoom=5&amp;size=800x600&amp;markers=color:red|label:S|<xsl:value-of select="personalInfo/googleMapLocationString"/>&amp;sensor=true</xsl:variable>
                <xsl:variable name="ggMapQueryUrl">
                	<a>
	                	<xsl:attribute name="href">http://maps.google.com/maps?q=<xsl:copy-of select="personalInfo/googleMapLocationString"/></xsl:attribute>
	                	<xsl:attribute name="target">_blanc</xsl:attribute>
						View in Google Map site
	                </a>
               	</xsl:variable>
				<xsl:variable name="ggMap">
					<img><xsl:attribute name="src"><xsl:copy-of select="$ggMapUrl"/></xsl:attribute></img>
				</xsl:variable>

				<div id="dialogLocation" title="My current location by Google Maps">
					<xsl:copy-of select="$ggMapQueryUrl" />
					<br/>
					<xsl:copy-of select="$ggMap" />
				</div>

				<script>$(".dataItem:even").css("background-color", "#E9EBE6");</script>

				<script type="text/javascript">
					//hide the map, when open
					$(document).ready(function() {
					  	$("#dialogLocation").hide();
					  	hide();
					});
					$("#myCurrentLocation").click(function(){$("#dialogLocation").dialog({ modal: true, width: 700 });})
				</script>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
