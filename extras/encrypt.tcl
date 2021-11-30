# $KYAULabs: encrypt.tcl,v 1.1.1 2021/11/30 01:22:33 kyau Exp $
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

bind dcc n|- encrypt akira_encrypt
proc ::akira_encrypt { handle idx args } {
	if { [llength $args] == 0 } { return 1 }
	set file_to_encrypt [join $args]
	set file_encrypted "[lindex [split $file_to_encrypt "."] 0]-secure.tcl"
	catch { set f [open "$file_to_encrypt" r] }
	catch { set ef [open "$file_encrypted" w+] }
	set key "AKiRA!2600"
	while { ![eof $f] } {
		gets $f buffer
		set ebuffer [encrypt $key "$buffer"]
		puts $ef "$ebuffer"
	}
	close $f
	close $ef
	::*akira::output "encrypted file" "$file_to_encrypt \00310<$file_encrypted>\003"
	return 0 ;# TCL_OK
}
::*akira::output "encrypt.tcl" "v1.1.1 \00306<kyau>\003"
# vim: ft=tcl sw=4 ts=4 noet:
