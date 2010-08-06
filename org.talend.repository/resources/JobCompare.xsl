<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:variable name="ucase"
			select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
		<xsl:variable name="lcase"
			select="'abcdefghijklmnopqrstuvwxyz'" />
		<html>
			<head>
				<title>Generated documentation</title>
				<style type="text/css">
					@page { size: letter; } 
					SPAN.special { font:12pt black; } 
					TABLE.properties { width:95%; } 
					TD.propname { width:30%; font:bold; } 
					TR.profont { font:bold; }
					TD.propval { width:70%; } 
					TD.dependtype { width:20%;} 
					TD.dependloc { width:60%; } 
					TABLE.cols {width:90%; } 
					TD.constraint { width:20%; font:bold; }
					H3.hand { cursor:hand; } 
					img.bordercolor {border-color:#AFCA00; } 
					.FONTSTYLE {font-family:Arial, Helvetica, sans-serif;} 
					.LINKSTYLE {TEXT-DECORATION:none}
					a:hover {TEXT-DECORATION:underline}
					.TITLESTYLE {font-size: 26px; color: #818181;}
					.TOPTITLESTYLE {font-size: 40px; color: #818181;}
					.TABLECOLUMNSTYLE {font-family: Arial, Helvetica,sans-serif; color: #818181; background-color:#E6E6E6;align: center} 
					tr {page-break-inside: avoid}
				</style>
			</head>
			<body>
				<br />
				<table border="0" cellspacing="0" width="90%"
					class="FONTSTYLE" summary="JobCompare&#160;documentation">
					<tr valign="top">
						<!--<td width="15%" rowspan="2" align="center"></td> -->
						<td  align="center">
							<a href="{project/@link}">
								<img src="{project/@logo}" border="0"
									align="bottom" alt="" />
							</a>
						</td>
						<!-- <td width="1%" rowspan="2" align="center"></td> -->
						<td class="TOPTITLESTYLE">
							<xsl:value-of select="/project/@docType" />
						</td>
					</tr>
					<tr valign="top">
						<td height="20" align="center" valign="top" class="TITLESTYLE">
							<xsl:value-of select="/project/@company" />
						</td>
						<td height="20" align="left" valign="top"
							class="TITLESTYLE">
							<xsl:value-of select="/project/@title" />
						</td>
					</tr>
				</table>
				<br />
				<br />
				<table border="1" width="90%" cellpadding="0"
					cellspacing="0" style="border-collapse: collapse"
					bordercolor="#111111" class="FONTSTYLE" summary="">
					<tr valign="top">
						<td align="center" width="25%"
							class="TABLECOLUMNSTYLE">
							PROJECT NAME
						</td>
						<td align="center" width="25%"
							class="FONTSTYLE">
							<xsl:value-of select="/project/@name" />
						</td>
						<td align="center" width="25%"
							class="TABLECOLUMNSTYLE">
							GENERATION DATE
						</td>
						<td align="center" width="25%">
							<xsl:value-of
								select="/project/@generatedDate" />
						</td>
					</tr>
					<tr>
						<td align="center" width="25%"
							class="TABLECOLUMNSTYLE">
							AUTHOR
						</td>
						<td align="center" width="25%">
							<xsl:value-of select="/project/@author" />
						</td>
						<td align="center" width="25%"
							class="TABLECOLUMNSTYLE">
							<xsl:value-of
								select="/project/@versionName" />
						</td>
						<td align="center" width="25%"
							class="FONTSTYLE">
							<xsl:value-of select="/project/@version" />
						</td>
					</tr>
				</table>
				<h2 class="FONTSTYLE">Summary</h2>
				<div class="FONTSTYLE">
					<b>
						<a href="#ProjectDescription">
							Project Description
						</a>
					</b>
				</div>
				<div class="FONTSTYLE">
					<b>
						<a href="#CurrentJobPreviewPicture">
							Current Job Preview Picture
						</a>
					</b>
				</div>
				<div class="FONTSTYLE">
					<b>
						<a href="#ComparedJobPreviewPicture">
							Compared Job Preview Picture
						</a>
					</b>
				</div>
				<div class="FONTSTYLE">
					<b>
						<a href="#JobSettingCompare">
							Job Setting Compare
						</a>
					</b>
				</div>
				<div class="FONTSTYLE">
					<b>
						<a href="#ComparedComponentList">
							Compared Component List
						</a>
					</b>
				</div>
				<br />
				<br />
				<!-- Project Description-->
				<!--HR-->
				<h2 class="FONTSTYLE">
					<a name="#ProjectDescription">
						Project Description
					</a>
				</h2>
				<br />
				<table border="1" width="90%" class="FONTSTYLE"
					cellpadding="0" cellspacing="0"
					style="border-collapse: collapse; padding-left:10mm;"
					bordercolor="#111111" summary="">
					<tr>
						<th align="left" width="30%"
							class="TABLECOLUMNSTYLE">
							Properties
						</th>
						<th align="left" class="TABLECOLUMNSTYLE">
							Values
						</th>
					</tr>
					<tr>
						<td class="FONTSTYLE" align="left">Name</td>
						<td class="FONTSTYLE" align="left">
							<xsl:value-of select="/project/@name" />
						</td>
					</tr>
					<tr>
						<td class="FONTSTYLE" align="left">Language</td>
						<td class="FONTSTYLE" align="left">
							<xsl:value-of select="/project/@language" />
						</td>
					</tr>
					<tr>
						<td class="FONTSTYLE" align="left">
							Description
						</td>
						<td class="FONTSTYLE" align="left">
							<pre>
								<xsl:value-of
									select="/project/pro-description" disable-output-escaping="yes" />
							</pre>
						</td>
					</tr>
				</table>
				<br />
				<br />
				<!-- Project Description-->
				<!--HR-->
				<xsl:variable name="jobCompare" select="/project/jobCompare" />
				<xsl:variable name="currentJobPreviewPicture"
					select="$jobCompare/curJobPreview" />
				<xsl:if test="string-length($currentJobPreviewPicture/@picture)!=0">
					<h2 class="FONTSTYLE">
						<a name="#CurrentJobPreviewPicture">
							Current Job Preview Picture
						</a>
					</h2>
					<br />
					<table border="0" class="FONTSTYLE"
									cellpadding="0" cellspacing="0" align="center" style="border-collapse: collapse"
									bordercolor="#111111" summary="">
									<tr class="FONTSTYLE">
										<td class="FONTSTYLE">
											<b><xsl:value-of select="$currentJobPreviewPicture/@jobName" /></b>
										</td>
									</tr>
					</table>
					<br />
					<div class="FONTSTYLE" align="center">
						<img src="{$currentJobPreviewPicture/@picture}" usemap="#jobComparemap"
							alt="No image available" class="bordercolor" />
							<map id="jobComparemap" name="jobComparemap"/>
					</div>
				</xsl:if>
				<br />
				<br />
				<xsl:variable name="comparedJobPreviewPicture"
					select="$jobCompare/comparedJobPreview" />
				<xsl:if test="string-length($comparedJobPreviewPicture/@picture)!=0">
					<h2 class="FONTSTYLE">
						<a name="#ComparedJobPreviewPicture">
							Compared Job Preview Picture
						</a>
					</h2>
					<br />
					<table border="0" class="FONTSTYLE"
									cellpadding="0" cellspacing="0" align="center" style="border-collapse: collapse"
									bordercolor="#111111" summary="">
									<tr  class="FONTSTYLE">
										<td class="FONTSTYLE">
											<b><xsl:value-of select="$comparedJobPreviewPicture/@jobName" /></b>
										</td>
									</tr>
					</table>
					<br />
					<div class="FONTSTYLE" align="center">
						<img src="{$comparedJobPreviewPicture/@picture}" usemap="#jobComparemap"
							alt="No image available" class="bordercolor" />
							<map id="jobComparemap" name="jobComparemap"/>
					</div>
				</xsl:if>
				<br />
				<br />
				
				<!--Job Setting Compare-->
				<!--HR-->
				<xsl:variable name="jobSetting" select="/project/jobSetting" />
				<h2 class="FONTSTYLE">
					<a name="#JobSettingCompare">Job Setting Compare</a>
				</h2>
				<xsl:variable name="extraList"
					select="$jobSetting/extra/extraItem/@param" />
				<xsl:if test="string-length($extraList)!=0">
				<b class="FONTSTYLE">Extra</b>
				<br />
				<table width="50%" border="1" cellpadding="0"
						cellspacing="0"
					 style="border-collapse: collapse; padding-left:10mm;"
					 bordercolor="#111111" frame="box" summary="">
						<tr>
					 	 <th width="33%" align="left"
							class="TABLECOLUMNSTYLE">
							Parameter
						 </th>
						 <th width="33%" align="left"
							class="TABLECOLUMNSTYLE">
							Current value
						 </th>
						 <th width="33%" align="left"
							class="TABLECOLUMNSTYLE">
							Old value
						 </th>
					 </tr>
					 <xsl:for-each
						 select="$jobSetting/extra/extraItem">
						 <tr>
						     <td class="FONTSTYLE" align="left">
							   	 <xsl:value-of select="@param" />
							 </td>
							 <td class="FONTSTYLE" align="left">
							   	 <xsl:value-of select="@currentValue" />
							 </td>
							 <td class="FONTSTYLE" align="left">
								 <xsl:value-of select="@oldValue" />
							 </td>
						 </tr>
					 </xsl:for-each>
				 </table>
				 <br />
				</xsl:if>
				<xsl:variable name="statsAndLogsList"
					select="$jobSetting/statsAndLog/statsAndLogItem/@param" />
				<xsl:if test="string-length($statsAndLogsList)!=0">
				<b class="FONTSTYLE">Stats &amp; Logs</b>
				<br />
				 <table width="50%" border="1" cellpadding="0"
						cellspacing="0"
					 style="border-collapse: collapse; padding-left:10mm;"
					 bordercolor="#111111" frame="box" summary="">
						<tr>
					 	 <th width="33%" align="left"
							class="TABLECOLUMNSTYLE">
							Parameter
						 </th>
						 <th width="33%" align="left"
							class="TABLECOLUMNSTYLE">
							Current value
						 </th>
						 <th width="33%" align="left"
							class="TABLECOLUMNSTYLE">
							Old value
						 </th>
					 </tr>
					 <xsl:for-each
						 select="$jobSetting/statsAndLog/statsAndLogItem">
						 <tr>
						     <td class="FONTSTYLE" align="left">
							   	 <xsl:value-of select="@param" />
							 </td>
							 <td class="FONTSTYLE" align="left">
							   	 <xsl:value-of select="@currentValue" />
							 </td>
							 <td class="FONTSTYLE" align="left">
								 <xsl:value-of select="@oldValue" />
							 </td>
						 </tr>
					 </xsl:for-each>
				 </table>
				</xsl:if>
				<br />
				<br />
				
				<!--Compared Component List-->
				<!--HR-->
				<xsl:variable name="component" select="/project/component" />
				<h2 class="FONTSTYLE">
					<a name="#ComparedComponentList">Compared Component List</a>
				</h2>
				<xsl:variable name="addComponentList"
					select="$component/addedComponentList/addedItem/@name" />
				<xsl:if test="string-length($addComponentList)!=0">
				 <b class="FONTSTYLE">Added Component</b>
				 <br />
				 <table width="40%" border="1" cellpadding="0"
					 cellspacing="0"
					 style="border-collapse: collapse; padding-left:10mm;"
					 bordercolor="#111111" frame="box" summary="">
					 <tr>
					 	 <th width="10%" align="left"
							class="TABLECOLUMNSTYLE">
						 </th>
						 <th width="45%" align="left"
							class="TABLECOLUMNSTYLE">
							Component Name
						 </th>
						 <th width="45%" align="left"
							class="TABLECOLUMNSTYLE">
							Component Type
						 </th>
					 </tr>
					 <xsl:for-each
						 select="$component/addedComponentList/addedItem">
						 <tr>
						     <td class="FONTSTYLE" align="left">
							   	 <img src="{@icon}" alt="" />
								&#160;&#160;&#160;&#160;&#160;
							 </td>
							 <td class="FONTSTYLE" align="left">
							   	 <xsl:value-of select="@name" />
							 </td>
							 <td class="FONTSTYLE" align="left">
								 <xsl:value-of select="@type" />
							 </td>
						 </tr>
					 </xsl:for-each>
				 </table>
				<br />
				</xsl:if>
				
				<xsl:variable name="deleteComponentList"
					select="$component/deletedComponentList/deletedItem/@name" />
				<xsl:if test="string-length($deleteComponentList)!=0">
				 <b class="FONTSTYLE">Deleted Component</b>
				 <br />
					<table width="40%" border="1" cellpadding="0"
					 cellspacing="0"
					 style="border-collapse: collapse; padding-left:10mm;"
					 bordercolor="#111111" frame="box" summary="">
					 <tr>
					     <th width="10%" align="left"
							class="TABLECOLUMNSTYLE">
						 </th>
						 <th width="45%" align="left"
							class="TABLECOLUMNSTYLE">
							Component Name
						 </th>
						 <th width="45%" align="left"
							class="TABLECOLUMNSTYLE">
							Component Type
						 </th>
					 </tr>
					 <xsl:for-each
						 select="$component/deletedComponentList/deletedItem">
						 <tr>
						 	 <td class="FONTSTYLE" align="left">
							   	 <img src="{@icon}" alt="" />
								&#160;&#160;&#160;&#160;&#160;
							 </td>
							 <td class="FONTSTYLE" align="left">
								 <xsl:value-of select="@name" />
							 </td>
							 <td class="FONTSTYLE" align="left">
								 <xsl:value-of select="@type" />
							 </td>
						 </tr>
					 </xsl:for-each>
				 </table>
				 <br />
				 </xsl:if>
				 
				 <xsl:variable name="modifyComponentList"
					select="$component/modifiedComponentList/modifiedItem/@name" />
				<xsl:if test="string-length($modifyComponentList)!=0">
				 <b class="FONTSTYLE">Modified Component</b>
				 <br />
					<table width="40%" border="1" cellpadding="0"
					 cellspacing="0"
					 style="border-collapse: collapse; padding-left:10mm;"
					 bordercolor="#111111" frame="box" summary="">
					 <tr>
					 	 <th width="10%" align="left"
							class="TABLECOLUMNSTYLE">
						 </th>
						 <th width="45%" align="left"
							class="TABLECOLUMNSTYLE">
							Component Name
						 </th>
						 <th width="45%" align="left"
							class="TABLECOLUMNSTYLE">
							Component Type
						 </th>
					 </tr>
					 <xsl:for-each
						 select="$component/modifiedComponentList/modifiedItem">
						 <tr>
						     <td class="FONTSTYLE" align="center">
							   	 <img src="{@icon}" alt="" />
								&#160;&#160;&#160;&#160;&#160;
							 </td>
							 <td class="FONTSTYLE" align="left">
								 <xsl:value-of select="@name" />
							 </td>
							 <td class="FONTSTYLE" align="left">
								 <xsl:value-of select="@type" />
							 </td>
						 </tr>
					 </xsl:for-each>
				 </table>
				 </xsl:if>
				 <br />
				 <br />
				 
				<!--Compared Component Modified Detailed List-->
				<!--HR-->
					<xsl:variable name="project" select="/project" />	 
					<xsl:if test="string-length($project/modifyComponentListDetail/modifyComponentItem/@componentName)!=0">
						 	<table border="0" class="FONTSTYLE"
									cellpadding="0" cellspacing="0" style="border-collapse: collapse"
									bordercolor="#111111" summary="">
									<tr bgcolor="#666666" class="FONTSTYLE">
										<td class="FONTSTYLE">
											<b>Modified Component details:</b>
										</td>
									</tr>
							</table>
						 	<br />
					<xsl:for-each
						select="$project/modifyComponentListDetail/modifyComponentItem">
						<table border="0" class="FONTSTYLE"
									cellpadding="0" cellspacing="0" style="border-collapse: collapse"
									bordercolor="#111111" summary="">
									<tr bgcolor="#888888" class="FONTSTYLE">
										<td class="FONTSTYLE">
											<b>Component:<xsl:value-of select="@componentName" /></b>
										</td>
									</tr>
								</table>
						<br />
							<xsl:for-each select="paramList">
								<table border="0" class="FONTSTYLE"
									cellpadding="0" cellspacing="0" style="border-collapse: collapse"
									bordercolor="#111111" summary="">
									<tr bgcolor="#E6E6E6" class="FONTSTYLE">
										<td class="FONTSTYLE">
											<b><xsl:value-of select="@paraName" /></b>
										</td>
									</tr>
								</table>
								<table width="40%" border="1" cellpadding="0"
									cellspacing="0"
								 style="border-collapse: collapse; padding-left:10mm;"
								 bordercolor="#111111" frame="box" summary="">
											<tr>
											 	 <th width="33%" align="left"
													class="TABLECOLUMNSTYLE">
													Parameter
												 </th>
												 <th width="33%" align="left"
													class="TABLECOLUMNSTYLE">
													Current value
												 </th>
												 <th width="33%" align="left"
													class="TABLECOLUMNSTYLE">
													Old value
												 </th>
										   </tr>
									  <xsl:for-each select="paramItem">
											    <tr>
											       <td class="FONTSTYLE" align="left">
												   	 <xsl:value-of select="@param" />
												   </td>
												   <td class="FONTSTYLE" align="left">
												   	 <xsl:value-of select="@currentValue" />
												   </td>
												   <td class="FONTSTYLE" align="left">
													 <xsl:value-of select="@oldValue" />
												   </td>
											    </tr>
									  </xsl:for-each>
							  </table>
							  <br />
						</xsl:for-each>
					 	<xsl:for-each select="schema/schemaList">
						<table border="0" class="FONTSTYLE"
							cellpadding="0" cellspacing="0" style="border-collapse: collapse"
							bordercolor="#111111" summary="">
							<tr bgcolor="#E6E6E6" class="FONTSTYLE">
								<td class="FONTSTYLE">
									<b>	Schema:								
										<xsl:value-of
											select="@schemaName" />
									</b>
								</td>
							</tr>
						</table>
				 	    <table width="40%" border="1" cellpadding="0"
						  cellspacing="0"
					         style="border-collapse: collapse; padding-left:10mm;"
					         bordercolor="#111111" frame="box" summary="">
						   <tr>
					 	     <th width="33%" align="left"
							     class="TABLECOLUMNSTYLE">
							     Parameter
						     </th>
						     <th width="33%" align="left"
							    class="TABLECOLUMNSTYLE">
							     Current value
						     </th>
						     <th width="33%" align="left"
							    class="TABLECOLUMNSTYLE">
							     Old value
						     </th>
					       </tr>
					       <xsl:for-each select="schemaItem">
							      <tr>
							          <td class="FONTSTYLE" align="left">
								   	       <xsl:value-of select="@param" />
								      </td>
								      <td class="FONTSTYLE" align="left">
								   	       <xsl:value-of select="@currentValue" />
								      </td>
								      <td class="FONTSTYLE" align="left">
									       <xsl:value-of select="@oldValue" />
								      </td>
							      </tr>
					       </xsl:for-each>
				  	     </table>
				  	</xsl:for-each>
				 	<br />
				</xsl:for-each>
			</xsl:if>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
