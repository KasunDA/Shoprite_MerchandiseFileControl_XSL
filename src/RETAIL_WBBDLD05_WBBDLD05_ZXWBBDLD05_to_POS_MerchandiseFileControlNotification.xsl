<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="perBarcode.xsl"/>
	<xsl:include href="priceGroup.xsl"/>
	<xsl:include href="scaleGroup.xsl"/>
	<xsl:include href="E1WBB09.xsl"/>
	<xsl:include href="shelLife.xsl"/>
	<xsl:include href="ingredientGroup.xsl"/>
	<xsl:template match="/">
		<xsl:variable name="messageID" select="ZXWBBDLD05/IDOC/EDI_DC40/DOCNUM"/>
		<xsl:variable name="site" select="ZXWBBDLD05/IDOC/E1WBB01/LOCNR"/>
		<xsl:variable name="batchDate" select="ZXWBBDLD05/IDOC/EDI_DC40/CREDAT"/>
		<xsl:variable name="batchTime" select="ZXWBBDLD05/IDOC/EDI_DC40/CRETIM"/>
		<xsl:variable name="exportType">
			<xsl:choose>
				<xsl:when test="ZXWBBDLD05/IDOC/E1WBB01[1]/AENKZ='INIT'">0</xsl:when>
				<xsl:otherwise>1</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="articleNO" select="ZXWBBDLD05/IDOC/E1WBB01/MATNR"/>
		<xsl:variable name="taxClassification" select="ZXWBBDLD05/IDOC/E1WBB01/E1WBB02/ZE1WBB02/TAXM1"/>
		<xsl:variable name="departmentNumber">
			<xsl:choose>
				<xsl:when test="count(ZXWBBDLD05/IDOC/E1WBB01/E1WBB02/ABTNR)=1">
					<xsl:value-of select="concat(substring(ZXWBBDLD05/IDOC/E1WBB01/E1WBB02/ABTNR,string-length(ZXWBBDLD05/IDOC/E1WBB01/E1WBB02/ABTNR)-1,string-length(ZXWBBDLD05/IDOC/E1WBB01/E1WBB02/ABTNR)),$taxClassification)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat(substring(/IDOC/E1WBB01/E1WBB02/MATKL,3,2),$taxClassification)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="departmentName" select="ZXWBBDLD05/IDOC/E1WBB01/E1WBB02/ZE1WBB02/ABTNR_TEXT"/>
		<xsl:variable name="mechandiseCategory" select="ZXWBBDLD05/IDOC/E1WBB01/E1WBB02/MATKL"/>
		<xsl:variable name="itemDescription" select="ZXWBBDLD05/IDOC/E1WBB01/E1WBB10/MAKTM"/>
		<xsl:variable name="spras" select="ZXWBBDLD05/IDOC/E1WBB01/SPRAS"/>
		<xsl:variable name="countryoforigin" select="ZXWBBDLD05/IDOC/E1WBB01/E1WBB02/ZE1WBB02/LAND1"/>
		<xsl:variable name="contentunit" select="ZXWBBDLD05/IDOC/E1WBB01/E1WBB02/MARA_INHME"/>
		<xsl:variable name="baseuom" select="ZXWBBDLD05/IDOC/E1WBB01/E1WBB02/BASME"/>
		<xsl:variable name="organic" select="ZXWBBDLD05/IDOC/E1WBB01/E1WBB09/ZE1WBB09/ORGANIC"/>
		<xsl:variable name="irradiated" select="ZXWBBDLD05/IDOC/E1WBB01/E1WBB09/ZE1WBB09/IRRADIATED"/>
		<xsl:element name="POSMerchandise">
			<xsl:element name="MessageID">
				<xsl:value-of select="$messageID"/>
			</xsl:element>
			<xsl:element name="Site">
				<xsl:value-of select="$site"/>
			</xsl:element>
			<xsl:element name="BatchDate">
				<xsl:value-of select="$batchDate"/>
			</xsl:element>
			<xsl:element name="BatchTime">
				<xsl:value-of select="$batchTime"/>
			</xsl:element>
			<xsl:element name="exportType">
				<xsl:value-of select="$exportType"/>
			</xsl:element>
			<!-- TEMPLATE name="perBarcode" -->
			<xsl:apply-templates select="ZXWBBDLD05/IDOC/E1WBB01/E1WBB03/E1WBB04">
				<xsl:with-param name="articleNumber" select="$articleNO"/>
				<xsl:with-param name="departmentNumber" select="$departmentNumber"/>
				<xsl:with-param name="departmentName" select="$departmentName"/>
				<xsl:with-param name="merchandiseCategory" select="$mechandiseCategory"/>
				<xsl:with-param name="itemDescription" select="$itemDescription"/>
				<xsl:with-param name="spras" select="$spras"/>
				<xsl:with-param name="countryoforigin" select="$countryoforigin"/>
				<xsl:with-param name="contentunit" select="$contentunit"/>
				<xsl:with-param name="baseuom" select="$baseuom"/>
				<xsl:with-param name="organic" select="$organic"/>
				<xsl:with-param name="irradiated" select="$irradiated"/>
			</xsl:apply-templates>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
