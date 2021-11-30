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
#	origin.irc.corrupt-net.org:+6697	# Roubaix, France / IPv6
#	ca.irc.corrupt-net.org:+6697		# Beauharnois, Canada / IPv6
#	de.irc.corrupt-net.org:+6697		# Limburg an der Lahn, Germany / IPv6
array set serversloc {}
set serversloc(origin.irc.corrupt-net.org:+6697) {Roubaix, France/SSL:IPv6}
set serversloc(ca.irc.corrupt-net.org:+6697) {Beauharnois, Canada/SSL:IPv6}
set serversloc(de.irc.corrupt-net.org:+6697) {Limburg an der Lahn, Germany/SSL:IPv6}
if { ${prefer-ipv6} } {
set servers {
origin.irc.corrupt-net.org:+6697
ca.irc.corrupt-net.org:+6697
de.irc.corrupt-net.org:+6697
}
} {
set servers {
origin.irc.corrupt-net.org:+6697
ca.irc.corrupt-net.org:+6697
de.irc.corrupt-net.org:+6697
}
}
# randomize server list order
array set serverlist {}
foreach item [lsort -unique [concat {*}$servers]] {
	set serverslist($item) ""
}

## vim: ft=tcl ts=4 sw=4 noet:
