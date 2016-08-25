<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="E1WBB09" match="E1WBB09">
		<xsl:element name="allowZeroPrice">
			<xsl:choose>
				<xsl:when test="ZE1WBB09/PRAT1=X">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="manualPrice">
			<xsl:choose>
				<xsl:when test="ZE1WBB09/PRAT2=X">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="promptForQuantity">
			<xsl:choose>
				<xsl:when test="KWDHT=3">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="probihitQuantity">
			<xsl:choose>
				<xsl:when test="KWDHT=1">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="probihitRepeat">
			<xsl:choose>
				<xsl:when test="KWDHT=2">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="probihitSale">
			<xsl:choose>
				<xsl:when test="ZE1WBB09/PRAT1=LP">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="restrictItem">
			<xsl:choose>
				<xsl:when test="ZE1WBB09/PRAT3=X">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
