<?xml version="1.0" encoding="UTF-8"?>
<!--

@author: bWare@iWare.co.uk
@license: All rights reserved.

-->
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
	<xsl:output
		indent="yes"
	/>

	<xsl:template match="html">
		<yugioh>
			<name>
				<xsl:value-of select=".//header[@id='WikiaPageHeader']/h1" />
			</name>
			<img>
				<xsl:value-of select=".//td[@class='cardtable-cardimage']/a/@href" />
			</img>
			<color>
				<xsl:value-of select=".//table[@class='cardtable']/tr[1]/@bgcolor" />
			</color>				
			<attribute>
				<xsl:value-of select=".//a[@href='/wiki/Attribute']/parent::th/parent::tr/td//img/@alt" />
			</attribute>
			<types>
				<xsl:value-of select=".//a[@href='/wiki/Type']/parent::th/parent::tr/td" />
			</types>
			<level>
				<xsl:value-of select="normalize-space(.//a[@href='/wiki/Level']/parent::th/parent::tr/td)" />
			</level>
			<atk_def>
				<xsl:value-of select=".//a[@href='/wiki/ATK']/parent::th/parent::tr/td" />
			</atk_def>
			<description>
				<xsl:apply-templates select=".//b[.='Card Description(s)']/parent::td//span[.='English']/parent::th/parent::tr/following-sibling::tr[2]/td/node()" />
			</description>
			<id>
				<xsl:value-of select="normalize-space(replace(.//a[@href='/wiki/Yu-Gi-Oh!_Trading_Card_Game']/ancestor::td[1]//span[.='English']/parent::th/parent::tr/following-sibling::tr[2]/td/p[1],'^.*\((.*)\).*$','$1'))" />
			</id>
		</yugioh>
	</xsl:template>

	<xsl:template match="br">
		<xsl:text>
</xsl:text>
	</xsl:template>

</xsl:stylesheet>
