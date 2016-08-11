<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="ingredientGroup" match="ZXWBBDLD05/IDOC/E1WBB01/E1WBB03">
		<xsl:param name="spras"/>
		<xsl:param name="countryoforigin"/>
		<xsl:param name="contentunit"/>
		<xsl:param name="baseuom"/>
		<xsl:param name="organic"/>
		<xsl:param name="irradiated"/>
		<xsl:comment>
			<xsl:value-of select="'IngredientGroup'"/>
		</xsl:comment>
		<xsl:element name="ingredientGroup">
			<xsl:element name="ingredients">
				<xsl:call-template name="string-concat-ingroup">
					<xsl:with-param name="addimatnr_type" select="'INGREDIENTS'"/>
					<xsl:with-param name="spras" select="$spras"/>
				</xsl:call-template>
			</xsl:element>
			<xsl:element name="countryOfOrigin">
				<xsl:value-of select="$countryoforigin"/>
			</xsl:element>
			<xsl:element name="nutritionalValues">
				<xsl:call-template name="string-concat-ingroup">
					<xsl:with-param name="addimatnr_type" select="'NUTRITIONAL'"/>
					<xsl:with-param name="spras" select="$spras"/>
				</xsl:call-template>
			</xsl:element>
			<xsl:element name="storageInstructions">
			<xsl:call-template name="string-concat-ingroup">
					<xsl:with-param name="addimatnr_type" select="'STORAGE_INST'"/>
					<xsl:with-param name="spras" select="$spras"/>
				</xsl:call-template>
			</xsl:element>
			<xsl:element name="allergens">
			<xsl:call-template name="string-concat-ingroup">
					<xsl:with-param name="addimatnr_type" select="'ALLERGENS'"/>
					<xsl:with-param name="spras" select="$spras"/>
				</xsl:call-template>
			</xsl:element>
			<xsl:element name="precautions">
			<xsl:call-template name="string-concat-ingroup">
					<xsl:with-param name="addimatnr_type" select="'PRECAUTIONARY'"/>
					<xsl:with-param name="spras" select="$spras"/>
				</xsl:call-template>
			</xsl:element>
			<xsl:element name="base100g">
					<xsl:choose>
						<xsl:when test="(($contentunit='ML' or $contentunit='G') and ($baseuom='KG' or $baseuom='L'))">1</xsl:when>
						<xsl:otherwise>0</xsl:otherwise>
					</xsl:choose>
			</xsl:element>
			<xsl:element name="organic"><xsl:value-of select="$organic"/></xsl:element>
			<xsl:element name="irradiated"><xsl:value-of select="$irradiated"/></xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="string-concat-ingroup">
		<xsl:param name="addimatnr_type"/>
		<xsl:param name="spras"/>
		<xsl:variable name="addimatnr_spras">
			<xsl:for-each select="E1WTADAL1/E1WTADAL2">
				<xsl:if test="../../E1WTADAL1[ADDIMATNR=$addimatnr_type] and ADDISPRAS =$spras">
					<xsl:value-of select="ADDITXT"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="string-length($addimatnr_spras)>0">
				<xsl:value-of select="$addimatnr_spras"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="E1WTADAL1/E1WTADAL2">
					<xsl:if test="../../E1WTADAL1[ADDIMATNR=$addimatnr_type] and ADDISPRAS ='EN'">
						<xsl:value-of select="ADDITXT"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>