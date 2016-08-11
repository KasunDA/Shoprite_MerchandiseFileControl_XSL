<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="linkedGroup" match="ZXWBBDLD05/IDOC/E1WBB01/E1WBB03/E1WBBEM/ZE1WBBEM">
		<xsl:element name="linkedGroup">
			<xsl:element name="linkedItem">
				<xsl:value-of select="EAN11"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>