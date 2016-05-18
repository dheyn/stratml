<?xml version="1.0"?>
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns="http://www.w3.org/1999/xhtml" 
	xmlns:p="http://www.stratml.net/PerformancePlanOrReport"
	xmlns:i18n="http://www.stratml.net/internationalization"
	exclude-result-prefixes="p i18n" 
	version="1.0">
	
<!--
	Updated 2016-05-18
	- added internationalization (i18n) prototype for StratML
	- implemented some additional logic for disable generated titles without content (e.g. 'Obejctive(s)')
	
	Updated 2016-05-08
	- changed general html output from table to div construction (improved readability)
	- some minor changes to styles / representation 
	
	Updated 2016-04-11
	- moved representation of <Relationship> elements from above to below the indicators table
	- modified logic for additional <Descriptor> column
	- some minor changes to styles / representation
	
	All changes are marked with '(dhh)'
	
	Detlef Horst Heyn
	detlef.heyn@googlemail.com
-->

<!-- 
	Updated 2016-04-10
	- Added logic to output Desriptor content in the INDICATORS table
	
	Marijan (Mario) Madunic
	mario.madunic@nsxml.com
	North Shore XML Consulting
	BC, Canada
-->
	
<!-- On October 10, 2015, Colin Mackenzie (http://mackenziesolutions.co.uk) changed the orientation of the MeasurementInstance table so that the Type, Startdate, EdnDate, and Description are shown as columns -->
	
<!-- On September 30, 2015, Owen Ambur changed the prompt on the Role Name element from "As" to "Role:" on line 466.-->
<!-- 

Copyright (C) 2015  Joe Carmel
Changes have been made to the previous work to make the stylesheet compatible with the StratML Part 1 ISO standard.

Copyright (C) 2012  Joe Carmel
Changes have been made to the previous work with the use of a table 
in order to place the table of contents at the top of the display.
The font has also been changed to Times Roman.

This stylesheet started from a StratML Part1 display stylesheets developed by Crane Softwrights Ltd. 
Parts an design used from the Crane Softwrights Ltd.

Redistribution and use in source and binary forms, with or without 
modification, are permitted provided that the following conditions are met:
 
- Redistributions of source code must retain the above copyright notices, 
  this list of conditions and the following disclaimer. 
- Redistributions in binary form must reproduce the above copyright notice, 
  this list of conditions and the following disclaimer in the documentation 
  and/or other materials provided with the distribution. 
- The name of the author may not be used to endorse or promote products 
  derived from this software without specific prior written permission. 
 
THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR 
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN 
NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED 
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


-->


<!--
Copyright (C) 2010	01 COMMUNICATIONS INC.
http://stratml.DNAOS.com/stratml.html

This stylesheet started from a StratML Part1 display stylesheets developed by Crane Softwrights Ltd. 
Parts an design used from the Crane Softwrights Ltd. StratML Part1 stylesheets are

Copyright (C)	- Crane Softwrights Ltd. 
              	- http://www.CraneSoftwrights.com/links/res-stratml.htm
 
Redistribution and use in source and binary forms, with or without 
modification, are permitted provided that the following conditions are met:
 
- Redistributions of source code must retain the above copyright notices, 
  this list of conditions and the following disclaimer. 
- Redistributions in binary form must reproduce the above copyright notice, 
  this list of conditions and the following disclaimer in the documentation 
  and/or other materials provided with the distribution. 
- The name of the author may not be used to endorse or promote products 
  derived from this software without specific prior written permission. 
 
THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR 
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN 
NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED 
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
Note: for your reference, the above is the "Modified BSD license", this text
      was obtained 2002-12-16 at http://www.xfree86.org/3.3.6/COPYRIGHT2.html#5
-->

<!-- 
January 2010: This script has been modified to accommodate the updated 
StratML schema.
 
http://xml.gov/stratml/references/PerformancePlanOrReport.xsd 
 
The primary changes involved changing xpath locations, adding a couple 
of elements (Name, Description, OtherInformation), and changing the linking
ids to use the Identifiers provided within the StratML file.
 
Redistribution and use in source and binary forms, with or without 
modification, are permitted per the copyright provided above.
 
Joe Carmel
-->

<!-- 
October 2010: StratML Part2 stylesheets where created starting from the StratML Part1 versions, 
with important fixes,changes, and additions.

The StratML document display stylesheet supports display of both StratML Part1 and Part2 specifications,
including Web browser support.

The easiest way to use it is probably to ensure that the first two lines of all StratML documents are as follows:
....................................................................................
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet href="http://stratml.DNAOS.com/stratml.xsl" type="text/xsl" ?>
....................................................................................

More information is available from stratml@DNAOS.com, and all questions, comments, and suggestions 
should also be sent to the same email address (stratml@DNAOS.com).

A copy of this XSLT-1 stylesheet is maintained and available along with corresponding StratML Part1 and Part2 Schema, 
as well as some documentation are maintained and accessible at the corresponding respective URLs:
- XSLT-1 Browser presentation stylesheet: http://stratml.DNAOS.com/stratml.xsl
- StratML Part1 XML Schema: http://stratml.DNAOS.com/stratml1.xsd
- StratML Part2 XML Schema: http://stratml.DNAOS.com/stratml2.xsd
- StratML Stylesheet documentation: http://stratml.DNAOS.com/stratml.html

Note that the portal sub-site http://stratml.dnaos.com/, refers to the same directory and has been provided for convenience.

An XSLT-2 version of the StratML (x)html presentation stylesheet has been integrated into 
01 COMMUNICATIONS' DNAOS technology (http://www.DNAOS.com/) 
along with StratML content and document management support.

More information on that version, as well as the associated DNAOS technologies and services are available at stratml@DNAOS.com.

Andre Cusson
01 COMMUNICATIONS INC.
acusson@01COMMUNICATIONS.com
--> 


	<xsl:output encoding="UTF-8" indent="yes" method="html"/>
	
	<!-- (dhh)(ipt) internationalization prototype for StratML -->
	<i18n:text>
		<!-- termination message -->
		<line id="TERMINATION_MESSAGE_en-US">Expected a "PerformancePlanOrReport" or "StrategicPlan" document element, but detected:</line>
		<!-- table of contents -->
		<line id="TOC_en-US">Table of contents</line>
		<line id="TOC_en-UK">Contents</line>
		<line id="TOC_de-DE">Inhaltsverzeichnis</line>
		<!--doctype: Strategic_Plan-->
		<line id="Strategic_Plan_en-US">Strategic_Plan</line>
		<line id="Strategic_Plan_en-UK">Strategic_Plan</line>
		<line id="Strategic_Plan_de-DE">Strategischer Plan</line>
		<!--doctype: Performance_Plan-->
		<line id="Performance_Plan_en-US">Performance_Plan</line>
		<line id="Performance_Plan_en-UK">Performance_Plan</line>
		<line id="Performance_Plan_de-DE">Leistungsvorgabe</line>
		<!--doctype: Performance_Report-->
		<line id="Performance_Report_en-US">Performance_Report</line>
		<line id="Performance_Report_en-UK">Performance_Report</line>
		<line id="Performance_Report_de-DE">Leistungsbericht</line>
		<!--Source-->
		<line id="Source_en-US">Source</line>
		<line id="Source_en-UK">Source</line>
		<line id="Source_de-DE">Quelle</line>
		<!--Start-->
		<line id="Start_en-US">Start</line>
		<line id="Start_en-UK">Start</line>
		<line id="Start_de-DE">Beginn</line>
		<!--End-->
		<line id="End_en-US">End</line>
		<line id="End_en-UK">End</line>
		<line id="End_de-DE">Zieldatum</line>
		<!--Publication Date-->
		<line id="Publication Date_en-US">Publication Date</line>
		<line id="Publication Date_en-UK">Publication Date</line>
		<line id="Publication Date_de-DE">Veröffentlichungsdatum</line>
		<!--Vision-->
		<line id="Vision_en-US">Vision</line>
		<line id="Vision_en-UK">Vision</line>
		<line id="Vision_de-DE">Vision</line>
		<!--Mission-->
		<line id="Mission_en-US">Mission</line>
		<line id="Mission_en-UK">Mission</line>
		<line id="Mission_de-DE">Mission</line>
		<!--Values-->
		<line id="Values_en-US">Values</line>
		<line id="Values_en-UK">Values</line>
		<line id="Values_de-DE">Werte</line>
		<!--Submitter-->
		<line id="Submitter_en-US">Submitter</line>
		<line id="Submitter_en-UK">Submitter</line>
		<line id="Submitter_de-DE">Antragsteller</line>
		<!--Given name-->
		<line id="Given name_en-US">Given name</line>
		<line id="Given name_en-UK">Given name</line>
		<line id="Given name_de-DE">Vorname</line>
		<!--Surname-->
		<line id="Surname_en-US">Surname</line>
		<line id="Surname_en-UK">Surname</line>
		<line id="Surname_de-DE">Nachname</line>
		<!--Email Address-->
		<line id="Email Address_en-US">Email Address</line>
		<line id="Email Address_en-UK">Email Address</line>
		<line id="Email Address_de-DE">Email Adresse</line>
		<!--Organization-->
		<line id="Organization_en-US">Organization</line>
		<line id="Organization_en-UK">Organization</line>
		<line id="Organization_de-DE">Organisation</line>
		<!--Name-->
		<line id="Name_en-US">Name</line>
		<line id="Name_en-UK">Name</line>
		<line id="Name_de-DE">Name</line>
		<!--Acronym-->
		<line id="Acronym_en-US">Acronym</line>
		<line id="Acronym_en-UK">Acronym</line>
		<line id="Acronym_de-DE">Kürzel</line>
		<!--Stakeholder(s)-->
		<line id="Stakeholder(s)_en-US">Stakeholder(s)</line>
		<line id="Stakeholder(s)_en-UK">Stakeholder(s)</line>
		<line id="Stakeholder(s)_de-DE">Interessensgruppe(n)</line>
		<!--Person-->
		<line id="Person_en-US">Person</line>
		<line id="Person_en-UK">Person</line>
		<line id="Person_de-DE">Person</line>
		<!--Role-->
		<line id="Role_en-US">Role</line>
		<line id="Role_en-UK">Role</line>
		<line id="Role_de-DE">Rolle</line>
		<!--Goal -->
		<line id="Goal _en-US">Goal </line>
		<line id="Goal _en-UK">Goal </line>
		<line id="Goal _de-DE">Zweck/Ziel </line>
		<!--Objectives-->
		<line id="Objectives_en-US">Objectives</line>
		<line id="Objectives_en-UK">Objectives</line>
		<line id="Objectives_de-DE">Zielsetzungen</line>
		<!--Objective-->
		<line id="Objective_en-US">Objective</line>
		<line id="Objective_en-UK">Objective</line>
		<line id="Objective_de-DE">Zielsetzung</line>
		<!--Generic_Group-->
		<line id="Generic_Group_en-US">Generic_Group</line>
		<line id="Generic_Group_en-UK">Generic_Group</line>
		<line id="Generic_Group_de-DE">Allg. Gruppe</line>
		<!--Performer-->
		<line id="Performer_en-US">Performer</line>
		<line id="Performer_en-UK">Performer</line>
		<line id="Performer_de-DE">Ausführender</line>
		<!--Beneficiary-->
		<line id="Beneficiary_en-US">Beneficiary</line>
		<line id="Beneficiary_en-UK">Beneficiary</line>
		<line id="Beneficiary_de-DE">Nutznießer</line>
		<!--Other Information-->
		<line id="Other Information_en-US">Other Information</line>
		<line id="Other Information_en-UK">Other Information</line>
		<line id="Other Information_de-DE">Weitere Informationen</line>
		<!--INDICATORS-->
		<line id="INDICATORS_en-US">INDICATORS</line>
		<line id="INDICATORS_en-UK">INDICATORS</line>
		<line id="INDICATORS_de-DE">INDIKATOREN</line>
		<!--@PerformanceIndicatorTypeType: Quantitative-->
		<line id="Quantitative_en-US">Quantitative</line>
		<line id="Quantitative_en-UK">Quantitative</line>
		<line id="Quantitative_de-DE">Quantitativ</line>
		<!--@PerformanceIndicatorTypeType: Qualitative-->
		<line id="Qualitative_en-US">Qualitative</line>
		<line id="Qualitative_en-UK">Qualitative</line>
		<line id="Qualitative_de-DE">Qualitativ</line>
		<!--@ValueChainStageType: Outcome-->
		<line id="Outcome_en-US">Outcome</line>
		<line id="Outcome_en-UK">Outcome</line>
		<line id="Outcome_de-DE">Folgen u. Ergebnisse</line>
		<!--@ValueChainStageType: Output_Processing-->
		<line id="Output_Processing_en-US">Output_Processing</line>
		<line id="Output_Processing_en-UK">Output_Processing</line>
		<line id="Output_Processing_de-DE">Output_Processing</line>
		<!--@ValueChainStageType: Output-->
		<line id="Output_en-US">Output</line>
		<line id="Output_en-UK">Output</line>
		<line id="Output_de-DE">Output</line>
		<!--@ValueChainStageType: Input_Processing-->
		<line id="Input_Processing_en-US">Input_Processing</line>
		<line id="Input_Processing_en-UK">Input_Processing</line>
		<line id="Input_Processing_de-DE">Input_Processing</line>
		<!--@ValueChainStageType: Input-->
		<line id="Outcome_en-US">Input</line>
		<line id="Outcome_en-UK">Input</line>
		<line id="Outcome_de-DE">Input</line>
		<!--Measurements-->
		<line id="Measurements_en-US">Measurements</line>
		<line id="Measurements_en-UK">Measurements</line>
		<line id="Measurements_de-DE">Messwerte</line>
		<!--Type-->
		<line id="Type_en-US">Type</line>
		<line id="Type_en-UK">Type</line>
		<line id="Type_de-DE">Typ</line>
		<!--StartDate-->
		<line id="StartDate_en-US">StartDate</line>
		<line id="StartDate_en-UK">StartDate</line>
		<line id="StartDate_de-DE">Starttermin</line>
		<!--EndDate-->
		<line id="EndDate_en-US">EndDate</line>
		<line id="EndDate_en-UK">EndDate</line>
		<line id="EndDate_de-DE">Stichtag</line>
		<!--Units-->
		<line id="Units_en-US">Units</line>
		<line id="Units_en-UK">Units</line>
		<line id="Units_de-DE">Einheiten</line>
		<!--Description-->
		<line id="Description_en-US">Description</line>
		<line id="Description_en-UK">Description</line>
		<line id="Description_de-DE">Beschreibung</line>
		<!--Target-->
		<line id="Target_en-US">Target</line>
		<line id="Target_en-UK">Target</line>
		<line id="Target_de-DE">Planziel / Vorgabe</line>
		<!--Actual-->
		<line id="Actual_en-US">Actual</line>
		<line id="Actual_en-UK">Actual</line>
		<line id="Actual_de-DE">Gegenwärtig</line>
		<!--Relationships-->
		<line id="Relationships_en-US">Relationships</line>
		<line id="Relationships_en-UK">Relationships</line>
		<line id="Relationships_de-DE">Beziehung / Zusammenhang</line>
		<!--@RelationshipTypeType: Broader_Than-->
		<line id="Broader_Than_en-US">Broader_Than</line>
		<line id="Broader_Than_en-UK">Broader_Than</line>
		<line id="Broader_Than_de-DE">Großzügiger als</line>
		<!--@RelationshipTypeType: Peer_To-->
		<line id="Peer_To_en-US">Peer_To</line>
		<line id="Peer_To_en-UK">Peer_To</line>
		<line id="Peer_To_de-DE">Gleichgestellt / Ebenbürtig</line>
		<!--@RelationshipTypeType: Narrower_Than-->
		<line id="Narrower_Than_en-US">Narrower_Than</line>
		<line id="Narrower_Than_en-UK">Narrower_Than</line>
		<line id="Narrower_Than_de-DE">Knapper als</line>
	</i18n:text>
	
	<!-- (dhh)(ipt) internationalization prototype for StratML -->
	<xsl:variable name="i18n" select="document('')/*/i18n:text"/>
	
	<!-- (dhh)(ipt) 2do: specification of lang/var source -->
	<xsl:variable name="language_default" select="'en'"/>
	<xsl:variable name="language">
		<xsl:choose>
			<xsl:when test="//*[@language]"><xsl:value-of select="(//*[@language])[1]/@language"/></xsl:when>
			<xsl:otherwise><xsl:value-of select="$language_default"/></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="variant_default" select="'US'"/>
	<xsl:variable name="variant">
		<xsl:choose>
			<xsl:when test="//*[@variant]"><xsl:value-of select="(//*[@variant])[1]/@variant"/></xsl:when>
			<xsl:otherwise><xsl:value-of select="$variant_default"/></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<xsl:variable name="i18n_suffix_default" select="concat('_',$language_default,'-',$variant_default)"/>
	<xsl:variable name="i18n_suffix" select="concat('_',$language,'-',$variant)"/>
	
	<!-- i18n logic with fallback strategy -->
	<xsl:template name="get_i18n">
		<xsl:param name="id"/>
		<xsl:choose>
			<!-- (dhh) gets first lang/variant specific line -->
			<xsl:when test="string-length(($i18n//*[@id = concat($id,$i18n_suffix)])[1]) > 0"><xsl:value-of select="($i18n//*[@id = concat($id,$i18n_suffix)])[1]"/></xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<!-- (dhh) gets first default-lang/-variant specific line -->
					<xsl:when test="string-length(($i18n//*[@id = concat($id,$i18n_suffix_default)])[1]) > 0"><xsl:value-of select="($i18n//*[@id = concat($id,$i18n_suffix_default)])[1]"/></xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<!-- (dhh) gets first id specific line -->
							<xsl:when test="string-length(($i18n//*[starts-with(@id,$id)])[1]) > 0"><xsl:value-of select="($i18n//*[starts-with(@id,$id)])[1]"/>"/></xsl:when>
							<!-- (dhh) if everything fails - return id -->
							<xsl:otherwise>
								<xsl:message> warning: yet no i18n entry for id=[<xsl:value-of select="$id"/>]</xsl:message>
								<xsl:value-of select="$id"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="/">
		<xsl:variable name="doc-type">
			<xsl:choose>
			  	<xsl:when test="string(*/@Type)"><xsl:value-of select="*/@Type"/></xsl:when>
			  	<xsl:when test="local-name(*) = 'PerformancePlanOrReport'"><xsl:value-of select="'PerformancePlanOrReport'"/></xsl:when>
				<xsl:when test="local-name(*) = 'StrategicPlan'"><xsl:value-of select="'StrategicPlan'"/></xsl:when>
				<xsl:otherwise>
					<xsl:message terminate="yes">
						<!-- (dhh)(ipt) internationalization prototype for StratML -->
						<xsl:call-template name="get_i18n"><xsl:with-param name="id">TERMINATION_MESSAGE</xsl:with-param></xsl:call-template>
						"<xsl:value-of select="concat(namespace-uri(*), ':', local-name(*))"/>"
					</xsl:message>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="plan" select="*"/>
		<html>
			<xsl:text> 
	</xsl:text>
			<xsl:comment>End result created using http://xml.fido.gov/stratml/carmel/iso/part2/part2stratmlTEST.xsl</xsl:comment>
			<xsl:text> 
	</xsl:text>
			<xsl:comment>See:  http://xml.fido.gov/stratml</xsl:comment>
			<xsl:text> 
    </xsl:text>
			<head>
				<title><xsl:value-of select="concat($doc-type, ' - Source: ', //*[local-name(.) = 'Source'])"/></title>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
				<!--these styles are assumed by the stylesheet; can be overridden-->
				<style type="text/css">
/*(dhh) changed from table to div construction*/
html{background-color:#EFEFFF;overflow:hidden;}
.toc {float:left;width:20%;height:100%;overflow:scroll;font-size:80%;}
.content {padding:10pt;background-color:#FFFFFF;float:left;width:76%;height:100%;overflow:scroll;}
/*Global*/
pre,samp {font-family:Times-Roman;font-size:80%}
/*Heading information*/
/*(dhh) changed from Times-Roman to Tahoma, Arial*/
.doc {font-family:Tahoma, Arial; font-size:14pt}
.docheading {font-size:20pt;text-align:center;font-weight:bold}
.docsubheading {font-size:15pt;text-align:center;color:green}
.sourceheading {}
.herald {font-family:sans-serif;font-size:12pt;font-weight:bold}
.subtitle {text-align:left; font-size:14pt;color:black;font-weight:bold}
.orgstaketitle {text-align:left; font-size:14pt;color:black;font-weight:bold}
.orgstakeholder {margin-left:0.5in;font-family:sans-serif;font-size:12pt;}
/*TOC*/
.toctitle {text-align:center; font-size:16pt;color:green;font-weight:bold}
.tocsubtitle {text-align:left; font-size:14pt;color:black;font-weight:bold}
.tocentry {margin-left:.0in;text-indent:.25in;margin-top:0pt;margin-bottom:0pt}
.tocsubentry {margin-left:.25in;text-indent:.25in;margin-top:0pt;margin-bottom:0pt}
/*Body*/
.vmvhead {font-size:15pt;font-weight:bold}
.vmvdesc {margin-left:.25in}
.goalsep {display:visible;margin-top:16pt;margin-bottom:0pt}
.goalhead {text-align:center;font-size:16pt;color:green;font-weight:bold;margin-top:8pt}
.goaldesc {text-align:center;margin-left:25%;margin-right:25%}
.goalstaketitle {margin-left:0.5in;text-align:left; font-size:14pt;color:black;font-weight:bold}
.goalstakeholder {margin-left:1in;text-align:left;margin-left:5%;margin-right:5%}
.objhead {font-size:15pt}
.objstaketitle {margin-left:0.5in; text-align:left; font-size:12pt;color:black;font-weight:bold}
.objstakeholder {margin-left:1in}
/*(dhh) added margin-bottom*/
.infotitle {margin-left:0.5in;text-indent:.25in;margin-top:0pt;margin-bottom:.25in;font-weight:bold;}
.para {margin-left:.25in;margin-right:.25in;text-indent:.25in}
.para-c { margin-left:.25in; margin-right:.25in; text-align: center; }
/*Meta*/
.meta {font-size:8pt;text-align:right;margin-top:0pt;margin-bottom:0pt}
.datatable { 
border-collapse: collapse;
margin-left: 10px;
margin-right: 10px; 
margin-top: 10px;
margin-botttom: 10px; }
.datatable, 
.datatable thead th,
.datatable tbody th,
.datatable tbody td {
border: 1px solid black;
padding-left: 10px;
padding-right: 10px;
}
a:link { text-decoration:none; color: #06D; }
a:visited { color: #048; }
a:hover { color: black; }
				</style>
				<xsl:text> 
		      	</xsl:text>
				<xsl:comment>End-user styles override built-in styles.</xsl:comment>
				<xsl:text> 
   			   	</xsl:text>
				<!-- Is this external stylesheet required? 
				<link type="text/css" rel="stylesheet" href="http://stratml.hyperbase.com/stratml.css"/> -->
			</head>
			<body class="doc">
				<!--present all of the title information-->
				<!-- (dhh) adding div construction -->
				<div class="toc" width="25%" valign="top">
					<xsl:call-template name="toc">
						<xsl:with-param name="tocid" select="generate-id(//*[local-name(.) = 'StrategicPlanCore'])"/>
					</xsl:call-template>
				</div>
				<!-- (dhh) adding div construction -->
				<div class="content" style="padding:10pt;">
					<!-- (dhh) <p class="docheading"><xsl:value-of select="$doc-type"/></p>-->
					<p class="docheading"><xsl:call-template name="get_i18n"><xsl:with-param name="id" select="$doc-type"/></xsl:call-template></p>
					<p class="docsubheading"><xsl:value-of select="$plan/*[local-name(.) = 'Name']"/></p>
					<p class="para"><xsl:value-of select="$plan/*[local-name(.) = 'Description']"/></p>
					<p class="para"><xsl:value-of select="$plan/*[local-name(.) = 'OtherInformation']"/></p>
					<xsl:for-each select="$plan//*[local-name(.) = 'AdministrativeInformation']">
						<xsl:variable name="anchor">
							<xsl:call-template name="getid"/>
						</xsl:variable>
						<p class="docsubheading" id="{$anchor}">
							<!-- dhh <xsl:text>Source: </xsl:text>-->
							<xsl:call-template name="get_i18n"><xsl:with-param name="id">Source</xsl:with-param></xsl:call-template>
							<xsl:text>: </xsl:text>
							<br/>
							<a href="{*[local-name(.) = 'Source']}" target="_blank">
								<samp class="sourceheading">
									<xsl:value-of select="*[local-name(.) = 'Source']"/>
								</samp>
							</a>
						</p>
						<p class="docsubheading">
							<xsl:if test="string-length(*[local-name(.) = 'StartDate']) > 0">
								<xsl:call-template name="get_i18n"><xsl:with-param name="id">Start</xsl:with-param></xsl:call-template>
								<xsl:text>: </xsl:text>
								<xsl:value-of select="*[local-name(.) = 'StartDate']"/>
							</xsl:if>
							<xsl:if test="string-length(*[local-name(.) = 'EndDate']) > 0">
								<xsl:text> </xsl:text>
								<xsl:call-template name="get_i18n"><xsl:with-param name="id">End</xsl:with-param></xsl:call-template>
								<xsl:text>: </xsl:text>
								<xsl:value-of select="*[local-name(.) = 'EndDate']"/>
							</xsl:if>
							<xsl:if test="string-length(*[local-name(.) = 'PublicationDate']) > 0">
								<xsl:text> </xsl:text>
								<xsl:call-template name="get_i18n"><xsl:with-param name="id">Publication Date</xsl:with-param></xsl:call-template>
								<xsl:text>: </xsl:text>
								<xsl:value-of select="*[local-name(.) = 'PublicationDate']"/>
		        			</xsl:if>
						</p>
					</xsl:for-each>
					<table summary="submitter and organization information" class="doc" align="center">
						<tr valign="top">
							<td>
								<xsl:variable name="submitter" select="$plan//*[local-name(.) = 'Submitter']"/>
								<xsl:if test="normalize-space($submitter)">
									<p class="subtitle">
										<xsl:call-template name="get_i18n"><xsl:with-param name="id">Submitter</xsl:with-param></xsl:call-template>
										<xsl:text>:</xsl:text>
									</p>
									<xsl:apply-templates select="$submitter"/>
								</xsl:if>
							</td>
							<td>
								<xsl:variable name="org" select="$plan/*[local-name(.) = 'StrategicPlanCore']/*[local-name(.) = 'Organization']"/>
								<xsl:if test="normalize-space($org)">
									<p class="subtitle">
										<xsl:call-template name="get_i18n"><xsl:with-param name="id">Organization</xsl:with-param></xsl:call-template>
										<xsl:text>:</xsl:text>
									</p>
									<xsl:apply-templates select="$org"/>
								</xsl:if>
							</td>
						</tr>
					</table>
					
					<!-- <xsl:call-template name="toc"><xsl:with-param name="tocid" select="generate-id(//*[local-name(.) = 'StrategicPlanCore'])"/></xsl:call-template> -->
					
					<xsl:apply-templates select="//*[contains('Vision Mission', local-name(.))]"/>
					<xsl:if test="//*[local-name(.) = 'Value' and normalize-space(.)]">
						<p class="vmvhead" id="values_">
							<xsl:choose>
								<xsl:when test="count(//*[local-name(.) = 'Value' and normalize-space(.)])&gt;1"><xsl:call-template name="get_i18n"><xsl:with-param name="id">Values</xsl:with-param></xsl:call-template></xsl:when>
								<xsl:otherwise><xsl:call-template name="get_i18n"><xsl:with-param name="id">Value</xsl:with-param></xsl:call-template></xsl:otherwise>
							</xsl:choose>
						</p>
						<xsl:for-each select="//*[local-name(.) = 'Value']">
							<p class="vmvdesc" id="{generate-id()}">
								<xsl:call-template name="name-desc"/>
							</p>
						</xsl:for-each>
					</xsl:if>
					<xsl:apply-templates select="//*[local-name(.) = 'Goal']"/>
					
					<!--meta data-->
					<p class="meta">
						<a href="http://mackenziesolutions.co.uk" target="_blank">
							<xsl:text>http://mackenziesolutions.co.uk</xsl:text></a>
						<br/>
						<xsl:text>(Stylesheet revision: 2015-10-06)</xsl:text>
						<br/>
					</p>
					<p class="meta">
						<a href="http://xmldatasets.net/XF2/stratmlisoxform.xml" target="_blank">
							<xsl:text>XMLDatasets.net</xsl:text></a>
							<br/>
							<xsl:text>(Stylesheet revision: 2012-09-20 and 2015-05-01)</xsl:text>
							<br/>
					</p>
					
					<p class="meta">
						<a href="http://stratml.DNAOS.com/stratml.html" target="_blank">
							<xsl:text>01 COMMUNICATIONS INC.</xsl:text>
							<br/>
							<samp>http://stratml.DNAOS.com/stratml.html</samp>
						</a>
					</p>
					<p class="meta">
						<xsl:text>Stylesheet revision (main): 2010-10-20T20:10:10.20Z</xsl:text>
						<br/>
						<xsl:text>Stylesheet revision (base): 2010-10-20T20:10:10.20Z</xsl:text>
					</p>
					<p class="meta">
						<a href="http://xmldatasets.net/XF2/stratmlxform3.xml" target="_blank">
							<xsl:text>XMLDatasets.net</xsl:text>
							<br/>
							<samp>http://www.xmldatasets.net/StratML</samp>
						</a>
					</p>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="getid">
		<xsl:choose>
			<xsl:when test="normalize-space(*[local-name(.) = 'Identifier'])">
				<xsl:value-of select="*[local-name(.) = 'Identifier']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="generate-id(.)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*[local-name(.) = 'Submitter']">
		<xsl:variable name="anchor">
			<xsl:call-template name="getid"/>
		</xsl:variable>
		<blockquote id="{$anchor}">
			<xsl:for-each select="*[local-name(.) = 'GivenName' and normalize-space(.)]">
				<p>
					<b class="herald">
						<xsl:call-template name="get_i18n"><xsl:with-param name="id">Given name</xsl:with-param></xsl:call-template>
						<xsl:text>: </xsl:text>
					</b>
					<xsl:value-of select="."/>
				</p>
			</xsl:for-each>
			<xsl:for-each select="*[local-name(.) = 'Surname' and normalize-space(.)]">
				<p>
					<b class="herald">
						<xsl:call-template name="get_i18n"><xsl:with-param name="id">Surname</xsl:with-param></xsl:call-template>
						<xsl:text>: </xsl:text>
					</b>
					<xsl:value-of select="."/>
				</p>
			</xsl:for-each>
			<xsl:for-each select="*[local-name(.) = 'PhoneNumber' and normalize-space(.)]">
				<p>
					<b class="herald">
						<xsl:call-template name="get_i18n"><xsl:with-param name="id">Phone Number</xsl:with-param></xsl:call-template>
						<xsl:text>: </xsl:text>
					</b>
					<xsl:value-of select="."/>
				</p>
			</xsl:for-each>
			<xsl:for-each select="*[local-name(.) = 'EmailAddress' and normalize-space(.)]">
				<p>
					<b class="herald">
						<xsl:call-template name="get_i18n"><xsl:with-param name="id">Email Address</xsl:with-param></xsl:call-template>
						<xsl:text>: </xsl:text>
					</b>
					<a href="mailto:{.}">
						<samp>
							<xsl:value-of select="."/>
						</samp>
					</a>
				</p>
			</xsl:for-each>
		</blockquote>
	</xsl:template>

	<xsl:template match="*[local-name(.) = 'Organization']">
		<xsl:variable name="anchor"><xsl:call-template name="getid"/></xsl:variable>
		<blockquote id="{$anchor}">
			<xsl:for-each select="*[local-name(.) = 'Name' and normalize-space(.)]">
				<p>
					<b class="herald">
						<xsl:call-template name="get_i18n"><xsl:with-param name="id">Name</xsl:with-param></xsl:call-template>
						<xsl:text>: </xsl:text>
					</b>
					<xsl:value-of select="."/>
				</p>
			</xsl:for-each>
			<xsl:for-each select="*[local-name(.) = 'Acronym' and normalize-space(.)]">
				<p>
					<b class="herald">
						<xsl:call-template name="get_i18n"><xsl:with-param name="id">Acronym</xsl:with-param></xsl:call-template>
						<xsl:text>: </xsl:text>
					</b>
					<xsl:value-of select="."/>
				</p>
			</xsl:for-each>
			<xsl:for-each select="*[local-name(.) = 'Description' and normalize-space(.)]">
				<p>
					<b class="herald">
						<xsl:call-template name="get_i18n"><xsl:with-param name="id">Description</xsl:with-param></xsl:call-template>
						<xsl:text>: </xsl:text>
					</b>
					<xsl:value-of select="."/>
				</p>
			</xsl:for-each>
			<xsl:call-template name="stakeholder">
				<xsl:with-param name="level" select="'org'"/>
			</xsl:call-template>
		</blockquote>
	</xsl:template>

	<xsl:template name="toc">
		<xsl:param name="tocid" select="toc"/>
		<xsl:for-each select="*/*[local-name(.) = 'StrategicPlanCore']">
			<p class="toctitle" id="{$tocid}">
				<br/><br/>
				<xsl:call-template name="get_i18n"><xsl:with-param name="id">TOC</xsl:with-param></xsl:call-template>
				<br/><hr width="60%"/>
			</p>
			<xsl:for-each select="*[local-name(.) = 'Vision']">
				<p class="tocentry">
					<xsl:variable name="anchor">
						<xsl:call-template name="getid"/>
					</xsl:variable>
					<a href="#{$anchor}"><xsl:call-template name="get_i18n"><xsl:with-param name="id">Vision</xsl:with-param></xsl:call-template></a>
				</p>
			</xsl:for-each>
			<xsl:for-each select="*[local-name(.) = 'Mission']">
				<p class="tocentry">
					<xsl:variable name="anchor1">
						<xsl:call-template name="getid"/>
					</xsl:variable>
					<a href="#{$anchor1}"><xsl:call-template name="get_i18n"><xsl:with-param name="id">Mission</xsl:with-param></xsl:call-template></a>
				</p>
			</xsl:for-each>
			<xsl:if test="*[local-name(.) = 'Value']">
				<p class="tocentry">
					<a href="#values_">
						<xsl:choose>
							<xsl:when test="count(*[local-name(.) = 'Value'])&gt;1"><xsl:call-template name="get_i18n"><xsl:with-param name="id">Values</xsl:with-param></xsl:call-template></xsl:when>
							<xsl:otherwise><xsl:call-template name="get_i18n"><xsl:with-param name="id">Value</xsl:with-param></xsl:call-template></xsl:otherwise>
						</xsl:choose>
					</a>
				</p>
				<xsl:for-each select="*[local-name(.) = 'Value']">
					<p class="tocsubentry">
						<a href="#{generate-id(.)}">
							<xsl:apply-templates select="*[local-name(.) = 'Name']"/>
						</a>
					</p>
				</xsl:for-each>
			</xsl:if>
			<xsl:for-each select="*[local-name(.) = 'Goal']">
				<p class="tocentry">
					<xsl:variable name="anchor2">
						<xsl:call-template name="getid"/>
					</xsl:variable>
					<a href="#{$anchor2}">
						<xsl:apply-templates select="*[local-name(.) = 'SequenceIndicator']"/>
						<xsl:apply-templates select="*[local-name(.) = 'Name']"/>
					</a>
				</p>
				<xsl:for-each select="*[local-name(.) = 'Objective']">
					<p class="tocsubentry">
						<xsl:variable name="anchor3">
							<xsl:call-template name="getid"/>
						</xsl:variable>
						<a href="#{$anchor3}">
							<xsl:apply-templates select="*[local-name(.) = 'SequenceIndicator']"/>
							<xsl:apply-templates select="*[local-name(.) = 'Name']"/>
						</a>
					</p>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:for-each>
		<br/><hr width="60%"/>
	</xsl:template>

	<xsl:template match="*[local-name(.) = 'SequenceIndicator' and normalize-space(.)]">
		<xsl:value-of select="concat(., ': ')"/>
	</xsl:template>

	<xsl:template match="*[local-name(.) = 'Goal']">
		<hr class="goalsep"/>
		<xsl:variable name="anchor">
			<xsl:call-template name="getid"/>
		</xsl:variable>
		<p class="goalhead" id="{$anchor}">
			<a href="#{$anchor}">
				<xsl:if test="not(contains(*[local-name(.) = 'SequenceIndicator'], 'Goal'))">
					<xsl:call-template name="get_i18n"><xsl:with-param name="id">Goal </xsl:with-param></xsl:call-template>
				</xsl:if>
				<xsl:apply-templates select="*[local-name(.) = 'SequenceIndicator']"/>
			</a>
			<xsl:for-each select="*[local-name(.) = 'Name' and normalize-space(.)]">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</p>
		<xsl:for-each select="*[local-name(.) = 'Description' and normalize-space(.)]">
			<p class="goaldesc">
				<xsl:apply-templates/>
			</p>
		</xsl:for-each>
		<xsl:call-template name="stakeholder">
			<xsl:with-param name="level" select="'goal'"/>
		</xsl:call-template>
		<!-- (dhh) only proceed if objectives exists -->
		<xsl:if test="count(*[local-name(.) = 'Objective' and normalize-space(.)])>0">
			<p class="infotitle">
				<xsl:choose>
					<xsl:when test="count(*[local-name(.) = 'Objective' and normalize-space(.)])>1"><xsl:call-template name="get_i18n"><xsl:with-param name="id">Objectives</xsl:with-param></xsl:call-template></xsl:when>
					<xsl:otherwise><xsl:call-template name="get_i18n"><xsl:with-param name="id">Objective</xsl:with-param></xsl:call-template></xsl:otherwise>
				</xsl:choose>
				<xsl:text>:</xsl:text>
			</p>
			<xsl:for-each select="*[local-name(.) = 'Objective' and normalize-space(.)]">
				<p class="tocsubentry">
					<xsl:variable name="anchor2">
						<xsl:call-template name="getid"/>
					</xsl:variable>
					<a href="#{$anchor2}">
						<xsl:apply-templates select="*[local-name(.) = 'SequenceIndicator']"/>
						<xsl:apply-templates select="*[local-name(.) = 'Name']"/>
						<br/>
					</a>
				</p>
			</xsl:for-each>
		</xsl:if>
		<br/>
		<xsl:apply-templates select="*[local-name(.) = 'OtherInformation']"/>
		<xsl:apply-templates select="*[contains('Objective  ', local-name(.))]"/>
	</xsl:template>

	<xsl:template name="stakeholder">
		<xsl:param name="level" select="'org'"/>
		<xsl:if test="*[local-name(.) = 'Stakeholder' and normalize-space(.)]">
			<p class="{concat($level, 'staketitle')}">
				<xsl:call-template name="get_i18n"><xsl:with-param name="id">Stakeholder(s)</xsl:with-param></xsl:call-template>
				<xsl:text>:</xsl:text>
			</p>
			<xsl:apply-templates select="*[local-name(.) = 'Stakeholder']">
				<xsl:with-param name="level" select="$level"/>
			</xsl:apply-templates>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*[local-name(.) = 'Stakeholder' and normalize-space(.)]">
		<xsl:param name="level" select="'org'"/>
		<p class="{concat($level, 'stakeholder')}">
	 		<xsl:if test="./@StakeholderTypeType">
	 			<xsl:text>(</xsl:text>
	 			<xsl:call-template name="get_i18n"><xsl:with-param name="id"><xsl:value-of select='@StakeholderTypeType'/></xsl:with-param></xsl:call-template>
	 			<xsl:text>) </xsl:text>
	 		</xsl:if>
			<xsl:call-template name="name-desc-role"/>
		</p>
	</xsl:template>

	<xsl:template name="name-desc">
		<b>
			<xsl:apply-templates select="*[local-name(.) = 'Name' and normalize-space(.)]"/>
		</b>
		<xsl:if test="*[local-name(.) = 'Description' and normalize-space(.)]">
			<b>
				<xsl:text>: </xsl:text>
			</b>
			<xsl:apply-templates select="*[local-name(.) = 'Description' and normalize-space(.)]"/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="name-desc-role">
		<xsl:call-template name="name-desc"/>
		<xsl:if test="*[local-name(.) = 'RoleType' and normalize-space(.)]">
			<xsl:text> (</xsl:text>
			<xsl:for-each select="*[local-name(.) = 'RoleType' and normalize-space(.)]">
				<xsl:if test="not(position() = 1)">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:call-template name="get_i18n"><xsl:with-param name="id"><xsl:apply-templates select="."/></xsl:with-param></xsl:call-template>
			</xsl:for-each>
			<xsl:text>)</xsl:text>
		</xsl:if>
		<br/>
		<xsl:if test="*[local-name(.) = 'Role' and normalize-space(.)]">
			<xsl:call-template name="get_i18n"><xsl:with-param name="id">Role</xsl:with-param></xsl:call-template>
			<xsl:text>: </xsl:text>
			<xsl:for-each select="*[local-name(.) = 'Role' and normalize-space(.)]">
				<xsl:call-template name="name-desc-role"/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

	<xsl:template match="*[contains('Vision Mission', local-name(.))]">
		<xsl:variable name="anchor">
			<xsl:call-template name="getid"/>
		</xsl:variable>
		<p class="vmvhead" id="{$anchor}">
			<a href="#{$anchor}">
				<xsl:choose>
					<xsl:when test="local-name(.) = 'Vision'"><xsl:call-template name="get_i18n"><xsl:with-param name="id">Vision</xsl:with-param></xsl:call-template></xsl:when>
					<xsl:otherwise><xsl:call-template name="get_i18n"><xsl:with-param name="id">Mission</xsl:with-param></xsl:call-template></xsl:otherwise>
				</xsl:choose>
			</a>
		</p>
		<p class="vmvdesc">
			<xsl:apply-templates select="*[local-name(.) = 'Description']"/>
		</p>
	</xsl:template>

	<xsl:template match="*[local-name(.) = 'Objective']">
		<xsl:variable name="anchor">
			<xsl:call-template name="getid"/>
		</xsl:variable>
		<p class="objhead" id="{$anchor}">
			<a href="#{$anchor}">
				<xsl:call-template name="get_i18n"><xsl:with-param name="id">Objective</xsl:with-param></xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="*[local-name(.) = 'SequenceIndicator']"/>
			</a>
			<xsl:for-each select="*[local-name(.) = 'Name']">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</p>
		<xsl:for-each select="*[local-name(.) = 'Description']">
			<p class="para">
				<xsl:apply-templates select="."/>
			</p>
		</xsl:for-each>
		<xsl:call-template name="stakeholder">
			<xsl:with-param name="level" select="'obj'"/>
		</xsl:call-template>
		<xsl:apply-templates select="*[local-name(.) = 'OtherInformation']"/>
		<xsl:apply-templates select="*[local-name(.) = 'PerformanceIndicator' and normalize-space(.)]"/>
	</xsl:template>

	<xsl:template match="*[local-name(.) = 'OtherInformation' and normalize-space(.)]">
		<p class="infotitle" id="{generate-id(.)}">
			<xsl:call-template name="get_i18n"><xsl:with-param name="id">Other Information</xsl:with-param></xsl:call-template>
			<xsl:text>:</xsl:text>
		</p>
		<p class="para">
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="*[local-name(.) = 'PerformanceIndicator']">
		<xsl:if test="position() = 1">
			<p class="para-c"><xsl:call-template name="get_i18n"><xsl:with-param name="id">INDICATORS</xsl:with-param></xsl:call-template></p>
		</xsl:if>
		<xsl:variable name="anchor">
			<xsl:call-template name="getid"/>
		</xsl:variable>
		<p class="para-c" id="{$anchor}">
			<a href="#{$anchor}">
				<xsl:apply-templates select="*[local-name(.) = 'SequenceIndicator']"/>
				<xsl:value-of select="normalize-space(*[local-name(.) = 'Name'])"/>
				<xsl:if test="normalize-space(concat(@PerformanceIndicatorType, @ValueChainStage))">
					<xsl:text>[</xsl:text>
					<xsl:call-template name="get_i18n"><xsl:with-param name="id"><xsl:value-of select="normalize-space(@PerformanceIndicatorType)"/></xsl:with-param></xsl:call-template>
					<xsl:if test="normalize-space(@PerformanceIndicatorType) and normalize-space(@ValueChainStage)">
						<xsl:text>, </xsl:text>
					</xsl:if>
					<xsl:call-template name="get_i18n"><xsl:with-param name="id"><xsl:value-of select="normalize-space(@ValueChainStage)"/></xsl:with-param></xsl:call-template>
					<xsl:text>]</xsl:text> 
				</xsl:if>
				<xsl:call-template name="get_i18n"><xsl:with-param name="id">Measurements</xsl:with-param></xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:if test="*[local-name(.) = 'MeasurementDimension' and normalize-space(.)]">
					<xsl:call-template name="get_i18n"><xsl:with-param name="id">in</xsl:with-param></xsl:call-template>
					<xsl:text> </xsl:text>
					<xsl:apply-templates select="*[local-name(.) = 'MeasurementDimension']"/>
				</xsl:if>
			</a>
		</p>
		<p class="para">
			<xsl:apply-templates select="*[local-name(.) = 'Description']"/>
		</p>
		
		<!-- (dhh) position of previous representation of <Relationship> elements -->
		
		<xsl:apply-templates select="." mode="makeMeasurementInstanceTable"/>
		
		<!-- (dhh) moved representation of <Relationship> elements from above to below the indicators table -->
		<xsl:if test="normalize-space(*[local-name(.) = 'Relationship'])">
			<p class="para"><xsl:call-template name="get_i18n"><xsl:with-param name="id">Relationships</xsl:with-param></xsl:call-template>:</p>
			<xsl:apply-templates select="*[local-name(.) = 'Relationship' and normalize-space(.)]"/>
		</xsl:if>
		
		<xsl:apply-templates select="*[local-name(.) = 'OtherInformation']"/>
	</xsl:template>
	
	<xsl:template match="*[local-name(.) = 'Relationship']">
		<xsl:variable name="anchor">
			<xsl:call-template name="getid"/>
		</xsl:variable>
		<p class="tocsubentry" id="{$anchor}">
			<a href="#{$anchor}">
				<xsl:value-of select="*[local-name(.) = 'Name']"/>
				<xsl:if test="normalize-space(@RelationshipType)">
					<xsl:text> - </xsl:text>
					<xsl:call-template name="get_i18n"><xsl:with-param name="id"><xsl:value-of select="@RelationshipType"/></xsl:with-param></xsl:call-template>
				</xsl:if>
			</a>
		</p>
		<p class="para">
			<xsl:apply-templates select="*[local-name(.) = 'Description']"/>
		</p>
	</xsl:template>
	
	<xsl:template match="*[local-name(.) = 'PerformanceIndicator']" mode="makeMeasurementInstanceTable">
		<!-- (dhh) adding width -->
		<table align="center" class="datatable" width="98%">
			<thead>
				<tr>
					<th align="center" width="10%"><xsl:call-template name="get_i18n"><xsl:with-param name="id">Type</xsl:with-param></xsl:call-template></th>
					<th align="center" width="10%"><xsl:call-template name="get_i18n"><xsl:with-param name="id">StartDate</xsl:with-param></xsl:call-template></th>
					<th align="center" width="10%"><xsl:call-template name="get_i18n"><xsl:with-param name="id">EndDate</xsl:with-param></xsl:call-template></th>
					<th align="center" width="10%">
						<xsl:choose>
							<!-- if there is a unit of measurement specified wich is not just whitespace then use it -->
							<xsl:when test="*[local-name(.) = 'UnitOfMeasurement' and normalize-space(.)]">
								<xsl:value-of select="*[local-name(.) = 'UnitOfMeasurement']"/>
							</xsl:when>
							<xsl:otherwise><xsl:call-template name="get_i18n"><xsl:with-param name="id">Units</xsl:with-param></xsl:call-template></xsl:otherwise>
						</xsl:choose>
					</th>

					<!-- Added: 2016-04-10 -->
					<!-- Output child DescriptorName content -->
					<xsl:choose>
						<xsl:when test="descendant::*[local-name() = 'Descriptor' and string-length(child::*) &gt; 0]">
							<th align="center" width="15%"><xsl:value-of select="normalize-space(descendant::*[local-name() = 'Descriptor'][string-length(child::*[local-name() = 'DescriptorName']) &gt; 0][1]/child::*[local-name() = 'DescriptorName'])" /></th>
						</xsl:when>
						<xsl:otherwise />
					</xsl:choose>
					<!-- end -->
					
					<!-- (dhh) modified width -->
					<th align="center" width="*"><xsl:call-template name="get_i18n"><xsl:with-param name="id">Description</xsl:with-param></xsl:call-template></th>
				</tr>
			</thead>
			<tbody>
				<!-- process actual and target if those elments have content -->
				<xsl:apply-templates select="*[local-name() = 'MeasurementInstance']/*[((local-name()='TargetResult') or (local-name() = 'ActualResult')) and normalize-space(.)]">
					<!-- sort requirements from Owen
						[As a general rule, the element having the earliest <StartDate> should appear in the second row of the table,
						immediately below the column headers,
						and <TargetResult>s are commonly established prior to and, thus, should appear above <ActualResult>s. 
						However, there may be instances in which “baseline” <ActualResult>s have been established from an earlier measurement period,
						in which case the general rule should apply. 
						However, if target and actual results have the same start and end dates, the target result should appear above the actual result in the table. 
						In short, the first level of ordering should be based upon the <StartDate>, 
						and when <TargetResult>s and <ActualResult>s have the same start date, 
						the target should appear first even if the actual has an earlier end date (e.g., in the case of interim reports).]
						-->
					<xsl:sort select="*[local-name(.) = 'StartDate']"/>
					<xsl:sort select="*[local-name(.) = 'EndDate']"/>
					<xsl:sort select="local-name(.)" order="descending"/>
				</xsl:apply-templates>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="*[(local-name()='TargetResult') or (local-name() = 'ActualResult')]">
		<tr>
			<td align="center" width="10%">
				<xsl:choose>
					<xsl:when test="local-name()='TargetResult'">
						<xsl:call-template name="get_i18n"><xsl:with-param name="id">Target</xsl:with-param></xsl:call-template>
					</xsl:when>
					<xsl:when test="local-name()='ActualResult'">
						<xsl:call-template name="get_i18n"><xsl:with-param name="id">Actual</xsl:with-param></xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<!-- should not occur but just in case -->
						<br/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td align="center" width="10%">
				<xsl:choose>
					<xsl:when test="normalize-space(*[local-name(.) = 'StartDate'])">
						<xsl:value-of select="*[local-name(.) = 'StartDate']"/>
					</xsl:when>
					<xsl:otherwise>
						<br/>
					</xsl:otherwise> 
				</xsl:choose>
			</td>
			<td align="center" width="10%">
				<xsl:choose>
					<xsl:when test="normalize-space(*[local-name(.) = 'EndDate'])">
						<xsl:value-of select="*[local-name(.) = 'EndDate']"/>
					</xsl:when>
					<xsl:otherwise>
						<br/>
					</xsl:otherwise> 
				</xsl:choose>
			</td>
			<td align="center" width="10%">
				<xsl:choose>
					<xsl:when test="normalize-space(*[local-name(.) = 'NumberOfUnits'])">
						<xsl:value-of select="*[local-name(.) = 'NumberOfUnits']"/>
					</xsl:when>
					<xsl:otherwise>
						<br/>
					</xsl:otherwise> 
				</xsl:choose>
			</td>


			<!-- Added: 2016-04-10 -->
			<!-- Output child DescriptorValue content -->
			<xsl:choose>
				<!-- (dhh) modified test for correct representation if only one <..Result> contains a <Descriptor> -->
				<xsl:when test="../descendant::*[local-name() = 'Descriptor' and string-length(child::*) &gt; 0]">
					<td align="center" width="15%">
						<xsl:choose>
							<xsl:when test="child::*[local-name(.) = 'Descriptor']/child::*[local-name(.) = 'DescriptorValue']">
								<xsl:value-of select="normalize-space(descendant::*[local-name(.) = 'DescriptorValue'])"/>
							</xsl:when>
							<xsl:otherwise>
								<br/>
							</xsl:otherwise> 
						</xsl:choose>
					</td>
				</xsl:when>
				<xsl:otherwise />
			</xsl:choose>
			<!-- end -->

			<!-- (dhh) modified width -->
			<td align="left" width="*">
				<xsl:choose>
					<xsl:when test="normalize-space(*[local-name(.) = 'Description'])">
						<xsl:value-of select="*[local-name(.) = 'Description']"/>
					</xsl:when>
					<xsl:otherwise>
						<br/>
					</xsl:otherwise> 
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="test" userelativepaths="yes" externalpreview="no" url="..\..\..\..\..\..\..\..\xml.war\WEB-INF\cosmos\src\stratml\smi-fy09.stratml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="0"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->