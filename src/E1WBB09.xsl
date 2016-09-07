<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="E1WBB09" match="E1WBB09">
		<xsl:element name="allowZeroPrice">
			<xsl:choose>
				<xsl:when test="ZE1WBB09/PRAT1='X'">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="manualPrice">
			<xsl:choose>
				<xsl:when test="ZE1WBB09/PRAT2='X'">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:comment>KWDHT=<xsl:value-of select="KWDHT"/></xsl:comment>
		<xsl:element name="promptForQuantity">
			<xsl:call-template name="bitmask">
				<xsl:with-param name="sum" select="KWDHT"/>
				<xsl:with-param name="mask">4</xsl:with-param>
			</xsl:call-template>
		</xsl:element>
		<xsl:element name="probihitQuantity">
			<xsl:call-template name="bitmask">
				<xsl:with-param name="sum" select="KWDHT"/>
				<xsl:with-param name="mask">2</xsl:with-param>
			</xsl:call-template>
		</xsl:element>
		<xsl:element name="probihitRepeat">
			<xsl:call-template name="bitmask">
				<xsl:with-param name="sum" select="KWDHT"/>
				<xsl:with-param name="mask">1</xsl:with-param>
			</xsl:call-template>
		</xsl:element>
		<xsl:element name="probihitSale">
			<xsl:choose>
				<xsl:when test="ZE1WBB09/VMSTA='LP'">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="restrictItem">
			<xsl:choose>
				<xsl:when test="ZE1WBB09/PRAT3='X'">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>
	<xsl:template name="bitmask">
		<xsl:param name="sum"/>
		<xsl:param name="mask"/>
		<xsl:variable name="check">
			<xsl:choose>
				<xsl:when test="string(number($sum))='NaN'">0</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$sum"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:choose>
			<xsl:when test="(($check mod ($mask * 2)) - ($check mod $mask)) = $mask">1</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
