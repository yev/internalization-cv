<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xmlns:datetime="http://exslt.org/dates-and-times"
	xmlns:str="http://exslt.org/strings"
	xmlns:fn="http://www.w3.org/2005/02/xpath-functions">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="/cv">
        <html>
            <head>
                <title><xsl:value-of select="personalInfo/lastName"/> 	 <xsl:value-of select="personalInfo/firstName"/> - <xsl:value-of select="localization/label_CurrentPositionTitle"/></title>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <meta http-equiv="Window-target" content="_top"/>
                <meta name="robots" content="follow"/>
                <meta name="Description" content="CV de VORONETS'KYY Yevgen"/>
                <meta name="Keywords" content="Voronetskyy,Voronetskyy Yevgen, CV, informatique, DESS, CNAM, Management du CNAM, Dess CRI, programmation, réseau, France, Ukraine, Luxembourg,Dnipropetrovsk, Rumelange, Université, UMLV, Université de Marne-la-Vallée, Paris, legitiName, Teamlog, offshore, siteAudit, html, C#, java, xml, Linux, Windows,Delphi, pascal, XSLT, DELF, DALF, CORBA, Flash, PHP, Mysql, Postgresql, paradox, win32, client, serveur, Brainbench, offshore, J2ee, Ukraine, France, Kiev"/>
                <meta name="Author" content="Voronetskyy Yevgen"/>
                <link id="printId" REL="stylesheet" HREF="Ressources/style.css" type="text/css"/>
                <link REL="stylesheet" HREF="Ressources/jquery/themes/redmond/jquery.ui.all.css" type="text/css"/>
                
                <script type="text/javascript" src="Ressources/jquery/jquery-1.5.2.min.js"></script>
                <script type="text/javascript" src="Ressources/jquery/ui/jquery-ui-1.8.12.custom.js"></script>
                <script type="text/javascript">
                    function hide()
                    {
                    document.getElementById("fatsNavId").style.visibility='hidden';
                    document.getElementById("fatsNavId").style.display = 'none';
                    
                    var linkText = document.getElementById("navigation_link");
                    linkText.innerText = linkText.textContent = '<xsl:value-of select="localization/navigationPanel/link_show"/>';
                    
                    
                    return;
                    }
                    function show()
                    {
                    document.getElementById("fatsNavId").style.visibility='visible';
                    document.getElementById("fatsNavId").style.display = 'block';
                    var linkText = document.getElementById("navigation_link");
                    linkText.innerText = linkText.textContent = '<xsl:value-of select="localization/navigationPanel/link_hide"/>';
                    return;
                    }
                    function toggle()
                    {
                    if (document.getElementById("fatsNavId").style.visibility=='visible')
                    {
                    hide();
                    }
                    else
                    {
                    show();
                    }
                    }
                </script>
                
            </head>
            <body>
                <a name="topNavigation"></a>
                <table width="80%" border="0" align="center" class="none">
                	<tr>
                		<td>
                			<div id="roundedPdf"> 
                				<xsl:if test="@locale='fr'"><a href="pdf/cv_voronetskyy.pdf" class="pdfDownloadLink"><xsl:attribute name="title"><xsl:value-of select="localization/label_DownloadPdf"/></xsl:attribute><img src="Ressources/images/pdf_icon_24x24.gif" alt="cv in pdf version" border="0" class="flagStyle"/><xsl:value-of select="localization/label_DownloadPdf"/></a></xsl:if>
								<xsl:if test="@locale='en'"><a href="pdf/cv_voronetskyy_en.pdf" class="pdfDownloadLink"><xsl:attribute name="title"><xsl:value-of select="localization/label_DownloadPdf"/></xsl:attribute><img src="Ressources/images/pdf_icon_24x24.gif" alt="cv in pdf version" border="0" class="flagStyle"/><xsl:value-of select="localization/label_DownloadPdf"/></a></xsl:if>
								<xsl:if test="@locale='ru'"><a href="pdf/cv_voronetskyy_ru.pdf" class="pdfDownloadLink"><xsl:attribute name="title"><xsl:value-of select="localization/label_DownloadPdf"/></xsl:attribute><img src="Ressources/images/pdf_icon_24x24.gif" alt="cv in pdf version" border="0" class="flagStyle"/><xsl:value-of select="localization/label_DownloadPdf"/></a></xsl:if>
								<xsl:if test="@locale='ua'"><a href="pdf/cv_voronetskyy_ua.pdf" class="pdfDownloadLink"><xsl:attribute name="title"><xsl:value-of select="localization/label_DownloadPdf"/></xsl:attribute><img src="Ressources/images/pdf_icon_24x24.gif" alt="cv in pdf version" border="0" class="flagStyle"/><xsl:value-of select="localization/label_DownloadPdf"/></a></xsl:if>
								<xsl:if test="@locale='it'"><a href="pdf/cv_voronetskyy_it.pdf" class="pdfDownloadLink"><xsl:attribute name="title"><xsl:value-of select="localization/label_DownloadPdf"/></xsl:attribute><img src="Ressources/images/pdf_icon_24x24.gif" alt="cv in pdf version" border="0" class="flagStyle"/><xsl:value-of select="localization/label_DownloadPdf"/></a></xsl:if>
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
	                                 	<xsl:when test="@locale='ru'"><a href="index_ru.html" title="Резюме на русском"><img src="Ressources/images/Russia24.png" class="activeFlag" alt="Резюме на русском"/></a></xsl:when>
	                                 	<xsl:otherwise>				  <a href="index_ru.html" title="Резюме на русском"><img src="Ressources/images/Russia24.png" class="flag" alt="Резюме на русском"/></a></xsl:otherwise>
	                                 </xsl:choose>
	                                 <xsl:choose>
	                                 	<xsl:when test="@locale='ua'"><a href="index_ua.html" title="Резюме на українській"><img src="Ressources/images/Ukraine24.png" class="activeFlag" alt="Резюме на українській"/></a></xsl:when>
	                                 	<xsl:otherwise>				  <a href="index_ua.html" title="Резюме на українській"><img src="Ressources/images/Ukraine24.png" class="flag" alt="Резюме на українській"/></a></xsl:otherwise>
	                                 </xsl:choose>
	                                 <xsl:choose>
	                                 	<xsl:when test="@locale='it'"><a href="index_it.html" title="CV in italiano"><img src="Ressources/images/Italy24.png" class="activeFlag" alt="CV in italiano"/></a></xsl:when>
	                                 	<xsl:otherwise>				  <a href="index_it.html" title="CV in italiano"><img src="Ressources/images/Italy24.png" class="flag" alt="CV in italiano"/></a></xsl:otherwise>
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
                                    <br/><a id="myCurrentLocation" href="#top" title="Click here to view the location in Google map."><xsl:value-of select="address"/></a>
                                    <br/><xsl:value-of select="mobile"/>
                                    <br/><img src="Ressources/images/email.gif" title="AntiSpam Protection"/>
                                    <br/><small><xsl:value-of select="additionalInfo"/></small>        
                                </xsl:for-each>
                            </td>
                            <td align="center" width="50%">
                               
                            </td>
                            <td align="right" width="25%">
                                <img src="Ressources/images/photo.jpg" border="1" alt="my recent foto"/>
                                
                            </td>
                        </tr>                      
                    </table>
                    <table border="0" cellspacing="0" cellpadding="0">
                        
                         <tr>
                            <td colspan="2" >
                                <div id="title">
                                    <img src="Ressources/images/user32.gif" class="floatStyle"/><a name="summary"><xsl:value-of select="summary/@title"/></a>			
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2"><xsl:value-of select="summary"/></td>
                        </tr>
                        
                        
                        <tr><td colspan="2">
                                <div id="title">
                                    <img src="Ressources/images/studyMain32.gif" class="floatStyle"/><a name="education"><xsl:value-of select="education/@title"/></a>			
                                </div>
                            </td>
                        </tr>
                        <xsl:for-each select="education/organisation">
                            <tr>
                                <td class="firstCell">
                                    <xsl:value-of select="date"/>
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
                        
                        
                        <tr>
                            <td colspan="2" >
                                <div id="title">
                                    <img src="Ressources/images/experience32.gif" class="floatStyle"/><a name="experience"><xsl:value-of select="experiences/@title"/></a>			
                                </div>
                            </td>
                        </tr>
                        
                        <xsl:for-each select="experiences/company">
                            <tr>
                                <td class="firstCell">
                                    <xsl:value-of select="date"/>
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
	                                            <td class="missionDescCode" colspan="2"><strong><xsl:value-of select="/cv/localization/label_technologyList"/></strong> :<xsl:value-of select="technologiesList"/></td>
	                                        </tr>
	                                    </xsl:if>
                                    </table>
                                </td>
                            </tr>	
                        </xsl:for-each>
                
                        
                        <tr><td colspan="2">
                                <div id="title">
                                    <img src="Ressources/images/db.gif" class="floatStyle"/><a name="technologies"><xsl:value-of select="technologies/@title"/></a>
                                </div>
                            </td>
                        </tr>
                        <xsl:for-each select="technologies/technology-domain">
                            <tr>
                                <td class="firstCell">
                                    <xsl:value-of select="name"/>
                                </td>
                                <td class="info">
                                    <xsl:value-of select="itemsList"/>
                                </td>
                            </tr>	
                        </xsl:for-each>
                        <tr>
                            <td class="firstCell"><span style="color:white;">•</span></td>
                            <td class="info" >
                                <span style="color:white;">
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/java1programmer.gif" border="0" alt="Java1Programmer" class="brainImg" /></a>• 
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/rdbmsdeveloper.gif" border="0" alt="RDBMSdeveloper" class="brainImg"/></a>• 
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img  src="Ressources/Brainbench/html32.gif" border="0" alt="html32" class="brainImg"/></a>• 
                                    
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/java5fundamentals.gif"  border="0" alt="java5fundamentals" class="brainImg"/></a>• 
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/javaserverpages21.gif" border="0" alt="JavaServerPages 2.1" class="brainImg"/></a>• 
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/networkingconcepts.gif"  border="0" alt="networkingconcepts" class="brainImg"/></a>• 
                                    
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/j2ee14.gif" border="0" alt="J2EE 1.4" class="brainImg"/></a>• 
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/java2.gif" border="0" alt="Java 2" class="brainImg"/></a>•
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/WinXP.gif" border="0" alt="WinXP" class="brainImg"/></a>•
                                    
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/computertechnician.gif" border="0" alt="computertechnician" class="brainImg"/></a>• 
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/internetresearchtechniquesandresourcesus.gif" border="0" alt="internetresearchtechniquesandresourcesus" class="brainImg"/></a>•
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/java2platformenterpriseeditionj2ee14fundamentals.gif"  border="0" alt="java2platformenterpriseeditionj2ee14fundamentals" class="brainImg"/></a>•
                                    
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/programmingconcepts.gif" border="0" alt="programmingconcepts" class="brainImg"/></a>•
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/java2nongui.gif" border="0" alt="java2nongui.gif" class="brainImg"/></a>•
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/mswindowsxpdesktopadministration.gif" border="0" alt="mswindowsxpdesktopadministration.gif" class="brainImg"/></a>• 
                                    
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/serveradministration.gif" border="0" alt="serveradministration" class="brainImg"/></a>• 
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/technicalhelpdesk.gif" border="0" alt="technicalhelpdesk.gif" class="brainImg"/></a>•                                    
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/writtenenglishuk.gif" border="0" alt="writtenenglishuk" class="brainImg"/></a>•
                                    
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/communicationspecialist.gif" border="0" alt="communicationspecialist" class="brainImg"/></a>• 
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/oracleplsqlfundamentals.gif" border="0" alt="oracleplsqlfundamentals" class="brainImg"/></a>•
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/networksecurity.gif" border="0" alt="networksecurity" class="brainImg"/></a>•
                                    
                                    <a href="http://www.brainbench.com/transcript.jsp?pid=6068210" ><img src="Ressources/Brainbench/ooconcepts.gif" border="0" alt="ooconcepts" class="brainImg"/></a>•
                                </span>
                               
                            </td>
                            
                        </tr>
                        
                        <tr><td colspan="2">
                                <div id="title">
                                    <img src="Ressources/images/languages24.gif" class="floatStyle"/><a name="languages"><xsl:value-of select="languages/@title"/></a>
                                </div>
                            </td>
                        </tr>
                        <xsl:for-each select="languages/language">
                            <tr>
                                <td class="firstCell">
                                    <xsl:value-of select="name"/>
                                </td>
                                <td class="info">
                                    
                                    <xsl:value-of select="desc" disable-output-escaping="yes"/>
                                </td>
                            </tr>	
                        </xsl:for-each>
                        
                        
                        <tr><td colspan="2">
                                <div id="title">
                                    <img src="Ressources/images/watch24.gif" class="floatStyle"/><a name="miscellanea"><xsl:value-of select="miscellanea/@title"/></a>
                                </div>
                            </td>
                        </tr>
                        <xsl:for-each select="miscellanea/item">
                            <tr>
                                <td class="firstCell">
                                    <xsl:value-of select="name"/>
                                </td>
                                <!-- Special processing for node with url node(see the problem with the html link to my blog) -->
                                <td class="info">
                                	<xsl:if test="url"><a href="{url}"><xsl:value-of select="url" /></a> - </xsl:if>                                
                              		<xsl:value-of select="desc" />
                                </td>
                            </tr>	
                        </xsl:for-each>
                    </table>
                </DIV>
                
                <p align="center"><small><xsl:value-of select="@version"/></small> <small class="numberSmallPolice"> <xsl:value-of select='datetime:format-date(datetime:date-time(),"yyyy/MM/dd")'/></small>.</p>
                <p> <a href="http://www.twitter.com/yevgune" title="Follow me in Twitter"> <img src="Ressources/images/twitter.png" alt="twitter link" border="0"/></a> 
                	<a href="https://github.com/yev/internalization-cv" title="See the project source code on GitHub"> <img src="Ressources/images/GitHubLogo.png" alt="See the project source code on GitHub" border="0" style="margin-left: 20px;"/></a></p>
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
				
				
				<script type="text/javascript">
					//hide the map, when open 
					$(document).ready(function() {
					  	$("#dialogLocation").hide();
					  	hide();
					});
					$("#myCurrentLocation").click(function(){$("#dialogLocation").dialog({ modal: true, width: 700 });})
				</script>
				                
				<!-- Start of StatCounter Code -->
				<script type="text/javascript">
				var sc_project=4797506; 
				var sc_invisible=1; 
				var sc_partition=54; 
				var sc_click_stat=1; 
				var sc_security="c962577d"; 
				</script>
				
				<script type="text/javascript"
				src="http://www.statcounter.com/counter/counter.js"></script><noscript><div
				class="statcounter"><a title="blogger counter"
				href="http://www.statcounter.com/blogger/"
				target="_blank"><img class="statcounter"
				src="http://c.statcounter.com/4797506/0/c962577d/1/"
				alt="blogger counter"/></a></div></noscript>
				<!-- End of StatCounter Code -->
		
            </body>
        </html>
    </xsl:template>  
</xsl:stylesheet> 