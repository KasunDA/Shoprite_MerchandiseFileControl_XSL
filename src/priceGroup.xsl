<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="priceGroup" match="ZXWBBDLD05/IDOC/E1WBB01/E1WBB03/E1WBB07">
		
			<xsl:element name="priceGroup">
				<xsl:element name="startDate">
				   <xsl:call-template name="dateFormat">
						  <xsl:with-param name="date" select="DATAB"/>
				   </xsl:call-template>
				</xsl:element>
				<xsl:element name="endDate">
				<xsl:call-template name="dateFormat">
						  <xsl:with-param name="date" select="DATBI"/>
				   </xsl:call-template>
				</xsl:element>
				<xsl:element name="price">
					<xsl:value-of select="format-number(E1WBB08/KWERT*100,'#')"/>
				</xsl:element>
				<xsl:element name="type">
					<xsl:value-of select="KSCHL"/>
				</xsl:element>
				<xsl:element name="promotionId">
					<xsl:value-of select="AKTNR"/>
				</xsl:element>
			</xsl:element>

	</xsl:template>
	
	<xsl:template name="dateFormat">
			<xsl:param name="date"/>
			<xsl:value-of select="concat(substring($date,1,4),'/',substring($date,5,2),'/',substring($date,7,2))"/>
	</xsl:template>
</xsl:stylesheet>