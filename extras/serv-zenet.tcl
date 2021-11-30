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

# europe
#	portlane.se.eu.zenet.org:+6697	# Stockholm, Sweden / IPv6
#	akatsuki.nl.eu.zenet.org:+6697	# Amsterdam, Netherlands / IPv6
array set serversloc {}
set serversloc(portlane.se.eu.zenet.org:+6697) {Stockholm, Sweden/SSL:IPv6}
set serversloc(akatsuki.nl.eu.zenet.org:+6697) {Amsterdam, Netherlands/SSL:IPv6}
if { ${prefer-ipv6} } {
set servers {
portlane.se.eu.zenet.org:+6697
akatsuki.nl.eu.zenet.org:+6697
}
} {
set servers {
portlane.se.eu.zenet.org:+6697
akatsuki.nl.eu.zenet.org:+6697
}
}
# randomize server list order
array set serverlist {}
foreach item [lsort -unique [concat {*}$servers]] {
	set serverslist($item) ""
}

## vim: ft=tcl ts=4 sw=4 noet:
