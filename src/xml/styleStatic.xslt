<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xmlns:datetime="http://exslt.org/dates-and-times"
	xmlns:str="http://exslt.org/strings"
	xmlns:fn="http://www.w3.org/2005/02/xpath-functions">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="/cv">
        <html>
            <head>
                <title>VORONETSKYY Yevgen - Java/J2EE Software Engineer </title>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <meta http-equiv="Window-target" content="_top"/>
                <meta name="robots" content="follow"/>
                <meta name="Description" content="CV de VORONETS'KYY Yevgen"/>
                <meta name="Keywords" content="Voronetskyy,Voronetskyy Yevgen, CV, informatique, DESS, CNAM, Management du CNAM, Dess CRI, programmation, réseau, France, Ukraine, Luxembourg,Dnipropetrovsk, Rumelange, Université, UMLV, Université de Marne-la-Vallée, Paris, legitiName, Teamlog, offshore, siteAudit, html, C#, java, xml, Linux, Windows,Delphi, pascal, XSLT, DELF, DALF, CORBA, Flash, PHP, Mysql, Postgresql, paradox, win32, client, serveur, Brainbench, offshore, J2ee, Ukraine, France, Kiev"/>
                <meta name="Author" content="Voronetskyy Yevgen"/>
                <link id="printId" REL="stylesheet" HREF="Ressources/style.css" type="text/css"/>
                
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
            <body onLoad="javascript:hide();">
                <a name="topNavigation"></a>
                <DIV id="wrapper">
                    <table width="100%" border="0">
                        <tr>
                            <td align="left" width="25%">
                                <xsl:for-each select="personalInfo">
                                    <xsl:value-of select="lastName"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="firstName"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="middleName"/>
                                    <br/><xsl:value-of select="address"/>
                                    <br/><xsl:value-of select="mobile"/>
                                    <br/><img src="Ressources/images/email.gif" title="AntiSpam Protection"/>
                                    <br/><small><xsl:value-of select="additionalInfo"/></small>        
                                </xsl:for-each>
                            </td>
                            <td align="center" width="50%">
                                <table width="100%" border="0">
                                    <tr>
                                        <td align="center"><strong class="org"><a href="index.html">English</a></strong>
                                            • <strong class="org"><a href="index_fr.html">Français</a></strong>
                                            • <strong class="org"><a href="index_ru.html">Русский</a></strong>
                                        • <strong class="org"><a href="index_ua.html">Українська</a></strong></td>
                                    </tr>
                                    <tr>
                                        <td><hr class="neutral"/><!-- Codes by Quackit.com --></td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <table border="0">
                                                <tr>
                                                    <td>
                                                    	<img src="Ressources/images/pdfimage.jpg" style="width:50; height=50;" border="0"/>
                                                    	
                                                    </td>
                                                    <td valign="middle">
                                                        <xsl:if test="@locale='fr'"><a href="pdf/cv_voronetskyy_fr.pdf" class="navigationToogleLink"><xsl:value-of select="localization/label_DownloadPdf"/></a></xsl:if>
                                                        <xsl:if test="@locale='en'"><a href="pdf/cv_voronetskyy.pdf" class="navigationToogleLink"><xsl:value-of select="localization/label_DownloadPdf"/></a></xsl:if>
                                                        <xsl:if test="@locale='ru'"><a href="pdf/cv_voronetskyy_ru.pdf" class="navigationToogleLink"><xsl:value-of select="localization/label_DownloadPdf"/></a></xsl:if>
                                                        <xsl:if test="@locale='ua'"><a href="pdf/cv_voronetskyy_ua.pdf" class="navigationToogleLink"><xsl:value-of select="localization/label_DownloadPdf"/></a></xsl:if>
                                                    </td>
                                                </tr>
                                                
                                            </table>		
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center"><span id="nivigationPanel"><a name="navigationPanel"><xsl:value-of select="localization/navigationPanel/title"/></a> [ <a href="#topNavigation" onClick="javascript:toggle();" class="navigationToogleLink"><span id="navigation_link"></span></a>  ] </span></td>
                                    </tr>
                                    
                                </table>
                            </td>
                            <td align="right" width="25%">
                                <img src="Ressources/images/photo.jpg" border="1"/>
                                
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <table width="100%" border="0">
                                    <tr>
                                        <td align="center">
                                            <div id="fatsNavId">
                                                <a href="#summary"><xsl:value-of select="summary/@title"/></a> 
                                                | <a href="#education"><xsl:value-of select="education/@title"/></a> 
                                                | <a href="#experience"><xsl:value-of select="experiences/@title"/></a> 
                                                | <a href="#technologies"><xsl:value-of select="technologies/@title"/></a>
                                                | <a href="#languages"><xsl:value-of select="languages/@title"/></a> 
                                                | <a href="#miscellanea"><xsl:value-of select="miscellanea/@title"/></a>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
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
                                                        <td width="150"><xsl:value-of select="/cv/localization/label_CompanyName"/> :</td> 
                                                        <td><strong class="org"><xsl:value-of select="name"/></strong><br/></td> 

                                                       
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
                                        <tr>
                                            <td colspan="2" align="right"><span id="smallLink"><xsl:value-of select="/cv/localization/label_URL"/> : 			
                                                <a><xsl:attribute name="href">
                                                        <xsl:value-of select="url"/>
                                                    </xsl:attribute>
                                                    <xsl:value-of select="url"/>
                                                </a>			
                                                <xsl:value-of select="note"/>
                                                </span>
                                            </td>
                                        </tr>
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
                <p> <a href="http://www.twitter.com/yevgune" title="Follow me in Twitter"> <img src="Ressources/images/twitter.png" alt="twitter link" border="0"/></a></p>
                <br/>
				                
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