<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="perBarcode.xsl"/>
	<xsl:include href="priceGroup.xsl"/>
	<xsl:include href="scaleGroup.xsl"/>
	<xsl:include href="E1WBB09.xsl"/>
	<xsl:include href="shelLife.xsl"/>
	<xsl:include href="ingredientGroup.xsl"/>
	<xsl:include href="linkedGroup.xsl"/>
	<xsl:template name="perArticle" match="E1WBB01">
		<xsl:variable name="articleNO" select="MATNR"/>
		<xsl:variable name="taxClassification" select="E1WBB02/ZE1WBB02/TAXM1"/>
		<xsl:variable name="departmentNumber">
			<xsl:choose>
				<xsl:when test="count(E1WBB02/ABTNR)=1">
					<xsl:value-of select="concat(substring(E1WBB02/ABTNR,string-length(E1WBB02/ABTNR)-1,string-length(E1WBB02/ABTNR)),$taxClassification)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat(substring(E1WBB02/MATKL,3,2),$taxClassification)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="departmentName" select="E1WBB02/ZE1WBB02/ABTNR_TEXT"/>
		<xsl:variable name="merchandiseCategory" select="E1WBB02/MATKL"/>
		<xsl:variable name="itemDescription" select="E1WBB10/MAKTM"/>
		<xsl:variable name="spras" select="LANG_ISO"/>
		<xsl:variable name="countryoforigin" select="E1WBB02/ZE1WBB02/LAND1"/>
		<xsl:variable name="contentunit" select="E1WBB02/MARA_INHME"/>
		<xsl:variable name="baseuom" select="E1WBB02/BASME"/>
		<xsl:variable name="organic" select="E1WBB09/ZE1WBB09/ORGANIC"/>
		<xsl:variable name="irradiated" select="E1WBB09/ZE1WBB09/IRRADIATED"/>
		
		<xsl:apply-templates select="E1WBB03/E1WBB04">
			<xsl:with-param name="articleNumber" select="$articleNO"/>
			<xsl:with-param name="departmentNumber" select="$departmentNumber"/>
			<xsl:with-param name="departmentName" select="$departmentName"/>
			<xsl:with-param name="merchandiseCategory" select="$merchandiseCategory"/>
			<xsl:with-param name="taxClassification" select="$taxClassification"/>
			<xsl:with-param name="itemDescription" select="$itemDescription"/>
			<xsl:with-param name="spras" select="$spras"/>
			<xsl:with-param name="countryoforigin" select="$countryoforigin"/>
			<xsl:with-param name="contentunit" select="$contentunit"/>
			<xsl:with-param name="baseuom" select="$baseuom"/>
			<xsl:with-param name="organic" select="$organic"/>
			<xsl:with-param name="irradiated" select="$irradiated"/>
		</xsl:apply-templates>
</xsl:template>
</xsl:stylesheet>
