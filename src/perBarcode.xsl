<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="perBarcode" match="E1WBB03/E1WBB04">
		<xsl:param name="articleNumber"/>
		<xsl:param name="departmentNumber"/>
		<xsl:param name="departmentName"/>
		<xsl:param name="merchandiseCategory"/>
		<xsl:param name="taxClassification"/>
		<xsl:param name="itemDescription"/>
		<xsl:param name="spras"/>
		<xsl:param name="countryoforigin"/>
		<xsl:param name="contentunit"/>
		<xsl:param name="baseuom"/>
		<xsl:param name="organic"/>
		<xsl:param name="irradiated"/>
		<xsl:variable name="posDescription" select="../E1WBB20/MAKTM_ME"/>
		<xsl:variable name="itemNo">
			<xsl:for-each select="../E1WBB04">
				<xsl:if test="HPEAN='X'">
					<xsl:value-of select="EAN11"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<xsl:if test="count(../E1WBB07[KSCHL='VKP0'])">
			<xsl:element name="posMerchandise">
				<xsl:element name="barcode">
					<xsl:value-of select="EAN11"/>
				</xsl:element>
				<xsl:element name="itemNo">
					<xsl:value-of select="$itemNo"/>
				</xsl:element>
				<xsl:element name="articleNo">
					<xsl:value-of select="$articleNumber"/>
				</xsl:element>
				<xsl:element name="departmentNumber">
					<xsl:value-of select="$departmentNumber"/>
				</xsl:element>
				<xsl:element name="departmentName">
					<xsl:value-of select="$departmentName"/>
				</xsl:element>
				<xsl:element name="merchandiseCategory">
					<xsl:value-of select="$merchandiseCategory"/>
				</xsl:element>
				<!-- Map empty -->
				<xsl:element name="merchandiseCategoryName"/>
				<xsl:element name="taxClassification">
					<xsl:value-of select="$taxClassification"/>
				</xsl:element>
				<xsl:element name="posDescription">
					<xsl:value-of select="$posDescription"/>
				</xsl:element>
				<xsl:element name="itemDescription">
					<xsl:value-of select="$itemDescription"/>
				</xsl:element>
				<!-- TEMPLATE name="priceGroup" -->
				<xsl:apply-templates select="../E1WBB07"/>
				<xsl:call-template name="scaleGroup"/>
				<!-- INGREDIENT GROUP -->
				<xsl:apply-templates select="..">
					<xsl:with-param name="spras" select="$spras"/>
					<xsl:with-param name="countryoforigin" select="$countryoforigin"/>
					<xsl:with-param name="contentunit" select="$contentunit"/>
					<xsl:with-param name="baseuom" select="$baseuom"/>
					<xsl:with-param name="organic" select="$organic"/>
					<xsl:with-param name="irradiated" select="$irradiated"/>
				</xsl:apply-templates>
				<!-- TEMPLATE name="linkedGroup" -->
				<xsl:apply-templates select="../E1WBBEM/ZE1WBBEM"/>
				<!-- TEMPLATE name="shelLife" -->
				<xsl:apply-templates select="../../E1WBB12/ZE1WBB12"/>
				<!-- TEMPLATE name="E1WBB09" -->
				<xsl:apply-templates select="../../E1WBB09"/>
				<xsl:element name="uom">
					<xsl:value-of select="../MEINH"/>
				</xsl:element>
				<xsl:element name="uomDescription"/>
				<xsl:element name="deleteDate">
					<xsl:call-template name="dateFormat">
						<xsl:with-param name="date" select="../../E1WBB09/VKDBI"/>
					</xsl:call-template>
				</xsl:element>
				<xsl:element name="immediateDeleteIndicator">
					<xsl:choose>
						<xsl:when test="string(C_INFO_04)='003'">1</xsl:when>
						<xsl:otherwise>0</xsl:otherwise>
					</xsl:choose>
				</xsl:element>
				<xsl:element name="shortGroupId">
					<xsl:choose>
						<xsl:when test="count(../E1WBB09/ZE1WBB09/MVGR1)=1">
							<xsl:value-of select="format-number(/../E1WBB09/ZE1WBB09/MVGR1,'000')"/>
						</xsl:when>
						<xsl:otherwise/>
					</xsl:choose>
				</xsl:element>
				<xsl:element name="onlinePurchaseSchemeId">
					<xsl:choose>
						<xsl:when test="count(../../E1WBB09/ZE1WBB09/MVGR2)=1">
							<xsl:value-of select="format-number(/../E1WBB09/ZE1WBB09/MVGR2,'00')"/>
						</xsl:when>
						<xsl:otherwise/>
					</xsl:choose>
				</xsl:element>
				<xsl:element name="minNegativeAmount">
					<xsl:if test="count(./E1WBB07[KSCHL='ZOPS'])>0 and SCALE_TYPE='C' and ../E1WBB08/E1WBBSC/SCABAS_QUAN='1'">
						<xsl:value-of select="../E1WBB08/E1WBBSC/COND_VALUE"/>
					</xsl:if>
				</xsl:element>
				<xsl:element name="maxNegativeAmount">
					<xsl:if test="count(./E1WBB07[KSCHL='ZOPS'])>0 and SCALE_TYPE='C' and ../E1WBB08/E1WBBSC/SCABAS_QUAN='2'">
						<xsl:value-of select="../E1WBB08/E1WBBSC/COND_VALUE"/>
					</xsl:if>
				</xsl:element>
			</xsl:element>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
