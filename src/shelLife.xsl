<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="daysConverter">
		<xsl:param name="var"/>
		<xsl:choose>
			<xsl:when test="$var='W' or $var='WK'">7</xsl:when>
			<xsl:when test="$var='M' or $var='MON'">30</xsl:when>
			<xsl:when test="$var='Y' or $var='YR'">365</xsl:when>
			<xsl:otherwise>1</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="shelLife" match="ZXWBBDLD05/IDOC/E1WBB01/E1WBB12/ZE1WBB12">
		<xsl:element name="shelfLife">
			<xsl:variable name="lzein">
				<xsl:call-template name="daysConverter">
					<xsl:with-param name="var" select="LZEIN"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="maxlz" select="MAXLZ"/>
			<xsl:choose>
				<xsl:when test="$maxlz*$lzein>999">999</xsl:when>
				<xsl:otherwise>1</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>