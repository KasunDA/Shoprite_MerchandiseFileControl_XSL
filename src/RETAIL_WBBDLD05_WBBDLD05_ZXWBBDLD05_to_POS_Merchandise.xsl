<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="perArticle.xsl"/>
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
			<!-- perArticle Template-->
			<xsl:apply-templates select="ZXWBBDLD05/IDOC/E1WBB01"/>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
