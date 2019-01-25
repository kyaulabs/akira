# $Arch: encrypt.tcl,v 1.010 2019/01/24 02:03:05 kyau Exp $
# ---
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
::*akira::output "encrypt.tcl" "v1.010 \00306<kyau>\003"
# vim: ft=tcl sw=4 ts=4 noet:
