# $KYAULabs: serv.tcl,v 1.0.0 2021/11/29 01:37:53 kyau Exp $
#
#   █████████▀█ █████████ █ ▀▀▀▀▀▀▀▀▀▀ █████████▀█ █████████▀█
#   █████████ █ █████████ █ ██████████ █████████ █ █████████ █
#   █████████▀█ █████████▀▄ ██████████ █████████▀▄ █████████▀█
# ───────────────────────── ██████████ ──────────────────bz!────
#
# ak!ra.tcl - botpack for hybrid(core)
# Copyright (C) 2021 KYAU Labs (https://kyaulabs.com)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

# north america
#	irc.servercentral.net:+9999		# Chicago, IL
#	irc.mzima.net:+9999				# Los Angeles, CA / IPv6
#	irc.choopa.net:+9999			# New York, NY / IPv6
#	irc.colosolutions.net:+9999		# Orlando, FL
#	irc.Prison.NET:6667				# San Francisco, CA
# europe
#	efnet.deic.eu:+9999				# Aarhus, Denmark / IPv6
#	efnet.port80.se:+9999			# Stockholm, Sweden / IPv6
#	irc.underworld.no:+9999			# Oslo, Norway / IPv6
#	efnet.portlane.se:+9999			# Stockholm, Sweden / IPv6
#	irc.efnet.nl:+9999				# Netherlands
#	irc.homelien.no:6667			# Oslo, Norway / IPv6
#	irc.swepipe.se:+9999			# Stockholm, Sweden / IPv6
#	irc.du.se:+6697					# Borlange, Sweden
array set serversloc {}
set serversloc(irc.servercentral.net:+9999) {Chicago, IL/SSL}
set serversloc(irc.mzima.net:+9999) {Los Angeles, CA/SSL:IPv6:-IDENT}
set serversloc(irc.choopa.net:+9999) {New York, NY/SSL:IPv6}
set serversloc(irc.colosolutions.net:+9999) {Orlando, FL/SSL}
set serversloc(efnet.deic.eu:+9999) {Aarhus, Denmark/SSL:IPv6}
set serversloc(efnet.port80.se:+9999) {Stockholm, Sweden/SSL:IPv6}
set serversloc(irc.underworld.no:+9999) {Oslo, Norway/SSL:IPv6}
set serversloc(efnet.portlane.se:+9999) {Stockholm, Sweden/SSL:IPv6}
set serversloc(irc.efnet.nl:+9999) {Amsterdam, Netherlands/SSL}
set serversloc(irc.swepipe.se:+7000) {Stockholm, Sweden/SSL:IPv6}
set serversloc(irc.du.se:+6697) {Borlange, Sweden/SSL}
if { ${prefer-ipv6} } {
set servers {
irc.mzima.net:+9999
irc.choopa.net:+9999
irc2.choopa.net:+9999
efnet.port80.se:+9999
efnet.deic.eu:+9999
irc.underworld.no:+9999
efnet.portlane.se:+9999
irc.swepipe.se:+7000
}
} {
set servers {
irc.servercentral.net:+9999
irc.mzima.net:+9999
irc.choopa.net:+9999
irc.colosolutions.net:+9999
efnet.deic.eu:+9999
efnet.port80.se:+9999
irc.underworld.no:+9999
efnet.portlane.se:+9999
irc.efnet.nl:+9999
irc.swepipe.se:+7000
irc.du.se:+6697
}
}
# randomize server list order
array set serverlist {}
foreach item [lsort -unique [concat {*}$servers]] {
	set serverslist($item) ""
}

## vim: ft=tcl ts=4 sw=4 noet:
