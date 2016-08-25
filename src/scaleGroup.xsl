<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="scaleGroup">
		<xsl:element name="scaleGroup">
			<xsl:element name="scaleGroupId">
				<xsl:value-of select="../../E1WBB09/SCAGR"/>
			</xsl:element>
			<xsl:element name="scaleIndicator">
				<xsl:choose>
					<xsl:when test="count(../../E1WBB09/SCAGR)=1">
						<xsl:value-of select="1"/>
					</xsl:when>
					<xsl:otherwise>0</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="weightIndicator">
				<xsl:choose>
					<xsl:when test="count(../../E1WBB09/SCAGR)=1 and ../../E1WBB02/BASME='KG'">1</xsl:when>
					<xsl:otherwise>0</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>