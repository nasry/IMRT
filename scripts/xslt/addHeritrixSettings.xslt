<?xml version="1.0" encoding="UTF-8"?>
<!--
 File:        $Id$
 Revision:    $Revision$
 Author:      $Author$
 Date:        $Date$

 The Netarchive Suite - Software to harvest and preserve websites
 Copyright 2004-2009 Det Kongelige Bibliotek and Statsbiblioteket, Denmark

 This library is free software; you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either
 version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public
 License along with this library; if not, write to the Free Software
 Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:dk="http://www.netarkivet.dk/schemas/settings"
xmlns="http://www.netarkivet.dk/schemas/settings"
exclude-result-prefixes="dk">

    <!-- This script updates settings.xml files from versions before  3.3.3,
     adding several settings pertaining to how Heritrix is run.  Note that
     the new settings include a password for the Heritrix GUI, which should
     be changed, as well as two ports that must not be used by other
     programs on the same machine, including other harvesters.
    -->

<xsl:output method="xml" encoding="UTF-8" />

    <xsl:template xml:space="preserve" match="dk:heritrix/dk:noresponseTimeout"><!--
    --><xsl:copy><xsl:copy-of select="@*"/><xsl:apply-templates/></xsl:copy>
                <xsl:comment>Name to use to access the Heritrix GUI</xsl:comment>
                <adminName>admin</adminName>
                <xsl:comment>Password for accesing the Heritrix GUI</xsl:comment>
                <adminPassword>adminPassword</adminPassword>
                <xsl:comment>Port used to access the Heritrix web user interface.
                    This port must not be used by anything else on the machine.
                </xsl:comment>
                <guiPort>8090</guiPort>
                <xsl:comment>Port used to access the Heritrix JMX interface.
                    This port must not be used by anything else on the machine,
                    but does not need to be accessible from other machines
                    unless you want to be able to use jconsole to access
                    Heritrix directly.
                </xsl:comment>
                <jmxPort>8091</jmxPort>
                <xsl:comment>The heap size to use for the Heritrix sub-process.  This
                    should probably be fairly large.  It can be specified in
                    the same way as for the -Xmx argument to Java, e.g.
                    512M, 2G etc.
                </xsl:comment>
                <heapSize>1598M</heapSize><!--
 --></xsl:template>

<!-- Any other node gets copied unchanged. Don't change this. -->
<xsl:template match="*">
	<xsl:copy>
		<xsl:copy-of select="@*"/>
		<xsl:apply-templates/>
	</xsl:copy>
</xsl:template>

<!-- Please keep the comments around -->
    <xsl:template match="comment()">
        <xsl:copy/>
    </xsl:template>

</xsl:stylesheet>
