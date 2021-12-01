# $KYAULabs: akira.tcl,v 2.5.8 2021/11/30 00:30:48 kyau Exp $
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

package provide akira 2.0
package require Tcl 8.6
package require hybridcore 1.8.0
package require http 2.9.0
package require htmlparse 1.2.2
package require md5 2.0.7
package require tls 1.7.11

# hybrid(core) overrides {{{
# hybrid(core: basic {{{
set bot-dir [pwd]
set bot-tcl [info script]
set network "ak!ra"
# }}}
# hybrid(core): logs {{{
set max-logs 20
set max-logsize 0
set quick-logs 0
set log-time 1
set timestamp-format {[%H:%M:%S]}
set keep-all-logs 0
set logfile-suffix ".%d%b%Y"
set switch-logfiles-at 100
set quiet-save 0
# }}}
# hybrid(core): console {{{
set console "mkcoblxs"
set userfile-perm 0600
# }}}
# hybrid(core): botnet/dcc/telnet {{{
set botport [set userport 2600]
set share-unlinks 1
set protect-telnet 0
set dcc-sanitycheck 0
set ident-timeout 0
set require-p 1
set open-telnets 0
set stealth-telnets 0
set use-telnet-banner 0
set connect-timeout 15
set dcc-flood-thr 3
set telnet-flood 5:60
set paranoid-telnet-flood 1
set resolve-timeout 7
# }}}
# hybrid(core): ssl {{{
set ssl-capath "/etc/ssl/certs/"
set ssl-cert-auth 0
#set ssl-verify-dcc 0
#set ssl-verify-bots 0
#set ssl-verify-clients 0
#set ssl-verify-servers 0
# }}}
# hybrid(core): more advanced settings {{{
set ignore-time [expr {1+ [rand 8]}][expr {1+ [rand 8]}]
set hourly-updates 00
#set owner "kyau"
#set notify-newusers "$owner"
set default-flags "h"
set whois-fields "created createdby chattrby lastleft lastlinked lastlogin"
set must-be-owner 1
set max-socks 200
set allow-dk-cmds 1
set dupwait-timeout 5
set strict-host 0
set cidr-support 0
# }}}
# hybrid(core): modules {{{
# hybrid(core): module: blowfish {{{
loadmodule blowfish
set blowfish-use-mode cbc
# }}}
# hybrid(core): module: dns {{{
loadmodule dns
#set dns-servers "8.8.8.8 8.8.4.4"
set dns-servers "1.1.1.1"
set dns-cache 86400
set dns-negcache 600
set dns-maxsends 4
set dns-retrydelay 3
# }}}
# hybrid(core): module: channels {{{
loadmodule channels
set force-expire 0
set share-greet 0
set use-info 1
set allow-ps 0
set default-flood-chan 0:0
set default-flood-deop 3:10
set default-flood-kick 3:10
set default-flood-join 5:60
set default-flood-ctcp 3:60
set default-flood-nick 5:60
set default-aop-delay 0:3
set default-idle-kick 0
set default-chanmode "nt"
set default-stopnethack-mode 6
set default-revenge-mode 0
set default-ban-type 18
set default-ban-time 1[expr {[rand 8] +1}][expr {1+ [rand 8]}]
set default-exempt-time 60
set default-invite-time 60
set default-chanset { -autoop -autovoice -bitch -cycle +dontkickops -dynamicbans -dynamicexempts -dynamicinvites +enforcebans -greet -inactive -nodesynch -protectfriends -protectosp -revenge +revengebot -secret -seen +shared -statuslog +userbans +userexempts +userinvites -protecthalfops -autohalfop -static }
# }}}
# hybrid(core): module: server {{{
loadmodule server
set net-type 0
set realname "hybrid(core) \[$network\]"
set default-port +6697
set msg-rate 2
set keep-nick 1
set quiet-reject 1
set lowercase-ctcp 1
set answer-ctcp 3
set flood-msg 5:60
set flood-ctcp 3:60
set server-cycle-wait 15
set server-timeout 20
set check-stoned 1
set serverror-quit 1
set max-queue-msg 300
set trigger-on-ignore 0
set exclusive-binds 0
set double-mode 1
set double-server 1
set double-help 1
set optimize-kicks 1
set stack-limit 4
# }}}
# hybrid(core): module: ctcp {{{
loadmodule ctcp
set ctcp-mode 0
# }}}
# hybrid(core): module: irc {{{
loadmodule irc
set bounce-bans 0
set bounce-exempts 0
set bounce-invites 0
set bounce-modes 0
set max-bans 100
set max-exempts 20
set max-invites 20
set max-modes 30
set learn-users 0
set wait-split 300
set wait-info 600
set mode-buf-length 200
set opchars "@"
set no-chanrec-info 0
# }}}
# hybrid(core): module: transfer {{{
loadmodule transfer
set max-dloads 3
set dcc-block 0
set copy-to-tmp 1
set xfer-timeout 30
# }}}
# hybrid(core): module: share {{{
loadmodule share
# }}}
# hybrid(core): module: compress {{{
loadmodule compress
set share-compressed 1
set compress-level 9
# }}}
# hybrid(core): module: notes {{{
loadmodule notes
set max-notes 5000
set note-life 60
set allow-fwd 0
set notify-users 1
set notify-onjoin 1
# }}}
# hybrid(core): module: console {{{
loadmodule "console"
set console-autosave 1
set force-channel 0
set info-party 0
# }}}
# }}}
# }}}
# ak!ra botpack {{{
namespace eval ::*akira {
	# namespace variables
	global botnet-nick nick ctcp-version infobot hub server userfile

	variable author "kyau"
	variable t9version "1.4.5(hc1.8.4)"
	variable version "2.5.8+cbc"
	variable hcversion "${ctcp-version}"
	variable release_date "2021.11.26"
	variable ishub 0
	variable isinfo 0
	
	variable blowcrypt_version "v3.7"
	variable tmon_version "v1.0.4"

	# ak!ra: config {{{
	namespace eval config {
		# ak!ra: config: general {{{
		# users to notify when new users/bots are added
		variable admins { "kyau" }
		# botpack logfile
		variable logfile "akira.log"
		# botpack logging level (0=none, 1=invite+limit+key+unban, 2=1+ops)
		variable loglevel 2
		# key used for dcc/schat/telnet verification [encrypt key key]
		variable securekey {*epkJSwvIT2Qe2tDPWyxWng==}
		# determine modes-per-line from net-type
		if {[info exists net-type]} {
			switch -- ${net-type} {
				0 {			# EFnet
					variable modes_per_line 4
				}
				default {	# Other Networks
					variable modes_per_line 3
				}
			}
		}
		# }}}
		# ak!ra: config: botnet {{{
		# botattr to be considered a local bot
		variable control_flag "A"
		# default botnet control (* is all)
		variable control_default "*"
		variable control $control_default
		# display partyline users on dcc connection after motd
		variable motd_userlist true
		# key used for encrypted ops verification
		variable bop_opkey {T4EWF7tZXkslyn/3ZEsTP5cHCLCxLYK7b}
		# should bots request ops when other bots get ops
		variable bop_modeop true
		# should bots request ops when they link to the botnet
		variable bop_linkop true
		# perform op sync, checking that request came from someone with +o
		variable bop_osync true
		# automatically add hosts for bots with +o that request ops
		variable bop_addhost false
		# should bots accept invite requests from other bots to get into channels
		variable bop_icheck true
		# delay between requests bot=>bot, formula: rand() * bot_delay + 2
		variable bot_delay 10
		# maximum simultaneous bot requests to send out
		variable bot_maxreq 2
		# }}}
		# ak!ra mod: config: anti-idle {{{
		# bot anti-idle timer
		variable ai_min 10
		# }}}
		# ak!ra mod: config: autoaway (partyline) {{{
		# partyline - enable/disable the autoaway system
		variable plaa_active true
		# partyline - idle time to automatically set user away
		variable plaa_idle 10
		# }}}
		# ak!ra mod: config: limit {{{
		# grace period to automatically check the limit
		variable alimit_timer 10
		# limit to set above current user count
		variable alimit_add 5
		# limit plus/minus variation amount
		variable alimit_var 2
		# }}}
		# ak!ra mod: config: blowcrypt {{{
		# mode: normal/paranoid (talk unencrypted if no key/don't talk if no key)
		variable bc_mode "normal"
		# channel key list
		variable bc_keys {
			{#ak!ra {%$`N:k.k~JF7#v:6:_U<\L*Q@yC]m[6d}}
		}
		# }}}
	}
	# }}}
	# ak!ra: help {{{
	proc help { handle idx args } {
		if { [llength [lindex $args 0]] == 0 } {
			::*akira::cmdlog "help|${handle}"
			putdcc $idx ""
			putdcc $idx "\00301,01..\003 \00304,05█▓▒░\003\00305█████▀█ \003\00304,05█▓▒░\003\00305█████ █ \003\00300▀\003▀\00314▀▀▀▀▀▀\003▀\00300▀ \003\00304,05█▓▒░\003\00305█████▀█ \003\00304,05█▓▒░\003\00305█████▀█"
			putdcc $idx "\00301,01..\003 \00304,05▓▒░\003\00305██████ █ \003\00304,05▓▒░\003\00305██████ █ \003\00304,05▓▒░\003\00305███████ \003\00304,05▓▒░\003\00305██████ █ \003\00304,05▓▒░\003\00305██████ █"
			putdcc $idx "\00301,01..\003 \00304,05▒░\003\00305███████▀█ \003\00304,05▒░\003\00305███████▀▄ \003\00304,05▒░\003\00305████████ \003\00304,05▒░\003\00305███████▀▄ \003\00304,05▒░\003\00305███████▀█"
			putdcc $idx "\00301,01.\003\00300─\003─\00314─────────────────────── \003\00304,05░\003\00305█████████ \003\00314──────────────────\003bz!\00314──\003─\00300─\003"
			putdcc $idx ""
			if {[ matchattr $handle n] } {
				# owners
				putdcc $idx "\00301,01.\003\00308(owner)\003 commands:"
				putdcc $idx "\00301,01..\003 \00314+bot -bot +chan -chan +host -host +telnet -telnet\003"
				putdcc $idx "\00301,01..\003 \00314+user -user\003"
				putdcc $idx "\00301,01..\003 \00314backup botattr botnick botstat chaddr channels\003"
				putdcc $idx "\00301,01..\003 \00314chpass chhandle dccstat die jump kill link rehash\003"
				putdcc $idx "\00301,01..\003 \00314restart status telnet unlink\003"
				putdcc $idx ""
				putdcc $idx "\00301,01.\003\00308(owner)\003 net commands:"
				putdcc $idx "\00301,01..\003 \00314act channels chankey chanset control die join jump\003"
				putdcc $idx "\00301,01..\003 \00314part rehash save say\003"
				putdcc $idx ""
			}
			if { [matchattr $handle m]} {
				putdcc $idx "\00301,01.\003\00308(master)\003 commands:"
				putdcc $idx "\00301,01..\003 \00314+ignore -ignore\003"
				putdcc $idx "\00301,01..\003 \00314botinfo bots bottree chattr chhandle dolimit\003"
				putdcc $idx "\00301,01..\003 \00314ignores match relay reload save servers trace\003"
				putdcc $idx "\00301,01..\003 \00314traffic uptime userlist vcheck who whom\003"
				putdcc $idx ""
				putdcc $idx "\00301,01.\003\00308(master)\003 net commands:"
				putdcc $idx "\00301,01..\003 \00314massdevoice masskick massop massopall massvoice\003"
				putdcc $idx "\00301,01..\003 \00314takeover\003"
				putdcc $idx ""
			}
			if { [matchattr $handle o] } {
				# ops
				putdcc $idx "\00301,01.\003\00308(op)\003 commands:"
				putdcc $idx "\00301,01..\003 \00314+ban -ban +exempt -exempt +invite -invite\003"
				putdcc $idx "\00301,01..\003 \00314bans exempts invites stick unstick op\003"
				putdcc $idx ""
			}
			if { [matchattr $handle p] } {
				# users
				putdcc $idx "\00301,01.\003\00308(user)\003 commands:"
				putdcc $idx "\00301,01..\003 \00314about away back chat info newpass page quit sv\003"
				putdcc $idx "\00301,01..\003 \00314whoami version\003"
				putdcc $idx ""
			}
		} {
			*dcc:help $handle $idx $args
		}
	}
	# }}}
	# ak!ra: motd {{{
	proc display_motd { idx } {
		global botnick env server tcl_patchLevel tcl_platform uptime
		variable ::*akira::config::motd_userlist
		set chans {}
		foreach chan [channels] {
			if { ![botonchan $chan] } {
				# bot can't join channel
				lappend chans "\00305(${chan})\003"
			} elseif { ![botisop $chan] } {
				# bot has no ops in channel
				lappend chans "\00314${chan}\003"
			} {
				# bot has ops in channel
				lappend chans "\00310${chan}\003"
			}
		}
		set up [clock seconds]
		incr up -$uptime
		set utime [string map {" years" "y" " weeks" "w" " days" "d" " hours" "h" " minutes" "m" " seconds" "s" " year" "y" " week" "w" " day" "d" " hour" "h" " minute" "m" " second" "s"} [duration $up]]
		set fp [open "/etc/hostname" r]
		set hostname [read $fp]
		close $fp
		putdcc $idx "\00300▀\003▀\00314▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█\003"
		putdcc $idx "\00314█ \003\00310█▀█ █ ▄ ▀ █▀▄ █▀█ \003\00314█\003"
		putdcc $idx "\00314█ \00311,10░\003 \00311,10░\003 \00311,10░\003 \00311,10░\003 \00310█ \003\00311,10░\003 \00311,10▒\003 \00311,10░\003 \00310█\003 \00314█\003"
		putdcc $idx "\00314█ \00311,10▓\003 \00311█\003 \00311,10▓\003\00311▄▀\003 \00311,10▓\003 \00311█ █ █ \003\00311,10▓\003 \00314█\003"
		putdcc $idx "\00314█ \00311█▀█ █ █ █ █▀▄ █▀█ \003\00314█ bz!\003"
		putdcc $idx "\00314█▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄\003▄\00300▄\003"
		putdcc $idx ""
		putdcc $idx "\00301,01.\003bot: \00310[string tolower ${botnick}]\003  users: \00310[countusers]\003  server: \00310[string tolower ${server}]\003"
		putdcc $idx "\00301,01.\003channels: $chans"
		if { $motd_userlist == 1 } {
			set pusers {}
			set dccusers [whom 0]
			set deli {}
			if { [llength $dccusers] != 0 } {
				foreach dccuser $dccusers {
					set userhand [lindex $dccuser 0]
					if { [matchattr $userhand n] } {
						set userrank "\00304(owner)\003"
					} elseif { [matchattr $userhand m] } {
						set userrank "\00306(master)\003"
					} elseif { [matchattr $userhand t] } {
						set userrank "\00306(botmaster)\003"
					} elseif { [matchattr $userhand o] } {
						set userrank "(op)"
					} {
						set userrank "(user)"
					}
					lappend pusers "${deli}\002\00300${userhand}\002@[lindex $dccuser 1]\003 ${userrank}"
					set deli ", "
				}
				putdcc $idx "\00301,01.\003partyline users: $pusers"
			}
		}
		putdcc $idx ""
		putdcc $idx "\00301,01.\003running: \00310${::*akira::hcversion}\003 \00314(tcl/$tcl_patchLevel)\003"
		putdcc $idx "\00301,01.\003os: \00310[string tolower $tcl_platform(os)-$tcl_platform(osVersion)-$tcl_platform(machine)]\003"
		putdcc $idx "\00301,01.\003hostname: \00310${hostname}\003"
		putdcc $idx "\00301,01.\003uptime: \00310$utime\003"
		putdcc $idx ""
	}
	# }}}
	# ak!ra: default procs {{{
	proc _botlog { frombot command text } {
		global nicklen
		if { ${::*akira::ishub} } {
			set fromlen [expr {$nicklen + 2}]
			if { [string match *:* $text] } {
				set textlen [expr {$nicklen * 2 + 2}]
				set tmp [split $text :]
				set text1 "[lindex $tmp 0]:"
				set text2 [join [lrange $tmp 1 end]]
				putloglev 5 "*" [format "\[ak!ra\]  %-${fromlen}s  %-${textlen}s%s" "($frombot)" "$text1" "$text2"]
			} {
				putloglev 5 "*" [format "\[ak!ra\]  %-${fromlen}s  %s" "($frombot)" "$text"]
			}
		}
		return 0 ;# TCL_OK
	}
	proc botlog { text } {
		global botnet-nick
		if { ${::*akira::ishub} } {
			::*akira::_botlog ${botnet-nick} "akira_botlog" ${text}
		} else {
			putallbots "akira_botlog ${text}"
			#putlog "\00312DEBUG:\003 akira_botlog ${text}"
		}
		return 0 ;# TCL_OK
	}
	proc control_islocal {} {
		global botnick
		variable ::*akira::config::control
		if { $control == "*" } {
			return 1 ;# TRUE
		}
		if { [lsearch $control [string tolower $botnick]] != -1 } {
			return 1 ;# TRUE
		}
		return 0 ;# FALSE
	}
	proc countbots {} {
		global botnick
		variable ::*akira::config::control
		set bot_count 0
		if { $control == "*" } {
			foreach bot [userlist b] {
				if { [islinked $bot] || [string tolower $bot] == [string tolower $botnick] } {
					set bot_count [expr {$bot_count+1}]
				}
			}
		} {
			foreach bot $control {
				if { [islinked $bot] || [string tolower $bot] == [string tolower $botnick] } {
					set bot_count [expr {$bot_count+1}]
				}
			}
		}
		return $bot_count ;# INT
	}
	proc cmdlog { text } {
		if { [llength $text] == 0 } {
			return 2 ;# TCL_RETURN
		}
		set text [split $text "|"]
		set addtext {}
		if { [llength $text] > 2 } {
			set addtext "\00306[lindex $text 2]\003 "
		}
		putlog "\00307#[lindex $text 0]#\003 ${addtext}[lindex $text 1]"
		return 0 ;# TCL_OK
	}
	proc enterpass { idx args } {
		global botnick
		#regsub -all "\377\[\373-\376\].|\377." $args "" args
		#set args "[string range $args 0 14]"
		if { "[join $args]" == "" } { return 0 }
		putlog "encrypt: [join $args]"
		putlog "thekey: [decrypt [join $args] ${::*akira::config::securekey}]"
		if { "[join $args]" eq "[string trim [decrypt [join $args] [join ${::*akira::config::securekey}]]]" } {
			::*akira::display_motd $idx
			setchan $idx 1
			return 1
		}
		putdcc $idx "\00304ACCESS DENIED!\003"
		::*akira::output "secauth" "access denied \00304<[idx2hand $idx]@$botnick>\003"
		if { [catch { idx2hand $idx } handle] } { set handle "unknown" }
		if { [catch { idx2ip $idx } longip] } { set longip - }
		if { [catch { idx2host $idx } host] } { foreach w [dcclist] { if { $idx == [lindex $w 0] } { set host [lindex $w 2] } } }
		::*akira::botlog "login: !FAILED! ([join $args]): [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip)"
		killdcc $idx
		return 0 ;# TCL_OK
	}
	proc err { text } {
		if { ${text} eq "" } {
			return 2 ;# TCL_RETURN
		}
		putlog "\00304‼ ERROR:\003 ${text}"
		return 0 ;# TCL_OK
	}
	proc errdcc { idx text } {
		if { ${text} eq "" } {
			return 2 ;# TCL_RETURN
		}
		putdcc $idx "\00304‼ ERROR:\003 ${text}"
		return 0 ;# TCL_OK
	}
	proc iso8601 {} {
		set x [clock milliseconds]
		return [format "%s.%03dZ" [clock format [expr {$x / 1000}] -timezone :UTC -format {%Y-%m-%dT%H:%M:%S}] [expr {$x % 1000}]]
	}
	proc output { section text } {
		if { ${section} eq "" || ${text} eq "" } {
			warning "::*akira::output failure"
			return 2 ;# TCL_RETURN
		}
		putlog "\00311≡\003 ${section}: \00314${text}\003"
		return 0 ;# TCL_OK
	}
	proc outputdcc { idx section text } {
		if { ${section} eq "" && ${text} eq "" } {
			warning "::*akira::outputdcc failure"
			return 2 ;# TCL_RETURN
		} elseif { ${section} ne "" } {
			set section [string cat $section ": "]
		}
		putdcc $idx "\00311≡\003 ${section}\00314${text}\003"
		return 0 ;# TCL_OK
	}
	proc putcbot { nick msg } {
		#putlog "\00312DEBUG:\003 putbot $nick $msg"
		putbot $nick "$msg"
		return 0 ;# TCL_OK
	}
	proc putcbots { command args } {
		variable ::*akira::config::control
		if { $control == "*" } {
			#putlog "\00312DEBUG:\003 putallbot $command $args"
			putallbots "${command} ${args}"
			return 0 ;# TCL_OK
		} {
			foreach bot $control {
				if { [islinked $bot] } {
					#putlog "\00312DEBUG:\003 putbot $bot $command $args"
					putbot $bot "${command} ${args}"
				}
			}
			return 0 ;# TCL_OK
		}
	}
	proc ::putchan { chan {section "ak!ra"} text } {
		if { (${chan} eq "" && ${section} eq "" && ${text} eq "") || ![validchan $chan] } {
			warning "putchan failure"
			return 2 ;# TCL_RETURN
		}

		puthelp "PRIVMSG $chan :\00311≡\003 ${section}: \00314${text}\003"
		return 0 ;# TCL_OK
	}
	proc randomize_bots {} {
		return [::*akira::shuffle6 [bots]]
	}
	proc randomize_nicks { chan } {
		return [::*akira::shuffle6 [chanlist $chan]]
	}
	proc secureinit { event } {
		global botnet-nick botnick hub serveraddress
		putquick "MODE $botnick +i-wxs"
		if { ${::*akira::ishub} } {
			::*akira::bot::server ${botnet-nick} "akira_server" $serveraddress
		} {
			if { [islinked $hub] } {
				putbot $hub "akira_server $serveraddress"
			}
		}
		::*akira::setutimer [rand 5] { ::*akira::secureme }
		return 0 ;# TCL_OK
	}
	proc secureme {} {
		global botnet-nick botname listen-addr botport userport
		# make sure hub has its own user record
		if { ${::*akira::ishub} } {
			if { $botname eq ${botnet-nick} } {
				::*akira::setutimer [rand 5] { ::*akira::secureme }
				return 1 ;# TCL_ERROR
			}
			if { ![validuser ${botnet-nick}] } {
				addbot ${botnet-nick} ${listen-addr} +$botport +$userport
				setuser ${botnet-nick} HOSTS ${botname}
				chattr ${botnet-nick} +bfop${::*akira::config::control_flag}
				botattr ${botnet-nick} +h
				putlog "\00309□\003 securehub: \00314added bot \002${botnet-nick}\002\003"
			} {
				if { ![matchattr ${botnet-nick} +bfop${::*akira::config::control_flag}] } {
					chattr ${botnet-nick} +bfop${::*akira::config::control_flag}
					putlog "\00309□\003 securehub: \00314chattr \002${botnet-nick}\002\003 \00306<+bfop${::*akira::config::control_flag}>\003"
				}
				if { ![matchattr ${botnet-nick} ||+h] } {
					botattr ${botnet-nick} +h
					putlog "\00309□\003 securehub: \00314botattr \002${botnet-nick}\002\003 \00306<+h>\003"
				}
				set hosts [getuser ${botnet-nick} HOSTS]
				set hfound false
				foreach host $hosts {
					if { $botname eq $host } { set hfound true }
				}
				if { !$hfound } {
					setuser ${botnet-nick} HOSTS ${botname}
					putlog "\00309□\003 securehub: \00314addhost \002${botnet-nick}\002\003 \00306<$botname>\003"
				}
			}
		}
		return 0 ;# TCL_OK
	}
	proc settimer { minutes command } {
		set command "[join $command]"
		if { $minutes < 1 } { set minutes 1 }
		foreach t [timers] { if { [lindex $t 1] eq $command } { killtimer [lindex $t 2] } }
		timer $minutes [subst {$command}]
		return 0 ;# TCL_OK
	}
	proc setutimer { seconds command } {
		set command "[join $command]"
		if { $seconds < 1 } { set seconds 1 }
		foreach t [utimers] { if { [lindex $t 1] eq $command } { killutimer [lindex $t 2] } }
		utimer $seconds [subst {$command}]
		return 0 ;# TCL_OK
	}
	proc shuffle6 { list } {
		set n [llength $list]
		for { set i 1 } { $i < $n } { incr i } {
			set j [expr { int( rand() * $n ) }]
			set temp [lindex $list $i]
			lset list $i [lindex $list $j]
			lset list $j $temp
		}
		return $list
	}
	proc warning { text } {
		if { ${text} eq "" } {
			return 2 ;# TCL_RETURN
		}
		putlog "\00310! WARNING:\003 ${text}"
		return 0 ;# TCL_OK
	}
	proc warningdcc { idx text } {
		if { ${idx} eq "" && ${text} eq "" } {
			return 2 ;# TCL_RETURN
		}
		putdcc $idx "\00310! WARNING:\003 ${text}"
		return 0 ;# TCL_OK
	}
	proc xindex { xr xr1 } { return [join [lrange [split $xr] $xr1 $xr1]] }
	proc xrange { xr xr1 xr2 } { return [join [lrange [split $xr] $xr1 $xr2]] }
	proc xstrcmp { str1 str2 } {
		if { [string compare [string tolower $str1] [string tolower $str2]] == 0 } {
			return 1 ;# TCL_ERROR
		} {
			return 0 ;# TCL_OK
		}
	}
	# }}}
	# ak!ra: init {{{
	# register the tls socket with http as https
	http::register https 443 [list ::tls::socket -autoservername true]
	set hubtxt {}
	if { ${nick} == ${hub} } { set ::*akira::ishub 1;set hubtxt " \00310<hub mode>\003" }
	if { ${nick} == ${infobot} } { set ::*akira::isinfo 1;set hubtxt " \00310<info bot>\003" }
	::*akira::output "tribe9/akira.tcl" "v${::*akira::t9version}+${::*akira::version}\003 \00306<${::*akira::author}>${hubtxt}"
	catch { setudef flag crypto }
	catch { setudef flag limit }
	catch { setudef flag secure }
	catch { setudef flag youtube }
	catch { setudef flag www }
	if { ${::*akira::ishub} } {
		# hub bot
		logfile 5 * "${::*akira::config::logfile}"
		::*akira::setutimer 10 { ::*akira::time::hubcheckstat }
		if { [string length $server] > 0 } {
			::*akira::setutimer 8 { ::*akira::bot::server ${botnet-nick} "akira_server" $serveraddress }
		}
	} {
		# leaf bots
		if { [islinked $hub] } {
			::*akira::setutimer 8 {putbot $hub \"akira_server $serveraddress\"}
		}
	}
	# mod versions
	::*akira::output "blowcrypt.tcl" "${blowcrypt_version} \00306<poci/PPX>\003"
	::*akira::output "tmon.tcl" "${tmon_version} \00306<stran9er>\003"
	# general maintenance
	if {![info exists passive]} { uplevel #0 {set passive 0} }
	if {![info exists oldpassive]} { uplevel #0 {set oldpassive $passive} }
	::*akira::setutimer 2 { ::*akira::bot::bop_clearneeds }
	# port setup
	if { !${::*akira::ishub} && ![matchattr ${botnet-nick} a] && ![matchattr ${botnet-nick} h] } {
		set userport [expr {$userport + 1}]
		listen +$userport users
	} {
		listen +$botport all
	}
	# if userfile doesn't exist, try to restore from backup
	if { ![file exists $userfile] } { if { [file exists ${userfile}~bak] } { exec /bin/cp ${userfile}~bak $userfile } }
	if { ![info exists main_config] } {
		if { [userlist n] eq "" } { die "no main_config variable is set in main config, die..." }
		warning "no main_config variable is set!"
	}
	if { !${::*akira::ishub} && ![matchattr ${botnet-nick} h] && ![matchattr ${botnet-nick} a] } {
		unbind dcc - unlink *dcc:unlink
		bind dcc n unlink ::*akira::dccunlink
		proc dccunlink { args } { putallbots "noop \nbye" }
	}
	# load blowcrypt module
	uplevel #0 { set bc_enabled 0 }
	global bc_enabled
	catch { load [file join [pwd] modules/dh1080.so] } dherr
	if { [string length $dherr] > 0 } {
		::*akira::err "$dherr"
		::*akira::warning "blowcrypt: keyexchange is disabled"
	} {
		set bc_enabled 1
	}
	# load external files if they exist
	set stcls {}
	catch { set stcls [glob -types f "*-secure.tcl"] }
	if { [llength $stcls] > 0 } {
		foreach stcl $stcls {
			if { [file exists $stcl] } {
				hcsource $stcl
			}
		}
	}
	# }}}
	# ak!ra: binds {{{
	catch { unbind dcc lo|lo +ban *dcc:+ban }
	catch { unbind dcc n|- +bot *dcc:+bot }
	catch { unbind dcc o|o act *dcc:act }
	catch { unbind dcc m|- bots *dcc:bots }
	catch { unbind dcc -|- help *dcc:help }
	catch { unbind dcc o|- msg *dcc:msg }
	catch { unbind dcc o|o op *dcc:op }
	catch { unbind dcc o|o say *dcc:say }
	catch { unbind dcc o|- servers *dcc:servers }
	catch { unbind dcc n|- status *dcc:status }
	catch { unbind dcc -|- whom *dcc:whom }

	catch { unbind msg -|- +host *msg:+host }
	catch { unbind msg -|- +op *msg:+op }

	catch { unbind ctcp -|- TIME *ctcp:TIME }
	catch { unbind ctcp -|- CLIENTINFO *ctcp:CLIENTINFO }
	catch { unbind ctcp -|- USERINFO *ctcp:USERINFO }
	catch { unbind ctcp -|- VERSION *ctcp:VERSION }
	catch { unbind ctcp -|- ERRMSG *ctcp:ERRMSG }
	catch { unbind ctcp -|- PING *ctcp:PING }
	catch { unbind ctcp -|- ECHO *ctcp:ECHO }
	catch { unbind ctcp -|- FINGER *ctcp:FINGER }

	# BOT - triggered by a message coming from another bot in the botnet
	bind bot - akira_botlog ::*akira::_botlog
	bind bot - akira_checkstat ::*akira::bot::checkstat
	bind bot - akira_checkuser ::*akira::bot::checkuser
	bind bot - akira_joinkey ::*akira::bot::bop_joinkey
	bind bot - akira_needinvite ::*akira::bot::bop_botwantsin
	bind bot - akira_needkey ::*akira::bot::bop_botwantsin
	bind bot - akira_needlimit ::*akira::bot::bop_botwantsin
	bind bot - akira_needop ::*akira::bot::bop_needop
	bind bot - akira_needopack ::*akira::bot::bop_needopack
	bind bot - akira_needunban ::*akira::bot::bop_botwantsin
	bind bot - akira_net ::*akira::bot::botnet
	bind bot - akira_netchans ::*akira::bot::netchans
	bind bot - akira_onchans ::*akira::bot::onchans
	bind bot - akira_opcheck ::*akira::bot::opcheck
	bind bot - akira_opjoin ::*akira::bot::opjoin
	bind bot - akira_reqop ::*akira::bot::bop_reqtimer
	bind bot - akira_server ::*akira::bot::server
	bind bot - akira_uname ::*akira::bot::uname
	bind bot - akira_vcheck ::*akira::bot::extcheck
	bind bot - akira_vcheck_ack ::*akira::bot::extcheckack
	# CHOF (stackable) - triggered when a user disconnects from the bot
	bind chof - * ::*akira::events::userdisc
	# CHON (stackable) - triggered when someone enters the party-line (dcc or telnet)
	bind chon - * ::*akira::events::chon
	# CTCP (stackable) - triggered on incoming user/channel ctcp event
	bind ctcp - action ::*akira::ctcp::ctcpreply
	bind ctcp - chops ::*akira::ctcp::ctcpreply
	bind ctcp - clientinfo ::*akira::ctcp::ctcpreply
	bind ctcp - errmsg ::*akira::ctcp::ctcpreply
	bind ctcp - echo ::*akira::ctcp::ctcpreply
	bind ctcp - finger ::*akira::ctcp::ctcpreply
	bind ctcp - help ::*akira::ctcp::ctcpreply
	bind ctcp - invite ::*akira::ctcp::ctcpreply
	bind ctcp - op ::*akira::ctcp::ctcpreply
	bind ctcp - open ::*akira::ctcp::ctcpreply
	bind ctcp - ops ::*akira::ctcp::ctcpreply
	bind ctcp - page ::*akira::ctcp::ctcpreply
	bind ctcp - ping ::*akira::ctcp::ctcpreply
	bind ctcp - send ::*akira::ctcp::ctcpreply
	bind ctcp - time ::*akira::ctcp::ctcpreply
	bind ctcp - unban ::*akira::ctcp::ctcpreply
	bind ctcp - uptime ::*akira::ctcp::ctcpreply
	bind ctcp - userinfo ::*akira::ctcp::ctcpreply
	bind ctcp - utc ::*akira::ctcp::ctcpreply
	bind ctcp - ver ::*akira::ctcp::ctcpreply
	bind ctcp - version ::*akira::ctcp::ctcpreply
	bind ctcp - voice ::*akira::ctcp::ctcpreply
	bind ctcp - whoami ::*akira::ctcp::ctcpreply
	bind ctcp - xdcc ::*akira::ctcp::ctcpreply
	# DCC - used for partyline commands
	bind dcc lo|lo +ban ::*akira::dcc::+ban
	bind dcc n|- +bot ::*akira::dcc::+bot
	bind dcc n|- +user ::*akira::dcc::+user
	bind dcc p|- about ::*akira::dcc::about
	bind dcc n|- act *dcc::act
	bind dcc -|- akira ::*akira::help
	bind dcc m|- autoaway ::*akira::dcc::autoaway
	bind dcc n|- botnick ::*akira::dcc::dccbotnick
	bind dcc m|- botnet ::*akira::dcc::botnet
	bind dcc m|- bots ::*akira::dcc::dccbots
	bind dcc n|- botstat ::*akira::dcc::botstat
	bind dcc n|- channels ::*akira::dcc::dccchannels
	bind dcc m|m dolimit ::*akira::limit::dcc_dolimit
	bind dcc -|- help ::*akira::help
	bind dcc m|m hostcheck ::*akira::dcc::hostcheck
	bind dcc n|- kill ::*akira::dcc::dcckill
	bind dcc n|- msg *dcc::msg
	bind dcc n|- net ::*akira::dcc::botnet
	bind dcc -|- op ::*akira::dcc::op
	bind dcc n|- say *dcc::say
	bind dcc n|- servers ::*akira::dcc::serverlist
	bind dcc n|- status ::*akira::dcc::status
	bind dcc p|- sv ::*akira::dcc::about
	bind dcc n|- uname ::*akira::dcc::uname
	bind dcc m|m userlist ::*akira::dcc::dccuserlist
	bind dcc m|- vcheck ::*akira::dcc::vcheck
	bind dcc p|- version ::*akira::dcc::aversion
	bind dcc m|m whom ::*akira::dcc::dccwhom
	# DISC (stackable) - triggered when a bot disconnects from the botnet
	bind disc - * ::*akira::events::botdisc
	# EVNT (stackable) - triggered when an event happens {{{
	#   sighup            - called on a kill -HUP <pid>
	#   sigterm           - called on a kill -TERM <pid>
	#   sigill            - called on a kill -ILL <pid>
	#   sigquit           - called on a kill -QUIT <pid>
	#   save              - called when the userfile is saved
	#   rehash            - called just after a rehash
	#   prerehash         - called just before a rehash
	#   prerestart        - called just before a restart
	#   logfile           - called when the logs are switched daily
	#   loaded            - called when the bot is done loading
	#   userfile-loaded   - called after userfile has been loaded
	#   connect-server    - called just before we connect to an IRC server
	#   preinit-server    - called immediately when we connect to the server
	#   init-server       - called when we actually get on our IRC server
	#   disconnect-server - called when we disconnect from our IRC server
	#   fail-server       - called when an IRC server fails to respond
	#   loadchannels      - called when the bot loads the chanfile
	#   savechannels      - called when the bot saves the chanfile
	#   reload            - called when the bot issues a reload
	#   }}}
	bind evnt - init-server ::*akira::secureinit
	# FILT (stackable) - filter through bot user input (dcc/telnet)
	bind filt - .chatt* ::*akira::filt::chattr
	# JOIN (stackable) - triggered by someone joining the channel
	bind join -|- * ::*akira::bot::bop_jointimer
	bind join -|- * ::*akira::bot::secureopjoin
	# LINK (stackable) - triggered when a bot links into the botnet
	bind link - * ::*akira::events::botlink
	# MODE (stackable) - triggered by channel/server mode changes
	if { ${::*akira::config::bop_modeop} } { bind mode - * ::*akira::bot::bop_modeop }
	bind mode - * ::*akira::bot::modeverify
	bind mode - "* ?l" ::*akira::limit::check
	# MSG - used for /msg commands
	bind msg -|- +op ::*akira::msg::op
	# NEED (stackable) - triggered when the bot needs: op, unban, invite, limit, or key
	bind need - * ::*akira::bot::bop_reqop
	# PART (stackable) - triggered by someone leaving the channel
	bind part - * ::*akira::bot::bop_unsetneed
	# RAW (stackable) - triggered on raw server output
	bind raw - 352 ::*akira::bot::bop_who
	bind raw - MODE ::*akira::bot::raw_modeverify
	# TIME (stackable) - allows you to schedule procedure calls at certain times
	bind time - "57 * * * *" ::*akira::time::keeplinked
	bind time - "30 * * * *" ::*akira::time::checkstattimer
	bind time - "* * * * *" ::*akira::time::dccidlekick
	bind time - "42 * * * *" ::*akira::tmon::tmontimer
	# ak!ra: binds: mods {{{
	# mod - blowcrypt
	bind pub -|- +OK ::*akira::blowcrypt::onencryptedtext
	if { $bc_enabled } {
		bind msg -|- +OK ::*akira::blowcrypt::onencryptedmsg
		bind msg -|- !bckeydel ::*akira::blowcrypt::bckeydel
		bind pub n|- %verify ::*akira::blowcrypt::test
		bind nick -|- * ::*akira::blowcrypt::keyexnick
		bind notc - "DH1080_INIT *" ::*akira::blowcrypt::onkeyexchangeinit
		bind notc - "DH1080_FINISH *" ::*akira::blowcrypt::onkeyexchangefinish
	}
	# mod - crypto
	if { ${::*akira::isinfo} } {
		bind pub -|- !btc ::*akira::crypto::handlerbtc
		bind pub -|- !eth ::*akira::crypto::handlereth
		bind pub -|- !xbt ::*akira::crypto::handlerbtc
	}
	# mod - trace monitor
	if { ${::*akira::ishub} } { bind bot - akira_trace ::*akira::tmon::botcmd }
	# mod - www
	if { ${::*akira::isinfo} } {
		bind pubm -|- {*://*} ::*akira::www::handler
	}
	# mod - youtube
	if { ${::*akira::isinfo} } {
		bind pubm -|- "*youtube.*watch?v=*" ::*akira::youtube::handler
		bind pubm -|- "*youtu.be/*" ::*akira::youtube::handler
	}
	# }}}
	# }}}
	# ak!ra: binds (bot) {{{
	namespace eval bot {
		proc bop_askbot { handle chan } {
			global botnick
			set stlchan [string tolower $chan]
			if { [info exists ::*akira::bop_asktimer($handle:$stlchan)] } {
				unset ::*akira::bop_asktimer($handle:$stlchan)
			}
			if { ![validchan $chan] || ![botonchan $chan] || ![botisop $chan] } { return 1 }
			if { ![matchattr $handle b] || ![matchattr $handle o|o $chan] || [matchattr $handle d|d $chan] } { return 1 }
			if { ![islinked $handle] } { return 1 }
			::*akira::putcbot $handle "akira_needop $chan $botnick"
			return 0 ;# TCL_OK
		}
		proc bop_botwantsin { frombot command args } {
			set chan [lindex [join $args] 0]
			if { ![validchan $chan] } { return 1 }
			if { ![matchattr $frombot b] || ![matchattr $frombot fo|fo $chan] } { return 1 }
			set fromhost [lindex [join $args] 2]
			set command [lindex [split $command _] 1]
			#putlog "\00312DEBUG:\003 bop_botwantsin $frombot $command $chan"
			switch -exact -- $command {
				"needkey" {
					if { [string match *k* [lindex [split [getchanmode $chan]] 0]] } {
						::*akira::putcbot $frombot "akira_joinkey $chan [lindex [split [getchanmode $chan]] 1]"
						if { [set ::*akira::config::loglevel] >= 1 } {
							::*akira::botlog "gave key: ${chan}: $frombot $fromhost <+[botattr $frombot]> [getuser $frombot BOTADDR]"
						}
					}
				}
				"needinvite" {
					if { ![botisop $chan] } { return 1 }
					set fromnick [lindex [join $args] 1]
					if { [set ::*akira::config::bop_icheck] && $fromhost ne "" } {
						if { ![info exists ::*akira::config::bop_who($fromnick)] } {
							set ::*akira::config::bop_who($fromnick) "$chan $frombot $fromhost"
							::*akira::setutimer 60 [split "::*akira::bot::bop_whounset $fromnick"]
						}
						putserv "WHO $fromnick"
					} {
						putserv "INVITE $fromnick $chan"
						if { [set ::*akira::config::loglevel] >= 1 } {
							if { $fromnick ne $frombot } {
								::*akira::botlog "gave invite: ${chan}: $frombot $fromhost (${fromnick}) <+[botattr $frombot]> [getuser $frombot BOTADDR]"
							} {
								::*akira::botlog "gave invite: ${chan}: $frombot $fromhost <+[botattr $frombot]> [getuser $frombot BOTADDR]"
							}
						}
					}
				}
				"needlimit" {
					if { ![botisop $chan] } { return 1 }
					putserv "MODE $chan +l [expr {[llength [chanlist $chan]] +1}]"
					if { [set ::*akira::config::loglevel] >= 1 } {
						::*akira::botlog "gave limit incr: ${chan}: $frombot $fromhost"
					}
				}
				"needunban" {
					if { ![botisop $chan] } { return 1 }
					foreach ban [chanbans $chan] {
						if { [string match [string tolower [lindex $ban 0]] [string tolower $fromhost]] } {
							putserv "MODE $chan -b [lindex $ban 0]"
							if { [set ::*akira::config::loglevel] >= 1 } {
								::*akira::botlog "gave unban: ${chan}: $frombot $fromhost <+[botattr $frombot]> [getuser $frombot BOTADDR]"
							}
						}
					}
				}
			}
			return 0 ;# TCL_OK
		}
		proc bop_clearneeds {} {
			foreach chan [channels] {
				channel set $chan need-invite ""
				channel set $chan need-key ""
				channel set $chan need-limit ""
				channel set $chan need-op ""
				channel set $chan need-unban ""
			}
			::*akira::bot::bop_settimer
		}
		proc bop_joinkey { frombot command args } {
			set chan [lindex [join $args] 0]
			set stlchan [string tolower $chan]
			if { [botonchan $chan] || [set ::*akira::config::bop_kjoin($stlchan)] } { return 1 }
			putserv "JOIN $chan [lindex [join $args] 1]"
			set ::*akira::config::bop_kjoin($stlchan) true
			::*akira::setutimer 10 [split "set ::*akira::config::bop_kjoin($stlchan) false"]
			return 0 ;# TCL_OK
		}
		proc bop_jointimer { nick userhost handle chan } {
			global botnick
			if { $nick ne $botnick } {
				if { ![matchattr $handle b] || ![matchattr $handle o|o $chan] || [matchattr $handle d|d $chan] } { return 1 }
				set stlchan [string tolower $chan]
				if { [info exists ::*akira::bop_asktimer($handle:$stlchan)] } { return 1 }
				set ::*akira::bop_asktimer($handle:$stlchan) true
				if { ![set ::*akira::config::bot_delay] || [::*akira::bot::bop_lowbots $chan] } {
					::*akira::setutimer 5 [split "::*akira::bot::bop_askbot $handle $chan"]
				} {
					::*akira::setutimer [expr {[rand ${::*akira::config::bot_delay}] + 5}] [split "::*akira::bot::bop_askbot $handle $chan"]
				}
			} {
				::*akira::bot::bop_setneed $chan
			}
			return 0 ;# TCL_OK
		}
		proc bop_letmein { chan need } {
			#putlog "\00312DEBUG:\003 bop_letmein $chan $need"
			global botname botnick
			variable ::*akira::config::loglevel
			if { [llength [bots]] == 0 || [botonchan $chan] } { return 1 }
			set stlchan [string tolower $chan]
			set reqlist {}
			switch -exact -- $need {
				"key" {
					if { [set ::*akira::config::bop_needk($stlchan)] } { return 1 }
					foreach bot [bots] {
						if { ![matchattr $bot b] || ![matchattr $bot o|o $chan] } { continue }
						::*akira::putcbot $bot "akira_needkey $chan $botnick"
						lappend reqlist $bot
					}
					if { $loglevel >= 1 && $reqlist ne "" } {
						regsub -all -- " " [join $reqlist] ", " reqlist
						::*akira::botlog "need key: ${chan}: $reqlist"
					}
					set ::*akira::config::bop_needk($stlchan) true
					::*akira::setutimer 30 [split "set ::*akira::config::bop_needk($stlchan) false"]
				}
				"invite" {
					if { [set ::*akira::config::bop_needi($stlchan)] } { return 1 }
					foreach bot [bots] {
						if { ![matchattr $bot b] || ![matchattr $bot o|o $chan] } { continue }
						if { $botname ne "" } {
							::*akira::putcbot $bot "akira_needinvite $chan $botnick [string trimleft [lindex [split $botname !] 1] "~+-^="]"
						} {
							::*akira::putcbot $bot "akira_needinvite $chan $botnick"
						}
						lappend reqlist $bot
					}
					if { $loglevel >= 1 && $reqlist ne "" } {
						regsub -all -- " " [join $reqlist] ", " reqlist
						::*akira::botlog "need invite: ${chan}: $reqlist"
					}
					set ::*akira::config::bop_needi($stlchan) true
					::*akira::setutimer 30 [split "set ::*akira::config::bop_needi($stlchan) false"]
				}
				"limit" {
					if { [set ::*akira::config::bop_needl($stlchan)] } { return 1 }
					foreach bot [bots] {
						if { ![matchattr $bot b] || ![matchattr $bot o|o $chan] } { continue }
						::*akira::putcbot $bot "akira_needlimit $chan $botnick"
						lappend reqlist $bot
					}
					if { $loglevel >= 1 && $reqlist ne "" } {
						regsub -all -- " " [join $reqlist] ", " reqlist
						::*akira::botlog "need limit: ${chan}: $reqlist"
					}
					set ::*akira::config::bop_needl($stlchan) true
					::*akira::setutimer 30 [split "set ::*akira::config::bop_needl($stlchan) false"]
				}
				"unban" {
					if { [set ::*akira::config::bop_needu($stlchan)] } { return 1 }
					foreach bot [bots] {
						if { ![matchattr $bot b] || ![matchattr $bot o|o $chan] } { continue }
						::*akira::putcbot $bot "akira_needunban $chan $botnick $botname"
						lappend reqlist $bot
					}
					if { $loglevel >= 1 && $reqlist ne "" } {
						regsub -all -- " " [join $reqlist] ", " reqlist
						::*akira::botlog "need unban: ${chan}: $reqlist"
					}
					set ::*akira::config::bop_needu($stlchan) true
					::*akira::setutimer 30 [split "set ::*akira::config::bop_needu($stlchan) false"]
				}
			}
			return 0 ;# TCL_OK
		}

		proc bop_linkreq {} {
			foreach chan [channels] {
				if { ![botisop $chan] } {
					::*akira::bot::bop_reqop $chan op
				}
			}
			return 0 ;# TCL_OK
		}
		proc bop_lowbots { chan } {
			global botnick
			set cbots 1
			foreach bot [chanlist $chan b] {
				if { $bot ne $botnick && [isop $bot $chan] } {
					incr cbots
				}
			}
			if { $cbots < 3 } { return 1 }
			return 0 ;# TCL_OK
		}
		if { ${::*akira::config::bop_modeop} } {
			proc bop_modeop { nick userhost handle chan mode opped } {
				global botnick
				if { $mode eq "+o" && ![botisop $chan] && $nick ne $botnick && $opped ne $botnick && [matchattr [set obot [nick2hand $opped $chan]] b] && [matchattr $obot o|o $chan] && [islinked $obot] } {
					::*akira::putcbot $obot "akira_reqop $chan"
				}
				return 0 ;# TCL_OK
			}
		}
		proc bop_needopack { frombot command args } {
			global akiraopcheck botnick strict-host
			variable ::*akira::config::bop_addhost
			variable ::*akira::config::bop_osync
			set chan [lindex [join $args] 0]
			set fromnick [lindex [join $args] 1]
			set fromhost [lindex [join $args] 2]
			if { ![botonchan $chan] || ![botisop $chan] } { return 1 }
			if { ![onchan $fromnick $chan] || [onchansplit $fromnick $chan] } { return 1 }
			if { ![matchattr $frombot b] || ![matchattr $frombot o|o $chan] || [matchattr $frombot d|d $chan] } { return 1 }
			if { $fromhost ne "" && $fromhost ne [string trimleft [getchanhost $fromnick $chan] "~+-^="] } { return 1 }
			if { ![matchattr [nick2hand $fromnick $chan] o|o $chan] } {
				if { $fromhost eq "" || !$bop_addhost } { return 1 }
				if { ${strict-host} == 0 } {
					set host *![string trimleft [getchanhost $fromnick $chan] "~+-^="]
				} {
					set host *![getchanhost $fromnick $chan]
				}
				setuser $frombot HOSTS $host
				::*akira::botlog "addhost: ${frombot}: ${host} <+[botattr $frombot]> [getuser $frombot BOTADDR]"
				::*akira::output "net addhost" "${host} added to ${frombot}"
			}
			set hex [::*akira::net::encryptop $fromhost $fromnick]
			putallbots "akira_opcheck $fromnick $hex"
			#putlog "\00312DEBUG:\003 akira_opcheck $fromnick $hex"
			set akiraopcheck($botnick$fromnick) $hex
			if { $bop_osync } {
				utimer 5 "putquick \"MODE $chan +o-b $fromnick *!$frombot@$hex\""
			} {
				if { [isop $fromnick $chan] } { return 1 }
				utimer 5 "putquick \"MODE $chan +o-b $fromnick *!$frombot@$hex\""
			}
			if { [set ::*akira::config::loglevel] >= 2 } {
				if { $fromnick ne $frombot } {
					::*akira::botlog "secauth op: [list ${frombot}!${fromhost}] <+[botattr $frombot]> [getuser $frombot BOTADDR] [list $chan]"
				} {
					::*akira::botlog "secauth op: [list ${fromnick}!${fromhost}] <+[botattr $frombot]> [getuser $frombot BOTADDR] [list $chan]"
				}
			}
			return 0 ;# TCL_OK
		}
		proc bop_needop { frombot command args } {
			global botname botnick
			variable ::*akira::config::loglevel
			variable ::*akira::config::bot_maxreq
			variable ::*akira::config::bop_opreqs
			set chan [lindex [join $args] 0]
			set fromnick [lindex [join $args] 1]
			if { ![validchan $chan] || ![botonchan $chan] || [botisop $chan] } { return 1 }
			set stlchan [string tolower $chan]
			if { $bot_maxreq && [set ::*akira::config::bop_opreqs($stlchan)] >= $bot_maxreq } { return 1 }
			if { ![onchan $fromnick $chan] || [onchansplit $fromnick $chan] || ![isop $fromnick $chan] } { return 1 }
			if { ![matchattr [nick2hand $fromnick $chan] o|o $chan] } { return 1 }
			if { ![islinked $frombot] } { return 1 }
			::*akira::putcbot $frombot "akira_needopack $chan $botnick [string trimleft [lindex [split $botname !] 1] "~+-^="]"
			incr ::*akira::config::bop_opreqs($stlchan)
			if { $bot_maxreq } {
				::*akira::setutimer 30 [split "::*akira::bot::bop_opsreqsreset $stlchan"]
			}
			return 0 ;# TCL_OK
		}
		proc bop_opsreqsreset { stlchan } {
			set ::*akira::config::bop_opreqs($stlchan) 0
			return 0 ;# TCL_OK
		}
		proc bop_reqop { chan need } {
			if { ![info exists ::*akira::config::bop_needi([string tolower $chan])] } {
				::*akira::bot::bop_setneed $chan
			}
			if { $need eq "op" } {
				foreach bot [chanlist $chan b] {
					if { [isop $bot $chan] && [matchattr [set hand [nick2hand $bot $chan]] o|o $chan] && [islinked $hand] } {
						::*akira::output "op!req" "$chan \00306($hand)\003"
						::*akira::putcbot $hand "akira_reqop $chan"
					}
				}
			} {
				::*akira::bot::bop_letmein $chan $need
			}
			return 0 ;# TCL_OK
		}
		proc bop_reqtimer { frombot command args } {
			set chan [lindex [join $args] 0]
			if { ![validchan $chan] } { return 1 }
			if { ![matchattr $frombot b] || ![matchattr $frombot o|o $chan] || [matchattr $frombot d|d $chan] } { return 1 }
			set stlchan [string tolower $chan]
			if { [info exists ::*akira::bop_asktimer($frombot:$stlchan)] } { return 1 }
			set ::*akira::bop_asktimer($frombot:$stlchan) true
			if { !${::*akira::config::bot_delay} || [::*akira::bot::bop_lowbots $chan] } {
				::*akira::setutimer 2 [split "::*akira::bot::bop_askbot $frombot $chan"]
			} {
				::*akira::setutimer [expr {[rand ${::*akira::config::bot_delay}] + 2}] [split "::*akira::bot::bop_askbot $frombot $chan"]
			}
			return 0 ;# TCL_OK
		}
		proc bop_setneed { chan } {
			set stlchan [string tolower $chan]
			set ::*akira::config::bop_opreqs($stlchan) 0
			set ::*akira::config::bop_kjoin($stlchan) false
			set ::*akira::config::bop_needk($stlchan) false
			set ::*akira::config::bop_needi($stlchan) false
			set ::*akira::config::bop_needl($stlchan) false
			set ::*akira::config::bop_needu($stlchan) false
			return 0 ;# TCL_OK
		}
		proc bop_settimer {} {
			foreach chan [channels] {
				::*akira::bot::bop_setneed $chan
			}
			::*akira::settimer 5 ::*akira::bot::bop_settimer
			return 0 ;# TCL_OK
		}
		proc bop_unsetneed { nick userhost handle chan {msg ""} } {
			global botnick
			if { $nick eq $botnick && ![validchan $chan] } {
				set stlchan [string tolower $chan]
				catch { unset ::*akira::config::bop_opreqs($stlchan) ::*akira::config::bop_kjoin($stlchan) }
				catch { unset ::*akira::config::bop_needk($stlchan) ::*akira::config::bop_needi($stlchan) }
				catch { unset ::*akira::config::bop_needl($stlchan) ::*akira::config::bop_needu($stlchan) }
			}
			return 0 ;# TCL_OK
		}
		proc bop_who { frombot command args } {
			set fromnick [lindex [join $args] 5]
			if { [info exists ::*akira::config::bop_who($fromnick)] } {
				set chan [lindex [split [set ::*akira::config::bop_who($fromnick)]] 0]
				set frombot [lindex [split [set ::*akira::config::bop_who($fromnick)]] 1]
				set fromhost [lindex [split [set ::*akira::config::bop_who($fromnick)]] 2]
				catch { unset ::*akira::config::bop_who($fromnick) }
				if { $fromhost eq [string trimleft [lindex [split $args] 2]@[lindex [split $args] 3] "~+-^="] } {
					putserv "INVITE $fromnick $chan"
					if { [set ::*akira::config::loglevel] >= 1 } {
						if { $fromnick ne $frombot } {
							::*akira::botlog "invite: ${chan}: $frombot $fromhost (${fromnick}) <+[botattr $frombot]> [getuser $frombot BOTADDR]"
						} {
							::*akira::botlog "invite: ${chan}: $frombot $fromhost <+[botattr $frombot]> [getuser $frombot BOTADDR]"
						}
					}
				}
			}
			return 0 ;# TCL_OK
		}
		proc bop_whounset { fromnick } {
			if { [info exists ::*akira::config::bop_who($fromnick)] } {
				catch { unset ::*akira::config::bop_who($fromnick) }
			}
			return 0 ;# TCL_OK
		}
		proc botnet { frombot command args } {
			global botnick botnet-nick infobot
			set args [lindex $args 0]
			set handle [lindex $args end]
			set mode [lindex $args 0]
			if { ![matchattr $frombot b] } {
				::*akira::err "unknown ${handle}@${frombot} asked for ${command} ${args} (ignored)"
				return 1 ;# TCL_ERROR
			}
			switch -exact $mode {
				"takeover" {
					set chan [lindex $args 1]
					if { ![validchan $chan] } {	return 1 }
					::*akira::net::takeover $chan
					::*akira::botlog "net takeover: ${chan}: <${handle}@${frombot}> <+[botattr $frombot]> [getuser $frombot BOTADDR]"
					return 0 ;# TCL_OK
				}
				"masskick" {
					set chan [lindex $args 1]
					if { ![validchan $chan] } { return 1 }
					::*akira::setutimer 1 {::*akira::net::masskick $chan}
					::*akira::botlog "net masskick: ${chan}: <${handle}@${frombot}> <+[botattr $frombot]> [getuser $frombot BOTADDR]"
					return 0; # TCL_OK
				}
				"massop" {
					set chan [lindex $args 1]
					if { ![validchan $chan] } { return 1 }
					::*akira::setutimer 1 {::*akira::net::massop $chan}
					::*akira::botlog "net massop: ${chan}: <${handle}@${frombot}> <+[botattr $frombot]> [getuser $frombot BOTADDR]"
					return 0; # TCL_OK
				}
				"massopall" {
					set chan [lindex $args 1]
					if { ![validchan $chan] } { return 1 }
					::*akira::setutimer 1 {::*akira::net::massopall $chan}
					::*akira::botlog "net massopall: ${chan}: <${handle}@${frombot}> <+[botattr $frombot]> [getuser $frombot BOTADDR]"
					return 0; # TCL_OK
				}
				"massvoice" {
					set chan [lindex $args 1]
					if { ![validchan $chan] } { return 1 }
					::*akira::setutimer 1 {::*akira::net::massvoice $chan}
					::*akira::botlog "net massvoice: ${chan}: <${handle}@${frombot}> <+[botattr $frombot]> [getuser $frombot BOTADDR]"
					return 0; # TCL_OK
				}
				"massdevoice" {
					set chan [lindex $args 1]
					if { ![validchan $chan] } { return 1 }
					::*akira::setutimer 1 {::*akira::net::massdevoice $chan}
					::*akira::botlog "net massdevoice: ${chan}: <${handle}@${frombot}> <+[botattr $frombot]> [getuser $frombot BOTADDR]"
					return 0; # TCL_OK
				}
				"join" {
					set chan [lindex $args 1]
					if { ![validchan $chan] } {
						catch { channel add $chan }
						catch { channel set $chan +limit +secure }
						if { $infobot eq ${botnet-nick} } {
							catch { channel set $chan +crypto +www +youtube }
						}
						::*akira::botlog "net join: ${chan}: <${handle}@${frombot}> <+[botattr $frombot]> [getuser $frombot BOTADDR]"
						return 0 ;# TCL_OK
					}
					return 1 ;# TCL_ERROR
				}
				"part" {
					set chan [lindex $args 1]
					if { ![validchan $chan] } { return 1 }
					catch { channel remove $chan }
					::*akira::botlog "net part: ${chan}: <${handle}@${frombot}> <+[botattr $frombot]> [getuser $frombot BOTADDR]"
					return 0 ;# TCL_OK
				}
				"chanset" {
					set chan [lindex $args 1]
					if { ![validchan $chan] } { return 1 }
					set arglist [llength $args]
					set settings [lrange $args 2 [expr {$arglist-2}]]
					catch { channel set $chan $settings }
					::*akira::botlog "net chanset: ${chan} => ${settings}: <${handle}@${frombot}> <+[botattr $frombot]> [getuser $frombot BOTADDR]"
					return 0 ;# TCL_OK
				}
				"chankey" {
					set chan [lindex $args 1]
					if { ![validchan $chan] } { return 1 }
					set key [lindex $args 2]
					putserv "JOIN $chan $key"
					::*akira::botlog "net chankey: ${chan} (*****): <${handle}@${frombot}> <+[botattr $frombot]> [getuser $frombot BOTADDR]"
					return 0 ;# TCL_OK
				}
				"jump" {
					foreach chan [channels] {
						set chanops 0
						foreach nick [string tolower [chanlist $chan]] {
							if { $nick eq $botnick } { continue }
							if { [isop $nick $chan] } { incr chanops }
						}
						if {[botisop $chan] && !$chanops} {
							dccbroadcast "net jump: last op on $chan skipping jump..."
							return 0 ;# TCL_OK
						}
					}
					jump
					::*akira::botlog "net jump: <${handle}@${frombot}> <+[botattr $frombot]> [getuser $frombot BOTADDR]"
					return 0 ;# TCL_OK
				}
				"save" {
					save
					::*akira::botlog "net save: <${handle}@${frombot}> <+[botattr $frombot]> [getuser $frombot BOTADDR]"
					return 0 ;# TCL_OK
				}
				"rehash" {
					rehash
					::*akira::botlog "net rehash: <${handle}@${frombot}> <+[botattr $frombot]> [getuser $frombot BOTADDR]"
					return 0 ;# TCL_OK
				}
			}
		}
		proc checkstat { frombot command args } {
			global hub
			if { ${::*akira::ishub} } {
				set hubstatline {}
				catch {
					set f [open ".stats" a+]
					seek $f 0
					while { [gets $f line] >= 0 } {
						if { [llength $line] > 0 } {
							set hubstatline $line
							break
						}
					}
					close $f
				}
				if { [join $args] eq $hubstatline } {
					::*akira::output "secauth" "stats verified \00310<${frombot}>\003"
					return 0 ;# TCL_OK
				} {
					#putlog "\00312DEBUG:\003 link:\[[join $args]\]"
					#putlog "\00312DEBUG:\003 hub: \[$hubstatline\]"
					::*akira::output "secauth" "stats verification failed! \00304<${frombot}>\003"
					unlink $frombot
					botattr $frombot -spghali
					botattr $frombot +r
					::*akira::botlog "secauth: !STATS FAILED! ${frombot} <+[botattr $frombot]> [getuser $frombot BOTADDR]"
					foreach chan [channels] {
						if { ([botonchan $chan] && [botisop $chan]) && ([onchan $frombot $chan] && [isop $frombot $chan]) } {
							putquick "MODE $chan -ob $frombot *!punish@ak!ra"
						}
					}
					::*akira::output "secauth" "$frombot \00304<security risk>\003"
					return 1 ;# TCL_ERROR
				}
			} {
				::*akira::output "secauth" "stats challenge \00310<$frombot>\003"
				catch { file stat "akira.tcl" fstat }
				if { [array size fstat] < 1 } {
					::*akira::err "cannot stat akira.tcl!"
					return 1 ;# TCL_ERROR
				}
				set fmd5 "[::md5::md5 -hex -file "akira.tcl"]"
				set bind_count [llength [binds *]]
				namespace inscope ::*akira { set proc_count [llength [info procs]] }
				set proc_count [expr {${::*akira::proc_count} - 1}]
				if { ${::*akira::isinfo} } {
					set bind_count [expr {$bind_count - 6}]
				}
				set statline "[format "%s:%d:%o %d:%d %s" "akira.tcl" $fstat(size) $fstat(mode) [expr {$bind_count + 1}] $proc_count $fmd5]"
				putbot $hub "akira_checkstat $statline"
				return 0 ;# TCL_OK
			}
		}
		proc netchans { frombot command args } {
			set idx [lindex $args 0]
			set chans [channels]
			::*akira::putcbot $frombot "akira_onchans ${idx} ${chans}"
		}
		proc onchans { frombot command args } {
			set args [lindex $args 0]
			set idx [lindex $args 0]
			set chans [lrange $args 2 end]
			::*akira::outputdcc $idx "${frombot} is on channels" "${chans}"
		}
		proc raw_modeverify { from key text } {
			global akiraopcheck botnick
			#variable ::*akira::config::bop_opkeys
			set chan [::*akira::xindex $text 0]
			set modes [string tolower [::*akira::xindex $text 1]]
			set opnick [lindex [split $from "!"] 0]
			set text [::*akira::xrange $text 2 end]
			set nick [lindex $text 0]
			set opfail 0
			if { ![string match "*+o*" $modes] } { return 0 }
			if { [string index $chan 0] ne "#" && [string index $chan 0] ne "&" && [string index $chan 0] ne "!" } { return 0 }
			if { $modes eq "+o-b" } {
				set hexgot [lindex [split $text "@"] 1]
				set hex $akiraopcheck($opnick$nick)
				#putlog "\00312DEBUG:\003 verifying op hash $hex => $hexgot"
				if { $hex eq $hexgot } {
					::*akira::output "secauth" "$opnick \00310+o\003 $nick \00309■\003"
					unset akiraopcheck($opnick$nick)
				} {
					::*akira::output "secauth" "\00304!failed!\003 hash failed ($opnick) \00306<punish both>\003"
					putserv "MODE $chan -oob $nick $opnick *!punish@ak!ra"
					set opfail 1
				}
			}
			if { $opfail } {
				::*akira::botlog "secauth: !OP FAILED! ${opnick} <[getchanhost $opnick $chan]>"
			}
			return 0 ;# TCL_OK
		}
		proc modeverify { opnick userhost handle chan modes text } {
			global akiraopcheck botnick
			variable ::*akira::config::bop_opkeys
			set nick [lindex $text 0]
			set opfail 0

			# channel +secure op verify
			if { [string match "*-secure*" [channel info $chan]] } { return 0 }
			# initial verification and loop
			if { $botnick eq $nick } {
				::*akira::bot::securechan $opnick $chan
			}
			if { [matchattr $handle b] && $handle ne $botnick } {
				if { [string match "*-o*" $modes] } {
					set command "::*akira::bot::securechan $nick $chan"
					foreach t [utimers] { if { [lindex $t 1] eq $command } { killutimer [lindex $t 2] } }
				}
			}
			if { [matchattr $handle b] && $nick ne $botnick } {
				if { [string match "*+o*" $modes] } {
					set t [string tolower [nick2hand $nick $chan]]
					if { [matchattr $t o] || [matchattr $t |o $chan] } {
						if { [matchattr $t b] } {
							if { [botisop $chan] && [lsearch [string tolower [bots]] $t] == -1 } {
								::*akira::output "secauth" "\00304!failed!\003 tried to op bot ($t) that is not linked \00306<punish>\003"
								putquick "MODE $chan -oob $nick $opnick *!punish@ak!ra"
								set opfail 1
							}
						}
						#{
						#	set cbots [llength [bots]]
						#	foreach w [string tolower [whom *]] {
						#		if { [lindex $w 0] == $t } { set cbots 0 }
						#	}
						#	if { $cbots && [botisop $chan] } {
						#		::*akira::output "secauth" "\00304!failed!\003 tried to op bot ($t) that isn't linked \00306<punish>\003"
						#		putquick "MODE $chan -oob $nick $opnick *!punish@ak!ra"
						#		set opfail 1
						#	}
						#}
					} {
						::*akira::output "secauth" "\00304!failed!\003 \002$userhost\002 ($handle) tried to op user that doesn't have flags \00306<punish>\003"
						putquick "MODE $chan -oob $nick $opnick *!punish@ak!ra"
						set opfail 1
					}
				}
			} elseif { $nick ne $botnick && [botisop $chan] } {
				if { [string match "*+o*" $modes] } {
					if { [matchattr [nick2hand $nick $chan] o] || [matchattr [nick2hand $nick $chan] |o $chan] } {
						return 0; #TCL_OK
					} {
						set addtext {}
						if { [matchattr $handle o] || [matchattr $handle |o $chan] } {
							putquick "MODE $chan -ob $nick *!noaccess@ak!ra"
						} {
							putquick "MODE $chan -oob $nick $opnick *!noaccess@ak!ra"
							set addtext " both"
						}
						::*akira::output "secauth" "\00304!failed!\003 user has no access ($nick) \00306<punish$addtext>\003"
						set opfail 1
					}
				}
			}
			if { $opfail } {
				::*akira::botlog "secauth: !OP FAILED! ${opnick} <[getchanhost $opnick $chan]> (attempt by: ${handle}!${userhost})"
			}
			return 0 ;# TCL_OK
		}
		proc opcheck { frombot command args } {
			global akiraopcheck
			set args [split [join $args] " "]
			set opnick [lindex $args 0]
			set ophex [lindex $args 1]
			set frombot [join $frombot]
			#putlog "\00312DEBUG:\003 op has received from $frombot for $opnick \00310<$ophex>\003"
			set akiraopcheck($frombot$opnick) $ophex
			return 0; #TCL_OK
		}
		proc extcheck { frombot command args } {
			global botnet-nick 
			::*akira::putcbot $frombot "akira_vcheck_ack [join $args] ${botnet-nick}|${::*akira::t9version}|${::*akira::version}|${::*akira::author}"
			return 0 ;# TCL_OK
		}
		proc extcheckack { frombot command args } {
			set idx [lindex [join $args] 0]
			set version [split [lindex [join $args] 1] |]
			::*akira::outputdcc $idx "tribe9/akira.tcl" "v[lindex $version 1]+[lindex $version 2] \00306<[lindex $version 3]>\003 \00310([lindex $version 0])\003"
			return 0 ;# TCL_OK
		}
		proc securechan { nick chan } {
			global botnick modes-per-line
			set killnicks {}
			set nicktotal 0
			set opbots 0
			foreach bot [bots] { if { [isop $bot $chan] } { incr opbots } }
			if { $opbots != [llength [bots]] } {
				::*akira::setutimer [rand 15] "::*akira::bot::securechan $nick $chan"
				return 1 ;# TCL_ERROR
			}
			foreach cop [::*akira::randomize_nicks $chan] {
				if { $cop eq $botnick } { continue }
				if { [isop $cop $chan] } {
					if { [matchattr [nick2hand $cop $chan] o] || [matchattr [nick2hand $cop $chan] |o $chan] } {
						continue;
					} {
						lappend killnicks $cop
						incr nicktotal
						set mpr ${modes-per-line}
						if { [llength $killnicks] >= $mpr } {
							putquick "MODE $chan -ooob $killnicks *!noaccess@ak!ra"
							set killnicks {}
						}
					}
				}
			}
			if { $killnicks != "" } {
				putquick "MODE $chan -[string repeat o [llength $killnicks]]b $killnicks *!noaccess@ak!ra"
			}
			if { $nicktotal > 0 } {
				::*akira::output "secauth" "$chan \00310<verified>\003"
			}
			return 0 ;# TCL_OK
		}
		proc opjoin { frombot command args } {
			global akiraopcheck botnick
			variable ::*akira::config::bop_osync
			set chan [lindex [join $args] 0]
			set handle [lindex [join $args] 1]
			set nick [lindex [join $args] 2]
			set userhost [lindex [join $args] 3]
			if { ![botonchan $chan] || ![botisop $chan] } { return 1 }
			if { ![matchattr $frombot b] || ![matchattr $frombot o|o $chan] || [matchattr $frombot d|d $chan] } { return 1 }
			if { ([matchattr $handle +o $chan] || [matchattr $handle |+o $chan]) && ![matchattr $handle +b] && ![isop $nick $chan] } {
				set hex [::*akira::net::encryptop $userhost $nick]
				set akiraopcheck($botnick$nick) $hex
				putallbots "akira_opcheck $nick $hex"
				if { $bop_osync } {
					utimer 5 "putquick \"MODE $chan +o-b $nick *!$botnick@$hex\""
				} {
					if { [isop $nick $chan] } { return 1 }
					utimer 5 "putquick \"MODE $chan +o-b $nick *!$botnick@$hex\""
				}
				if { [set ::*akira::config::loglevel] >= 2 } {
					::*akira::botlog "secauth op: [list ${botnick}!${userhost}] <+[botattr $botnick]> [getuser $botnick BOTADDR] [list $chan]"
				}
			}
		}
		proc secureopjoin { nick userhost handle chan } {
			global akiraopcheck botnick
			variable ::*akira::config::bop_osync
			if { ${::*akira::ishub} } {
				if { ([matchattr $handle +O $chan] || [matchattr $handle |+O $chan]) && ![isop $nick $chan] && [botisop $chan] } {
					if { ([matchattr $handle +o $chan] || [matchattr $handle |+o $chan]) && ![matchattr $handle +b] && ![isop $nick $chan] } {
						set nbot [rand [llength [bots]]]
						set cbot 0
						foreach bot [::*akira::randomize_bots] {
							if { $cbot == $nbot } {
								putlog "\00312DEBUG:\003 ($bot) akira_opjoin $chan $handle $nick $userhost"
								putbot $bot "akira_opjoin $chan $handle $nick $userhost"
								return 0 ;# TCL_OK
							}
							incr cbot
						}
					}
				}
			}
			return 0 ;# TCL_OK
		}
		proc server { frombot command args } {
			global botnet-nick serverslist
			set args [string tolower [join $args]]
			if { ${::*akira::ishub} } {
				foreach { key value } [array get serverslist] {
					if { [string match *$frombot* $value] } {
						regsub -all -- "$frombot" $serverslist($key) {} serverslist($key)
						regsub -all -- "  " $serverslist($key) " " serverslist($key)
					}
					if { $args eq $key } {
						if { [llength $key] > 0 } {
							lappend serverslist($key) "$frombot"
						} {
							set serverslist($key) "$frombot"
						}
					}
				}
				::*akira::botlog "server: $args: $frombot <+[botattr $frombot]> [getuser $frombot BOTADDR]"
			}
		}
		proc uname { frombot command args } {
			global botnet-nick hub
			if { ${::*akira::ishub} && $frombot ne ${botnet-nick} } {
				set idx [lindex [join $args] 0]
				set txt [lrange [join $args] 1 end]
				::*akira::outputdcc $idx "kernel" "$txt \00310<$frombot>\003"
			} {
				set idx [join $args]
				catch { exec uname -snrvm } err
				putbot $hub "akira_uname $idx $err"
			}
		}
	}
	# }}}
	# ak!ra: binds (ctcp) {{{
	namespace eval ctcp {
		variable ctcp_flood [split "5:30:120" :]
		variable ctcp_flooded false
		variable ctcp_floodqueue 0
		variable ctcp_onestack false

		proc ctcpreply { nick userhost handle dest keyword text } {
			if { ${::*akira::ctcp::ctcp_flooded} } { return 1 }
			incr ::*akira::ctcp::ctcp_floodqueue
			::*akira::setutimer [lindex ${::*akira::ctcp::ctcp_flood} 1] { incr ::*akira::ctcp::ctcp_floodqueue -1 }
			if { ${::*akira::ctcp::ctcp_floodqueue} >= [lindex ${::*akira::ctcp::ctcp_flood} 0] } {
				set ::*akira::ctcp::ctcp_flooded true
				::*akira::setutimer [lindex ${::*akira::ctcp::ctcp_flood} 2] { set ::*akira::ctcp::ctcp_flooded false }
				::*akira::botlog "ctcp flood: stopped ctcp responses for [lindex ${::*akira::ctcp::ctcp_flood} 2] seconds"
				return 1 ;# TCL_ERROR
			}
			if { ${::*akira::ctcp::ctcp_onestack} } { return 1 }
			set ::*akira::ctcp::ctcp_onestack true
			::*akira::setutimer 2 { set ::*akira::ctcp::ctcp_onestack false }
			switch -exact -nocase -- $keyword {
				"chops" -
				"errmsg" -
				"echo" -
				"finger" -
				"help" -
				"invite" -
				"op" -
				"open" -
				"ops" -
				"page" -
				"send" -
				"unban" -
				"voice" -
				"whoami" -
				"xdcc" {
					putserv "NOTICE $nick :\001[string toupper $keyword] You do not have access... -\002ak!ra\002-\001"
				}
				"clientinfo" -
				"userinfo" {
					putserv "NOTICE $nick :\001CLIENTINFO No client here!  -\002ak!ra\002-\001"
				}
				"ping" {
					putserv "NOTICE $nick :\001PING $text\001"
				}
				"time" -
				"utc" {
					putserv "NOTICE $nick :\001[string toupper $keyword] [clock format [clock seconds] -format {%a, %e %b %Y %H:%M:%S %Z} -timezone :UTC]\001"
				}
				"ver" -
				"version" {
					putserv "NOTICE $nick :\001VERSION ak!ra v${::*akira::version}\001"
				}
				default {
					return 0 ;# TCL_OK
				}
			}
			return 0 ;# TCL_OK
		}
	}
	# }}}
	# ak!ra: binds (dcc) {{{
	namespace eval dcc {
		proc +ban { handle idx args } {
			if { [catch { idx2ip $idx } longip] } { set longip - }
			if { [catch { idx2host $idx } host] } { foreach w [dcclist] { if { $idx == [lindex $w 0] } { set host [lindex $w 2] } } }
			::*akira::botlog "+ban: [join $args]: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip)"
			if { [llength $args] == 0 } {
				*dcc:+ban $handle $idx $args
				return 0 ;# TCL_OK
			}
			set date [strftime {$d/%m/%y}]
			*dcc:+ban $handle $idx "${args} (${handle}@${date})"
			return 0 ;# TCL_OK
		}
		proc +bot { handle idx args } {
			global botnet-nick
			set bot [lindex [join $args] 0]
			if { [llength $bot] == 0 } {
				putlog "Usage: +bot <handle> \[address \[\[+\]bot port\[/\[+\]user port\]\]\] \[host\]"
				return 1 ;# TCL_ERROR
			}
			if { [validuser $bot] } {
				::*akira::warning "bot already exists"
				return 1 ;# TCL_ERROR
			} {
				*dcc:+bot $handle $idx "[join $args]"
				if { [validuser $bot] } {
					setuser $bot xtra created "[::*akira::iso8601]"
					setuser $bot xtra createdby "${handle} as ${bot}"
					::*akira::net::tellabout $handle $bot
					if { [catch { idx2ip $idx } longip] } { set longip - }
					if { [catch { idx2host $idx } host] } { foreach w [dcclist] { if { $idx == [lindex $w 0] } { set host [lindex $w 2] } } }
					::*akira::botlog "+bot: [join $args]: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip)"
					return 0 ;# TCL_OK
				} {
					::*akira::errdcc $idx "could not add \002${bot}\002"
					return 1 ;# TCL_ERROR
				}
			}
		}
		proc +user { handle idx args } {
			global botnet-nick
			set user [lindex [join $args] 0]
			if { [llength $user] == 0 } {
				putlog "Usage: +user <handle> \[hostmask\]"
				return 1 ;# TCL_ERROR
			}
			if { [validuser $user] } {
				::*akira::warning "user already exists"
				return 1 ;# TCL_ERROR
			} {
				*dcc:+user $handle $idx "[join $args]"
				if { [validuser $user] } {
					setuser $user xtra created "[::*akira::iso8601]"
					setuser $user xtra createdby "${handle} as ${user}"
					::*akira::net::tellabout $handle $user
					if { [catch { idx2ip $idx } longip] } { set longip - }
					if { [catch { idx2host $idx } host] } { foreach w [dcclist] { if { $idx == [lindex $w 0] } { set host [lindex $w 2] } } }
					::*akira::botlog "+user: [join $args]: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip)"
					return 0 ;# TCL_OK
				} {
					::*akira::errdcc $idx "could not add \002${user}\002"
					return 1 ;# TCL_ERROR
				}
			}
		}
		proc about { handle idx args } {
			global hub infobot nick version
			set hubtxt {}
			::*akira::cmdlog "about|${handle}"
			putdcc $idx "\00300▄▄ ▄ ▄▄ ▄ ▄▄▄▄ ▄▄▄▄ ▄▄ ▄▄▄ \00301,01.\003 \003\00313▄▄ \003\00311▄▄▄▄ ▄▄▄▄ ▄▄▄▄ ▄▄▄▄ \003\00313▄▄\003"
			putdcc $idx "\00300██ █ ██ █ ██ █ ██ █ ██ ██ █ \003\00313██\00301,01.\003 \003\00311██ █ ██ █ ██ █ ██ ▀\00301,01.\003 \003\00313██\003"
			putdcc $idx "\00300██▄█ ██▄█ ██▄▀ ██▄▀ ██ ██ █ \003\00313██\00301,01.\003 \003\00311██\00301,01..\003 \00311██ █ ██▄▀ ██▀\00301,01..\003 \003\00313██\003"
			putdcc $idx "\00314█\003\00300█ █ \003\00314▄\003\00300▄ █ \003\00314█\003\00300█ █ \003\00300,14▀\003\00300█ █ \003\00300,14▀\003\00300█ \003\00300,14 \003\00300█ █ \003\00300,06 \003\00313█\003\00301,01.\003 \00300,10 \003\00311█ █ \003\00300,10 \003\00311█ █ \003\00311,10▀\003\00311█ █ \003\00311,10 \003\00311█ █\003\00301,01.\003 \00313█\003\00313,06 \003"
			putdcc $idx "\00314▀▀ ▀ ▀▀▀▀ ▀▀▀▀ ▀▀ ▀ ▀▀ ▀▀▀▀ \003\00306▀▀▀ \003\00310▀▀▀▀ ▀▀▀▀ ▀▀ ▀ ▀▀▀▀ \003\00306▀▀▀\003"
			putdcc $idx "\00309□\003 hybrid(core): \00314[lindex $version 0]"
			if { ${nick} == ${hub} } { set ::*akira::ishub 1;set hubtxt " \00310<hub mode>\003" }
			if { ${nick} == ${infobot} } { set ::*akira::isinfo 1;set hubtxt " \00310<info bot>\003" }
			::*akira::output "tribe9/akira.tcl" "v${::*akira::t9version}+${::*akira::version}\003 \00306<${::*akira::author}>${hubtxt}"
		}
		proc botnet { handle idx args } {
			global botnick botnet-nick infobot
			set chans [channels]
			set botcount [::*akira::countbots]
			set args [lindex $args 0]
			set s_flags [lindex $args 2]
			set mode [lindex $args 0]
			set botmsg [lindex $args 1]
			if { [catch { idx2ip $idx } longip] } { set longip - }
			if { [catch { idx2host $idx } host] } { foreach w [dcclist] { if { $idx == [lindex $w 0] } { set host [lindex $w 2] } } }
			switch -exact $mode {
				"channels" {
					::*akira::cmdlog "net ${mode}|${handle}"
					::*akira::putcbots "akira_netchans ${idx} ${args}"
					::*akira::outputdcc $idx "${botnick} is on channels" "${chans}"
					return 0 ;# TCL_OK
				}
				"control" {
					::*akira::cmdlog "net ${mode}|${handle}|${s_flags}"
					::*akira::net::bcontrol $idx $botmsg $s_flags
					return 0 ;# TCL_OK
				}
				"takeover" {
					set chan [lindex $args 1]
					::*akira::cmdlog "net ${mode}|${handle}|${chan}"
					::*akira::putcbots "akira_net ${args} ${handle}"
					::*akira::botlog "net takeover: ${chan}: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip) \[control:${::*akira::config::control} (${botcount})\]"
					::*akira::outputdcc $idx "net takeover" "${chan} \00306(${botcount} bots)\003"
					if { [::*akira::control_islocal] } {
						::*akira::net::takeover $chan
					}
					return 0 ;# TCL_OK
				}
				"masskick" {
					set chan [lindex $args 1]
					::*akira::cmdlog "net ${mode}|${handle}|${chan}"
					::*akira::putcbots "akira_net ${args} ${handle}"
					::*akira::botlog "net masskick: ${chan}: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip) \[control:${::*akira::config::control} (${botcount})\]"
					::*akira::outputdcc $idx "net mass-kick" "${chan} \00306(${botcount} bots)\003"
					if { [::*akira::control_islocal] } {
						::*akira::setutimer 1 {::*akira::net::masskick $chan}
					}
					return 0 ;# TCL_OK
				}
				"massop" {
					set chan [lindex $args 1]
					::*akira::cmdlog "net ${mode}|${handle}|${chan}"
					::*akira::putcbots "akira_net ${args} ${handle}"
					::*akira::botlog "net massop: ${chan}: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip) \[control:${::*akira::config::control} (${botcount})\]"
					::*akira::outputdcc $idx "net mass-op" "${chan} \00306(${botcount} bots)\003"
					if { [::*akira::control_islocal] } {
						::*akira::setutimer 1 {::*akira::net::massop $chan}
					}
					return 0 ;# TCL_OK
				}
				"massopall" {
					set chan [lindex $args 1]
					::*akira::cmdlog "net ${mode}|${handle}|${chan}"
					::*akira::putcbots "akira_net ${args} ${handle}"
					::*akira::botlog "net massopall: ${chan}: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip) \[control:${::*akira::config::control} (${botcount})\]"
					::*akira::outputdcc $idx "net mass-op all" "${chan} \00306(${botcount} bots)\003"
					if { [::*akira::control_islocal] } {
						::*akira::setutimer 1 {::*akira::net::massopall $chan}
					}
					return 0 ;# TCL_OK
				}
				"massvoice" {
					set chan [lindex $args 1]
					::*akira::cmdlog "net ${mode}|${handle}|${chan}"
					::*akira::putcbots "akira_net ${args} ${handle}"
					::*akira::botlog "net massvoice: ${chan}: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip) \[control:${::*akira::config::control} (${botcount})\]"
					::*akira::outputdcc $idx "net mass-voice" "${chan} \00306(${botcount} bots)\003"
					if { [::*akira::control_islocal] } {
						::*akira::setutimer 1 {::*akira::net::massvoice $chan}
					}
					return 0 ;# TCL_OK
				}
				"massdevoice" {
					set chan [lindex $args 1]
					::*akira::cmdlog "net ${mode}|${handle}|${chan}"
					::*akira::putcbots "akira_net ${args} ${handle}"
					::*akira::botlog "net massdevoice: ${chan}: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip) \[control:${::*akira::config::control} (${botcount})\]"
					::*akira::outputdcc $idx "net mass-devoice" "${chan} \00306(${botcount} bots)\003"
					if { [::*akira::control_islocal] } {
						::*akira::setutimer 1 {::*akira::net::massdevoice $chan}
					}
					return 0 ;# TCL_OK
				}
				"join" {
					set chan [lindex $args 1]
					::*akira::cmdlog "net ${mode}|${handle}|${chan}"
					::*akira::putcbots "akira_net ${args} ${handle}"
					::*akira::botlog "net join: ${chan}: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip) \[control:${::*akira::config::control} (${botcount})\]"
					::*akira::outputdcc $idx "net joining" "${chan} \00306(${botcount} bots)\003"
					if { [::*akira::control_islocal] } {
						catch { channel add $chan }
						catch { channel set $chan +limit +secure }
						if { $infobot eq ${botnet-nick} } {
							catch { channel set $chan +crypto +www +youtube }
						}
					}
					return 0 ;# TCL_OK
				}
				"part" {
					set chan [lindex $args 1]
					::*akira::cmdlog "net ${mode}|${handle}|${chan}"
					::*akira::putcbots "akira_net ${args} ${handle}"
					::*akira::botlog "net part: ${chan}: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip) \[control:${::*akira::config::control} (${botcount})\]"
					::*akira::outputdcc $idx "net parting" "${chan} \00306(${botcount} bots)\003"
					if { [::*akira::control_islocal] } {
						catch { channel remove $chan }
					}
					return 0 ;# TCL_OK
				}
				"chanset" {
					set chan [lindex $args 1]
					set settings [lrange $args 2 end]
					::*akira::cmdlog "net ${mode}|${handle}|${chan} (${settings})"
					::*akira::putcbots "akira_net ${args} ${handle}"
					::*akira::botlog "net chanset: ${chan} ${settings}: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip) \[control:${::*akira::config::control} (${botcount})\]"
					::*akira::outputdcc $idx "net chanset" "${chan} => ${settings} \00306(${botcount} bots)\003"
					if { [::*akira::control_islocal] } {
						catch { channel set $chan $settings }
					}
					return 0 ;# TCL_OK
				}
				"chankey" {
					set chan [lindex $args 1]
					if { ![validchan $chan] } { return 1 }
					set key [lindex $args 2]
					::*akira::cmdlog "net ${mode}|${handle}|${chan} (*****)"
					::*akira::putcbots "akira_net ${args} ${handle}"
					::*akira::botlog "net chankey: ${chan} (*****): [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip) \[control:${::*akira::config::control} (${botcount})\]"
					::*akira::outputdcc $idx "net chankey" "${chan} (*****) \00306(${botcount} bots)\003"
					if { [::*akira::control_islocal] } {
						putserv "JOIN $chan $key"
					}
					return 0 ;# TCL_OK
				}
				"jump" {
					::*akira::cmdlog "net ${mode}|${handle}"
					::*akira::putcbots "akira_net ${args} ${handle}"
					::*akira::botlog "net jump: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip) \[control:${::*akira::config::control} (${botcount})\]"
					::*akira::outputdcc $idx "net jump" "\00306(${botcount} bots)\003"
					if { [::*akira::control_islocal] } {
						foreach chan [channels] {
							set chanops 0
							foreach nick [string tolower [chanlist $chan]] {
								if { $nick eq $botnick } continue
								if { [isop $nick $chan] } {incr chanops}
							}
							if {[botisop $chan] && !$chanops} {
								dccbroadcast "jump: last op on $chan skipping jump..."
								return 0 ;# TCL_OK
							}
						}
						jump
					}
					return 0 ;# TCL_OK
				}
				"save" {
					::*akira::cmdlog "net ${mode}|${handle}"
					::*akira::putcbots "akira_net ${args} ${handle}"
					::*akira::botlog "net save: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip) \[control:${::*akira::config::control} (${botcount})\]"
					::*akira::outputdcc $idx "net save" "\00306(${botcount} bots)\003"
					if { [::*akira::control_islocal] } {
						save
					}
					return 0 ;# TCL_OK
				}
				"rehash" {
					::*akira::cmdlog "net ${mode}|${handle}"
					::*akira::putcbots "akira_net ${args} ${handle}"
					::*akira::botlog "net rehash: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip) \[control:${::*akira::config::control} (${botcount})\]"
					::*akira::outputdcc $idx "net rehash" "\00306(${botcount} bots)\003"
					if { [::*akira::control_islocal] } {
						rehash
					}
					return 0 ;# TCL_OK
				}
				default {
					::*akira::help $handle $idx $args
					return 0 ;# TCL_OK
				}
			}
		}
		proc dccbotnick { handle idx args } {
			global altnick botnick nick
			if { $args eq "" } {
				::*akira::output "botnick" "current: \002${botnick}\002, nick: \002${nick}\002, altnick: \002${altnick}\002"
				putdcc $idx "Usage: botnick <nick> \[altnick\]"
				return 1 ;# TCL_ERROR
			}
			set nick [lindex $args 0]
			::*akira::output "botnick" "nick set to \002${nick}\002"
			if { [llength $args] == 2 } {
				set altnick [lindex $args 1]
			} {
				set altnick "[string range $nick 0 7]_"
			}
			::*akira::output "botnick" "altnick set to \002${altnick}\002"
			if { [catch { idx2ip $idx } longip] } { set longip - }
			if { [catch { idx2host $idx } host] } { foreach w [dcclist] { if { $idx == [lindex $w 0] } { set host [lindex $w 2] } } }
			::*akira::botlog "botnick: ${nick} (${altnick}): [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip)"
			return 0 ;# TCL_OK
		}

		proc dccbots { handle idx args } {
			global nick
			set upbots [bots]
			regsub -all " " $upbots ", " upbots
			set downbots {}
			foreach bot [userlist b] {
				if { ![islinked $bot] && [string tolower $bot] != [string tolower $nick] } {
					lappend downbots $bot
				}
			}
			regsub -all " " $downbots ", " downbots
			::*akira::cmdlog "bots|${handle}"
			if { $upbots ne "" } {
				::*akira::outputdcc $idx "bots" "up: \002${upbots}\002 \00306(total: [llength $upbots])\003"
			} {
				::*akira::outputdcc $idx "bots" "none linked"
				return 0 ;# TCL_OK
			}
			if { $downbots ne "" } {
				::*akira::outputdcc $idx "bots" "down: \002${downbots}\002 \00306(total: [llength $downbots])\003"
			} {
				::*akira::outputdcc $idx "bots" "all linked"
				return 0 ;# TCL_OK
			}
			return 0 ;# TCL_OK
		}
		proc dccchannels { handle idx args } {
			::*akira::cmdlog "channels|${handle}"
			set chans {}
			foreach chan [channels] {
				if { ![botonchan $chan] } {
					# bot can't join channel
					lappend chans "\00305(${chan})\003"
				} elseif { ![botisop $chan] } {
					# bot has no ops in channel
					lappend chans "\00314${chan}\003"
				} {
					# bot has ops in channel
					lappend chans "\00310${chan}\003"
				}
			}
			::*akira::outputdcc $idx "channels" "${chans}"
		}
		proc hostcheck { handle idx args } {
			if { $args eq "" } {
				putdcc $idx "Usage: hostcheck <numberofhosts>"
				return 1 ;# TCL_ERROR
			}
			append list ""
			set ucount 0
			foreach user [userlist] {
				set hcount 0
				foreach host [getuser $user hosts] { incr hcount 1 }
				if { $hcount >= $args } {
					append list "${user}, "
					incr ucount 1
				}
			}
			::*akira::cmdlog "hostcheck|${handle}"
			if { $list >= 1 } {
				::*akira::outputdcc $idx "hostcheck" "\002${ucount}\002 found with ${args} or more hosts \00306([string trimright $list ", "])\003"
			} {
				::*akira::outputdcc $idx "hostcheck" "\002none\002 found with ${args} or more hosts"
			}
		}
		proc dcckill { handle idx args } {
			if { $args eq "" } {
				putdcc $idx "Usage: kill <user> <reason>"
				return 1 ;# TCL_ERROR
			}
			if { [set tidx [hand2idx [lindex $args 0]]] != -1 } {
				::*akira::cmdlog "kill|${handle}"
				set thandle [idx2hand $tidx]
				::*akira::errdcc $tidx "Killed (${handle} ([lreplace $args 0 0]))"
				killdcc $tidx
				dccbroadcast "${thandle} killed (${handle} ([lreplace $args 0 0]))"
				if { [catch { idx2ip $idx } longip] } { set longip - }
				if { [catch { idx2host $idx } host] } { foreach w [dcclist] { if { $idx == [lindex $w 0] } { set host [lindex $w 2] } } }
				::*akira::botlog "kill: ${thandle} ([lreplace $args 0 0]): [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip)"
				return 0 ;# TCL_OK
			} {
				::*akira::warningdcc $idx "invalid user"
				return 1 ;# TCL_ERROR
			}
		}
		proc op { handle idx args } {
			global akiraopcheck botnick
			if { [set user [::*akira::xindex $args 0]] == {} } {
				putdcc $idx "Usage: op <nick> \[channel\]"
				return 1 ;# TCL_ERROR
			}
			if { [set chan [::*akira::xindex $args 1]] == [set chanlist {}] } { set chan [channels] }
			foreach ch $chan {
				if { ![validchan $ch] || ![onchan $user $ch] || ![isop $botnick $ch] } { continue }
				set hand [string tolower [nick2hand $user $ch]]
				if { [botisop $ch] && ![isop $user $ch] && [matchattr $hand (o|#o)&-d&#-d $ch] } {
					set host [getchanhost $user $ch]
					lappend chanlist $ch
					if { [catch { idx2ip $idx } longip] } { set longip - }
					if { [catch { idx2host $idx } host] } { foreach w [dcclist] { if { $idx == [lindex $w 0] } { set host [lindex $w 2] } } }
					::*akira::botlog "op: [list $ch]: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip)"
					set hex [::*akira::net::encryptop $host $user]
					putallbots "akira_opcheck $user $hex"
					#putlog "\00312DEBUG:\003 akira_opcheck $user $hex"
					set akiraopcheck($botnick$user) $hex
					utimer 5 "putquick \"MODE ${ch} +o-b ${user} *!${user}@${hex}\""
				}
			}
			if { $chanlist == {} } {
				::*akira::warning "bots have no ops on channels where you don't"
				return 1 ;# TCL_ERROR
			} {
				set n [finduser $user!$host]
				::*akira::output "opped" "${user}!${host}($n +[chattr $n]) ${chanlist} \00306[idx2hand $idx]\003"
				return 0 ;# TCL_OK
			}
		}
		proc dccuserlist { handle idx args } {
			if { [string tolower [::*akira::xindex $args 0]] == "help" } {
				putdcc $idx "Usage: userlist <flags> <channel>"
			} {
				if { [::*akira::xindex $args 0] ne "" } {
					set flags [::*akira::xindex $args 0]
					if { [::*akira::xindex $args 1] ne "" } {
						set chan [::*akira::xindex $args 1]
						if { ![validchan $chan] } {
							::*akira::warningdcc $idx "invalid channel"
							return 1 ;# TCL_ERROR
						}
						if { [string match *|* $flags] } {
							set flags [::*akira::xindex [split $flags |] 0]&[::*akira::xindex [split $flags |] 1]
						} {
							set flags "&${flags}"
						}
						set ulist [userlist $flags $chan]
					} {
						set ulist [userlist $flags]
					}
				} {
					set ulist [userlist]
				}
				::*akira::cmdlog "userlist|${handle}"
				set ucount 0
				foreach user $ulist {
					if { [passwdok $user ""] } {
						::*akira::outputdcc $idx "userlist" "\00305!\003${user} ([::*akira::xindex [getuser $user hosts] 0]) <[chattr $user]>"
					} {
						::*akira::outputdcc $idx "userlist" "${user} ([::*akira::xindex [getuser $user hosts] 0]) <[chattr $user]>"
					}
					incr ucount
				}
				::*akira::outputdcc $idx "userlist" "found \002${ucount}\002 person(s) out of [countusers] matching specified flag"
			}
			return 0 ;# TCL_OK
		}
		proc serverlist { handle idx args } {
			global serverslist serversloc
			if { ![matchattr $handle n] } { 
				return 1 ;# TCL_ERROR
			}
			if { !${::*akira::ishub} } {
				::*akira::errdcc $idx "only usable on hub"
				return 1 ;# TCL_ERROR
			}
			::*akira::cmdlog "servers|${handle}"
			if { [catch { idx2ip $idx } longip] } { set longip - }
			if { [catch { idx2host $idx } host] } { foreach w [dcclist] { if { $idx == [lindex $w 0] } { set host [lindex $w 2] } } }
			::*akira::botlog "servers: [join $args]: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip)"
			foreach { key value } [array get serverslist] {
				if { [string length $value] > 0 } {
					set sbots [split [string trim $value] " "]
					set servbots {}
					foreach sbot $sbots {
						set servbots "$servbots \00306($sbot)\003"
					}
				} {
					set servbots $value
				}
				set servinfo [split $serversloc($key) "/"]
				if { [string length [lindex $servinfo 1]] > 0 } {
					set servinfo2 [string trim [lindex $servinfo 1]]
					regsub -all {\:} $servinfo2 " "
					set servinfo2 " \00310<$servinfo2>\003"
				} {
					set servinfo2 {}
				}
				::*akira::outputdcc $idx "$key" "[lindex $servinfo 0]$servinfo2$servbots"
			}
			return 0 ;# TCL_OK
		}
		proc status { handle idx args } {
			::*akira::cmdlog "status|${handle}"
	    	putdcc $idx "\00301,01.. \003\00312▄\003\00312,02▓▓\003\00312▀\003\00312,02■▓\003\00312▄ ▀\003\00312,02▓▓▓\003\00312▄\003\00301,01 ... \003\00312▄\003\00312,02▓\003\00312▀▀\003\00312,02▓▓▓\003\00312▄\003 \003\00312▀\003\00312,02▓▓▓\003\00312▄\003\00301,01 .... \003\00312▄\003\00312,02▓▓\003\00312▀\003\00312,02■▓\003\00312▄ fx\003"
			putdcc $idx "\00301,01. \003\00312,02▒▒▓\003\00312▌\00301,01. \003\00312▀\003\00312,02▒▒\003\00312 \003\00312,02▓▒▒▒\003\00312\003\00301,01 .. \003\00312■▀\003\00301,01 ... \003\00312,02▓▓▓\003\00312 \003\00312,02▓▒▒▒\003\00301,01 ... \003\00312,02▒▒▓\003\00312▌\00301,01. \003\00312▀\003\00312,02▒▒\003"
			putdcc $idx "\00301,01. \003\00312,02░░▒\003\00301,01 . \003\00312\003\00301,01. \003\00312,02▒\003\00312 ▐\003\00312,02▒▒▒\003\00312▌▄\003\00301,01 . \003\00312▄\003\00312,02▓█\003\00312▀\003\00312,02▓\003\00312▄\003\00312,02▒▒▒\003\00312▌\003\00312▐\003\00312,02▒▒▒\003\00312▌▄ \003 \003\00312 \003\00312,02░░▒\003\00301,01 ... \003\00312,02▒\003"
			putdcc $idx "\00312 ■ \003\00312,02░░░\003\00312▄▀■▄▄\003\00301,01. \003\00312,02▒░░\003\00312▀\003\00312,02▒\003\00312 \003\00312 ▐\003\00312,02▒▒▒\003  \00312,02░▒▒▒\003\00312▌ \003\00312,02▒░░\003\00312▀\003\00312,02▒\003\00312 \003\00312 ■ \003\00312,02░░░\003\00312▄▀■▄▄\003"
			putdcc $idx "\00301,01.\003\00312,02░\003\00312▌ \003\00312▀▀\00301,01 . \003\00312▐\003\00302,12▒\003\00312▌ \003\00312,02░░\003\00312,02█\003\00312▄ ▄█▄ \003\00312,02▒▒\003\00312▄ ▐\003\00302,12░░░\003\00312▌ \003\00312,02░░\003\00302,12█\003\00312▄ ▄▌\003\00302,12░\003\00312▌ \003\00312▀▀\003\00301,01 . \003\00312▐\003\00302,12▒\003\00312▌\003"
			putdcc $idx "\00301,01.\003\00312▐\003\00302,12░\003\00312█\003\00302,12░\003\00312▄▄▄\003\00302,12░▒\003\00312█▌ \003\00312▐█\003\00302,12░\003\00312███\003\00302,12░\003\00312█▌▐\003\00302,12░░\003\00302,12█\003\00312,02░\003\00312,02██\003\00312█\003\00301,01. \003\00312▐█\003\00302,12░\003\00312███\003\00302,12░\003\00312▐\003\00302,12░\003\00312█\003\00302,12░\003\00312▄▄▄\003\00302,12░▒\003\00312█▌\003"
			putdcc $idx "\00301,01. \003\00312▀███████▀\00301,01 . \003\00312▀██\003\00302,12░\003\00312██▀ ▀\003\00302,12██\003\00312,02░\003\00312,02██░\003\00312▀\003\00301,01 . \003\00312▀██\003\00302,12░\003\00312██▄▀███████▀\003"
			putdcc $idx ""
			*dcc:status $handle $idx $args
			return 0 ;# TCL_OK
		}
		proc vcheck { handle idx args } {
			global botnet-nick
			::*akira::cmdlog "vcheck|${handle}"
			::*akira::outputdcc $idx "tribe9/akira.tcl" "v${::*akira::t9version}+${::*akira::version} \00306<${::*akira::author}>\003"
			putallbots "akira_vcheck $idx"
		}
		proc dccwhom { handle idx args } {
			if { $args ne "*" } {
				*dcc:whom $handle $idx $args
				return 0 ;# TCL_OK
			}
			::*akira::cmdlog "whom all|${handle}"
			::*akira::outputdcc $idx "" "\003 Nick      Chanl Bot       Idle   Away Host"
			::*akira::outputdcc $idx "" " --------- ----- --------- ------ ---- ------------------------------"
			foreach user [whom *] {
				set nck [lindex $user 0]
				set bot [lindex $user 1]
				set hst [lindex $user 2]
				set sts [lindex $user 3]
				set idl [lindex $user 4]
				set awy [lindex $user 5]
				set chn [lindex $user 6]
				if { $sts eq "-" } { set sts " " }
				if { $chn > 99999 } { set chn "local" }
				if { $chn eq "-1" } { set chn "off" }
				set d [expr {$idl / 1440}]
				set h [expr {$idl % 1440}]
				set h [expr {$h / 60}]
				set m [expr {$idl % 1440}]
				set m [expr {$m % 60}]
				set nid "${d}d${h}h"
				if { $d eq "0" && $h eq "0" } { set nid "${m} min" }
				if { $d eq "0" && $h ne "0" } { set nid "${h}h${m}m" }
				if { [lindex $hst 1] == $bot } { set hst [lindex $hst 0] }
				if { $awy ne "" } { set aws "YES" } { set aws "NO" }
				::*akira::outputdcc $idx "" "\003[format "\00310%-1s\003%-10s \00314%-5s\003 %-9s \00314%-6s %-4s\003 %-1s" $sts $nck $chn $bot $nid $aws $hst]"
			}
			return 0 ;# TCL_OK
		}
		proc aversion { handle idx args } {
			global hub infobot nick version
			set hubtxt {}
			::*akira::cmdlog "version|${handle}"
			putdcc $idx "\00300▀\003▀\00314▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█\003"
			putdcc $idx "\00314█ \003\00310█▀█ █ ▄ ▀ █▀▄ █▀█ \003\00314█\003"
			putdcc $idx "\00314█ \00311,10░\003 \00311,10░\003 \00311,10░\003 \00311,10░\003 \00310█ \003\00311,10░\003 \00311,10▒\003 \00311,10░\003 \00310█\003 \00314█\003"
			putdcc $idx "\00314█ \00311,10▓\003 \00311█\003 \00311,10▓\003\00311▄▀\003 \00311,10▓\003 \00311█ █ █ \003\00311,10▓\003 \00314█\003"
			putdcc $idx "\00314█ \00311█▀█ █ █ █ █▀▄ █▀█ \003\00314█ bz!\003"
			putdcc $idx "\00314█▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄\003▄\00300▄\003"
			if { ${nick} == ${hub} } { set ::*akira::ishub 1;set hubtxt " \00310<hub mode>\003" }
			if { ${nick} == ${infobot} } { set ::*akira::isinfo 1;set hubtxt " \00310<info bot>\003" }
			::*akira::output "tribe9/akira.tcl" "v${::*akira::t9version}+${::*akira::version}\003 \00306<${::*akira::author}>${hubtxt}"
			::*akira::output "blowcrypt.tcl" "${::*akira::blowcrypt_version} \00306<poci/PPX>\003"
			::*akira::output "tmon.tcl" "${::*akira::tmon_version} \00306<stran9er>\003"
			return 0 ;# TCL_OK
		}
		proc uname { handle idx args } {
			global botnet-nick botnick
			set bn [string tolower ${botnet-nick}]
			if { ![matchattr $handle n] } { 
				return 1 ;# TCL_ERROR
			}
			if { !${::*akira::ishub} } {
				::*akira::errdcc $idx "only usable on hub"
				return 1 ;# TCL_ERROR
			}
			::*akira::cmdlog "uname|${handle}"
			if { [catch { idx2ip $idx } longip] } { set longip - }
			if { [catch { idx2host $idx } host] } { foreach w [dcclist] { if { $idx == [lindex $w 0] } { set host [lindex $w 2] } } }
			::*akira::botlog "uname: [join $args]: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip)"
			putallbots "akira_uname $idx"
			catch { exec uname -snrvm } err
			::*akira::outputdcc $idx "kernel" "$err \00310<$bn>\003"
			return 0 ;# TCL_OK
		}
	}
	# }}}
	# ak!ra: binds (events) {{{
	namespace eval events {
		proc botdisc { unlinkbot } {
			global serverslist
			setuser $unlinkbot xtra lastleft "[::*akira::iso8601]"
			if { ${::*akira::ishub} } {
				foreach { key value } [array get serverslist] {
					if { [string match *$unlinkbot* $value] } {
						regsub -all -- "$unlinkbot" $serverslist($key) {} serverslist($key)
						regsub -all -- "  " $serverslist($key) " " serverslist($key)
					}
				}
			}
			return 0 ;# TCL_OK
		}
		proc botlink { linkbot via } {
			global botnet-nick hub serveraddress
			if { ${::*akira::ishub} } {
				if { $linkbot ne ${botnet-nick} } {
					putbot $linkbot "akira_checkstat"
				}
			} {
				putbot $hub "akira_server $serveraddress"
			}
			if { $via eq ${botnet-nick} } {
				setuser $linkbot xtra lastlinked "[::*akira::iso8601]"
			}
			if { ${::*akira::config::bop_linkop} } {
				if { $linkbot eq ${botnet-nick} || $via eq ${botnet-nick} } {
					if { ![string match *bop_linkreq* [utimers]] } {
						::*akira::setutimer 2 ::*akira::bot::bop_linkreq
					}
				}
				return 0 ;# TCL_OK
			}
		}
		proc chon { handle idx } {
			global botnick
			set handle [string tolower $handle]
			if { [catch { idx2ip $idx } longip] } { set longip - }
			if { [catch { idx2host $idx } host] } { foreach w [dcclist] { if { $idx == [lindex $w 0] } { set host [lindex $w 2] } } }
			::*akira::botlog "chon: [list $handle] <+[set f [chattr $handle]]> $idx [list $host] ($longip)"
			setuser $handle xtra lastlogin "$handle ($f) \[$host\] at [ctime [unixtime]]"
			set telnet {}
			foreach w [dcclist] {
				if { [lindex $w 0]==$idx } {
					if { [string match "telnet:*" [lindex $w 2]] } { set telnet "\377\373\001" }
				}
			}
			control $idx ::*akira::enterpass
			::*akira::outputdcc $idx "ak!ra" "authentication"
			putdcc $idx ""
			putdcc $idx "net password: $telnet"
			return 0
		}
		proc userdisc { handle idx } {
			setuser $handle xtra lastleft "[::*akira::iso8601]"
			return 0 ;# TCL_OK
		}
	}
	# }}}
	# ak!ra: filters (filt) {{{
	namespace eval filt {
		proc chattr { idx text } {
			regsub "  *" $text " " t
			set t [split $t " "]
			switch -- [lindex $t 0] {
				.botatt -
				.botattr -
				.chatt -
				.chattr {
					set handle [idx2hand $idx]
					set foruser [string tolower [lindex $t 1]]
					set flags [lindex $t 2]
					if { [validuser $foruser] && ([matchattr $handle n] || ([matchattr $handle m] && ![matchattr $foruser n]))} {
						setuser $foruser xtra chattrby "$handle <${flags}> ([::*akira::iso8601])"
					}
					return $text ;# CONTINUE
				}
				default {
					return $text ;# CONTINUE
				}
			}
		}
	}
	# }}}
	# ak!ra: binds (msg) {{{
	namespace eval msg {
		proc op { nick userhost handle args } {
			global akiraopcheck botnick
			set password [::*akira::xindex $args 0]
			set chan [string tolower [::*akira::xindex $args 1]]
			if { [::*akira::xstrcmp $nick $botnick] } { return 1 }
			if { [passwdok $handle ""] } {
				::*akira::warning "failed op:\002$handle\002 \00306(${nick}!${userhost})\003"
				return 1 ;# TCL_ERROR
			}
			if { [passwdok $handle $password] } {
				if { $chan ne "" } {
					if { ![validchan $chan] || ![onchan $botnick $chan] || ![isop $botnick $chan] } {
						::*akira::warning "failed op:\002$handle\002 \00306(${nick}!${userhost})\003"
						return 1 ;# TCL_ERROR
					}
					if { [onchan $nick $chan] && ![isop $nick $chan] && [matchattr [nick2hand $nick $chan] (o|#o)&-d&#-d $chan] } {
						set hex [::*akira::net::encryptop [getchanhost $nick $chan] $nick]
						putallbots "akira_opcheck $nick $hex"
						#putlog "\00312DEBUG:\003 akira_opcheck $nick $hex"
						set akiraopcheck($botnick$nick) $hex
						utimer 5 "putquick \"MODE ${chan} +o-b ${nick} *!${nick}@${hex}\""
						::*akira::cmdlog "op|${handle}|${nick}!${userhost}"
					}
					return 0 ;# TCL_OK
				} {
					foreach chan [channels] {
						set chan [string tolower $chan]
						if { [onchan $nick $chan] && ![isop $nick $chan] && [matchattr [nick2hand $nick $chan] (o|#o)&-d&#-d $chan] } {
							set hex [::*akira::net::encryptop [getchanhost $nick $chan] $nick]
							putallbots "akira_opcheck $nick $hex"
							#putlog "\00312DEBUG:\003 akira_opcheck $nick $hex"
							set akiraopcheck($botnick$nick) $hex
							utimer [rand 5] "putquick \"MODE ${chan} +o-b ${nick} *!${nick}@${hex}\""
						}
					}
					::*akira::cmdlog "op|${handle}|${nick}!${userhost}"
					return 0 ;# TCL_OK
				}
			}
			::*akira::warning "failed op:\002$handle\002 \00306(${nick}!${userhost})\003"
			return 1 ;# TCL_ERROR
		}
	}
	# }}}
	# ak!ra: binds (time) {{{
	namespace eval time {
		proc checkstattimer { min hour day month year } {
			if { ${::*akira::ishub} } {
				::*akira::time::hubcheckstat
			}
		}
		proc hubcheckstat {} {
			catch { file stat "akira.tcl" fstat }
			if { [array size fstat] < 1 } {
				::*akira::err "cannot stat akira.tcl!"
				return 1 ;# TCL_ERROR
			}
			set fmd5 "[::md5::md5 -hex -file "akira.tcl"]"
			set bind_count [llength [binds *]]
			namespace inscope ::*akira { set proc_count [llength [info procs]] }
			set proc_count ${::*akira::proc_count}
			set statline "[format "%s:%d:%o %d:%d %s" "akira.tcl" $fstat(size) $fstat(mode) $bind_count $proc_count $fmd5]"
			catch {
				set f [open ".stats" a+]
				seek $f 0
				set lnum 0
				while { [gets $f line] >= 0 } {
					if { [llength $line] > 0 } {
						if { $line eq $statline } {
							close $f
							return 1 ;# TCL_OK
						}
					}
					incr lnum
				}
				seek $f 0
				puts $f $statline
 				if { [llength [bots]] > 0 } {
					putallbots "akira_checkstat"
				}
				::*akira::output "secauth" "stats changed \00310<update all bots>\003"
				close $f
			}
			return 0 ;# TCL_OK
		}
		proc dccidlekick { min hour day month year } {
			global botnet-nick
			foreach conn [dcclist] {
				if { ([lsearch "chat files script" [lindex $conn 3]]+1) && ![matchattr [lindex $conn 1] f] } {
					if { [getdccidle [lindex $conn 0]] > 200 } {
						boot [lindex $conn 1]@${botnet-nick} "\002Idle time exceeded...\002"
					}
				}
			}
		}
		proc keeplinked { min hour day month year } {
			global botnet-nick
			foreach bot [userlist b] {
				if { ([string match "*h*" "[getuser $bot BOTFL]"] || [string match "*a*" "[getuser $bot BOTFL]"]) && (![string match "*r*" "[getuser $bot BOTFL]"] && ![islinked $bot]) && $bot != ${botnet-nick}} {
					::*akira::botlog "keeplinked: linking: $bot"
					link "$bot"
				}
			}
		}
	}
	# }}}
	# ak!ra: procs (net) {{{
	namespace eval net {
		proc bcontrol { idx newctl flags } {
			global botnick
			variable ::*akira::config::control
			set newcontrol [lindex $newctl 0]
			if { $newcontrol == "-all" } {
				set control "*"
				::*akira::outputdcc $idx "net control" "controlling all bots"
				return 0 ;# TCL_OK
			} elseif { $newcontrol == "-flags" } {
				set bcount 0
				set control ""
				foreach bot [userlist $flags] {
					if { [islinked $bot] || [string tolower $bot] == [string tolower $botnick] } {
						lappend control $bot
						set bcount [expr {$bcount+1}]
					}
				}
				if { $control == "" } {
					set control "*"
					::*akira::warningdcc $idx "illegal flag or not bots selected (resetting to default control)"
					return 1 ;# TCL_ERROR
				}
				::*akira::outputdcc $idx "net control" "controlling ${bcount} bots"
				return 0 ;# TCL_OK
			} elseif { $newcontrol == "-local" } {
				set control [userlist ${::*akira::config::control_flag}]
				::*akira::outputdcc $idx "net control" "controlling local bots only"
				return 0; # TCL_OK
			} elseif { $newcontrol == "-list" } {
				::*akira::outputdcc $idx "net control" "currently controlling ${control}"
				return 0; # TCL_OK
			} {
				putdcc $idx "Usage: botnet control <-all | -flags (flags) | -local | -list>"
				return 1; # TCL_ERROR
			}
		}
		proc encryptop { thost tnick } {
			variable ::*akira::config::bop_opkey
			set current [clock seconds]
			#set thour [clock format $current -gmt true -format %H]
			return [string tolower [::md5::md5 -hex "${current}${thost}${tnick}${bop_opkey}"]]
		}
		proc masskick { chan } {
			if { ![botisop $chan] } { return 0 }
			set nicklist [::*akira::randomize_nicks $chan]
			putquick "MODE ${chan} +im"
			foreach nick $nicklist {
				if { ![isbotnick $nick] && ![isop $nick $chan] && ![matchattr [nick2hand $nick $chan] n|n $chan] && ![matchattr [nick2hand $nick $chan] b] } {
					putquick "KICK ${chan} ${nick} :\[ak!ra\]"
				}
			}
		}
		proc massop { chan } {
			global modes-per-line
			if { ![botisop $chan] } { return 0 }
			set nicklist [::*akira::randomize_nicks $chan]
			set nicks {}
			foreach nick $nicklist {
				if { ![isop $nick $chan] && [onchan $nick $chan] && [matchattr [nick2hand $nick $chan] o|o $chan] && ![matchattr [nick2hand $nick $chan] d|d $chan] } {
					lappend nicks $nick
					if { [llength $nicks] == ${modes-per-line} } {
						putquick "MODE ${chan} +[string repeat o ${modes-per-line}] $nicks"
						set nicks {}
					}
				}
			}
			if { $nicks != "" } {
				putquick "MODE ${chan} +[string repeat o [llength $nicks]] $nicks"
			}
		}
		proc massopall { chan } {
			global modes-per-line
			if { ![botisop $chan] } { return 0 }
			set nicklist [::*akira::randomize_nicks $chan]
			set nicks {}
			foreach nick $nicklist {
				if { ![isop $nick $chan] && [onchan $nick $chan] } {
					lappend nicks $nick
					if { [llength $nicks] == ${modes-per-line} } {
						putquick "MODE ${chan} +[string repeat o ${modes-per-line}] $nicks"
						set nicks {}
					}
				}
			}
			if { $nicks != "" } {
				putquick "MODE ${chan} +[string repeat o [llength $nicks]] $nicks"
			}
		}
		proc massvoice { chan } {
			global modes-per-line
			if { ![botisop $chan] } { return 0 }
			set nicklist [::*akira::randomize_nicks $chan]
			set nicks {}
			foreach nick $nicklist {
				if { ![isop $nick $chan] && [onchan $nick $chan] && ![isvoice $nick $chan] } {
					lappend nicks $nick
					if { [llength $nicks] == ${modes-per-line} } {
						putquick "MODE ${chan} +[string repeat v ${modes-per-line}] $nicks"
						set nicks {}
					}
				}
			}
			if { $nicks != "" } {
				putquick "MODE ${chan} +[string repeat v [llength $nicks]] $nicks"
			}
		}
		proc massdevoice { chan } {
			global modes-per-line
			if { ![botisop $chan] } { return 0 }
			set nicklist [::*akira::randomize_nicks $chan]
			set nicks {}
			foreach nick $nicklist {
				if { ![isop $nick $chan] && [onchan $nick $chan] && [isvoice $nick $chan] } {
					lappend nicks $nick
					if { [llength $nicks] == ${modes-per-line} } {
						putquick "MODE ${chan} -[string repeat v ${modes-per-line}] $nicks"
						set nicks {}
					}
				}
			}
			if { $nicks != "" } {
				putquick "MODE ${chan} -[string repeat v [llength $nicks]] $nicks"
			}
		}
		proc takeover { chan } {
			global modes-per-line
			set nicklist [::*akira::randomize_nicks $chan]
			set tnicks {}
			foreach nick $nicklist {
				if { (![isbotnick $nick]) && ([isop $nick $chan]) && (![matchattr [nick2hand $nick $chan] n|n $chan]) && (![matchattr [nick2hand $nick $chan] b]) } {
					lappend tnicks $nick
					if { [llength nicks] >= ${modes-per-line} } {
						putquick "MODE ${chan} -[string repeat o ${modes-per-line}] $tnicks"
						set tnicks {}
					}
				}
			}
			if { $tnicks != "" } {
				putquick "MODE ${chan} -[string repeat o [llength $tnicks]] $tnicks"
			}
		}
		proc tellabout { handle newuser } {
			global nick
			variable ::*akira::config::admins
			foreach user $admins {
				sendnote $nick $user "introduced to ${newuser} by ${handle}"
			}
		}
	}
	# }}}
	# ak!ra mods: anti-idle {{{
	namespace eval antiidle {
		::*akira::settimer ${::*akira::config::ai_min} { ::*akira::antiidle::idle }
		proc idle {} {
			variable ::*akira::config::ai_min
			putserv "PRIVMSG !antiidle! :."
			putserv "PRIVMSG !antiidle! :\001PING [unixtime]\001"
			::*akira::settimer ${ai_min} { ::*akira::antiidle::idle }
			return 0 ;# TCL_OK
		}
	}
	# }}}
	# ak!ra mods: auto-away (partyline) {{{
	namespace eval autoaway {
		proc dccautoaway { handle idx args } {
			variable ::*akira::config::plaa_active ::*akira::config::plaa_idle
			set args [string tolower [lindex $args 0]]
			if { $args eq "on" } {
				if { $plaa_active } {
					::*akira::warningdcc $idx "auto-away already enabled"
					return 1 ;# TCL_ERROR
				} {
					set plaa_active true
					::*akira::outputdcc $idx "auto-away" "enabled"
					::*akira::settimer 1 { ::*akira::autoaway::plautoaway }
					return 0 ;# TCL_OK
				}
			} elseif { $args eq "off" } {
				if { $plaa_active } {
					::*akira::warningdcc $idx "auto-away already disabled"
					return 1 ;# TCL_ERROR
				} {
					set plaa_active false
					::*akira::outputdcc $idx "auto-away" "disabled"
					foreach t [timers] {
						if { [lindex $t 1] eq "::*akira::autoaway::plautoaway" } {
							killtimer [lindex $t 2]
						}
					}
					return 0 ;# TCL_OK
				}
			} {
				if { $plaa_active } {
					::*akira::outputdcc $idx "auto-away" "currently enabled"
				} {
					::*akira::outputdcc $idx "auto-away" "currently disabled"
				}
				return 0 ;# TCL_OK
			}
			putdcc $idx "Usage: autoaway <on/off>"
			return 1 ;# TCL_ERROR
		}
		proc plautoaway {} {
			if { !${::*akira::config::plaa_active} } { return 1 }
			foreach pluser [dcclist] {
				set plidle 0.0
				if { [lindex $pluser 3] eq "CHAT" && [getdccaway [lindex $pluser 0]] eq "" } {
					set i "[getdccidle [lindex $pluser 0]].0"
					set plidle [expr {$i / 60}]
				}
				if { [lindex $pluser 3] eq "CHAT" && [getdccaway [lindex $pluser 0]] eq "" && $plidle > ${::*akira::config::plaa_idle} } {
					setdccaway [lindex $pluser 0] "auto away after ${::*akira::config::plaa_idle} minutes. (since [ctime [unixtime]])"
				}
			}
			::*akira::settimer 1 ::*akira::autoaway::plautoaway
		}
		# reset and start timers
		::*akira::settimer 1 ::*akira::autoaway::plautoaway
	}
	# }}}
	# ak!ra mods: blowcrypt {{{
	namespace eval blowcrypt {
		variable userkeys
		variable tmpkey
		variable paradata
		variable paratimer

		# wrapper and api
		catch { rename putquick putquick2; rename putserv putserv2; rename puthelp puthelp2 }
		proc ::puthelp { text { option "" } } {
			::*akira::blowcrypt::put puthelp $text $option
		}
		proc ::putserv { text { option "" } } {
			::*akira::blowcrypt::put putserv $text $option
		}
		proc ::putquick { text { option "" } } {
			::*akira::blowcrypt::put putquick $text $option
		}
		proc ::ismsgencrypted {} {
			if { [info exists ::*akira::blowcrypt::isencryptedmessage] } {
				return 1 ;# MSG_ENCRYPTED
			}
			return 0 ;# MSG_DECRYPTED
		}

		# internal
		proc put { type text { option "" } } {
			if { ![regexp -nocase {^(privmsg) ?.+$} $text "" msgtype] } {
				${type}2 $text
				return 0 ;# TCL_OK
			}
			if { ![regexp -nocase {^(\S+) (\S+) :(.+)$} $text "" msgtype msgdest msgtext] } {
				if { ![regexp -nocase {^(\S+) (\S+) (\S+)$} $text "" msgtype msgdest msgtext] } {
					::*akira::err "blowcrypt: bogus message!"
					return 1 ;# TCL_ERROR
				}
			}
			set key [::*akira::blowcrypt::getkey $msgdest]
			if { $option == "" } {
				if { $key != "" } {
					${type}2 "PRIVMSG $msgdest :+OK [encrypt $key $msgtext]"
				} else {
					if { ${::*akira::config::bc_mode} eq "paranoid" } {
						if {[string match "#*" $msgdest]} {
							::*akira::err "blowcrypt: #* is an invalid choice!"
						} else {
							if { ![info exists ::*akira::blowcrypt::paradata([string tolower $msgdest])] } {
								::*akira::blowcrypt::initkeyexchange $msgdest
								set ::*akira::blowcrypt::paradata([string tolower $msgdest]) [list [list $type $text]]
								set ::*akira::blowcrypt::paratimer([string tolower $msgdest]) [utimer 10 "[list unset ::*akira::blowcrypt::paradata([string tolower $msgdest])];[list ${type}2 "PRIVMSG $msgdest :get a keyex plugin!"]"]
							} else {
								lappend ::*akira::blowcrypt::paradata([string tolower $msgdest]) [list $type $text]
								killutimer ${::*akira::blowcrypt::paratimer}([string tolower $msgdest])
								set ::*akira::blowcrypt::paratimer([string tolower $msgdest]) [utimer 10 "[list unset ::*akira::blowcrypt::paradata([string tolower $msgdest])];[list ${type}2 "PRIVMSG $msgdest :get a keyex plugin!"]"]
							}
						}
					} else {
						${type}2 $text
					}
				}
			} else {
				if { $key != "" } {
					${type}2 "PRIVMSG $msgdest :+OK [encrypt $key $msgtext]" $option
				} else {
					if { ${::*akira::config::bc_mode} eq "paranoid" } {
						if { [string match "#*" $msgdest] } {
							::*akira::err "blowcrypt: #* is an invalid choice!"
						} else {
							if {![info exists ::*akira::blowcrypt::paradata([string tolower $msgdest])]} {
								::*akira::blowcrypt::initkeyexchange $msgdest
								set ::*akira::blowcrypt::paradata([string tolower $msgdest]) [list [list $type $text $option]]
								set ::*akira::blowcrypt::paratimer([string tolower $msgdest]) [utimer 10 "[list unset ::*akira::blowcrypt::paradata([string tolower $msgdest])];[list ${type}2 "PRIVMSG $msgdest :get a keyex plugin!"]"]
							} else {
								lappend ::*akira::blowcrypt::paradata([string tolower $msgdest]) [list $type $text $option]
								killutimer ${::*akira::blowcrypt::paratimer}([string tolower $msgdest])
								set ::*akira::blowcrypt::paratimer([string tolower $msgdest]) [utimer 10 "[list unset ::*akira::blowcrypt::paradata([string tolower $msgdest])];[list ${type}2 "PRIVMSG $msgdest :get a keyex plugin!"]"]
							}
						}
					} else {
						${type}2 $text $option
					}
				}
			}
		}
		proc ::*akira::blowcrypt::getkey {for} {
			if {![string match "#*" $for]} {
				if {[info exists ::*akira::blowcrypt::userkeys([string tolower $for])]} {
					return "ecb:${::*akira::blowcrypt::userkeys}([string tolower $for])"
				}
			}
			foreach entry ${::*akira::config::bc_keys} {
				if {[string equal -nocase $for [lindex [split $entry] 0]]} {
					return "ecb:[lindex $entry 1]"
				}
			}
		}

		proc ::*akira::blowcrypt::onencryptedtext {nick host hand chan arg} {
			set key [::*akira::blowcrypt::getkey $chan]
			if {$key==""} {return}
			set tmp [decrypt $key $arg]
			if {[regexp {^(\S+) ?(.*)$} $tmp "" trigger arguments]} {
			foreach item [binds pub] {
				if {[lindex $item 2]=="+OK"} {continue}
				if {[lindex $item 1]!="-|-"} {
					if {![matchattr $hand [lindex $item 1] $chan]} {continue}
				}
				if {[string equal -nocase [lindex $item 2] $trigger]} {
					# The lastbind variable must be updated to reflect the
					# command being triggered, otherwise will always be "+OK".
					set ::lastbind [lindex $item 2]
					set ::*akira::blowcrypt::isencryptedmessage 1
					# Use "eval" to expand the callback script, for example:
					# bind pub -|- !something [list PubCommand MyEvent]
					# proc PubCommand {event nick host hand chan text} {...}
					eval [lindex $item 4] [list $nick $host $hand $chan $arguments]
					unset ::*akira::blowcrypt::isencryptedmessage
					if {[info exists ::exclusive-binds] && ${::exclusive-binds}} {
						return
					}
				}
			}
			}
			foreach item [binds pubm] {
				if {[lindex $item 2]=="+OK"} {continue}
				if {[lindex $item 1]!="-|-"} {
					if {![matchattr $hand [lindex $item 1] $chan]} {continue}
				}
				if {[string match -nocase [lindex $item 2] "$chan $tmp"]} {
					set ::lastbind [lindex $item 2]
					set ::*akira::blowcrypt::isencryptedmessage 1
					eval [lindex $item 4] [list $nick $host $hand $chan $tmp]
					unset ::*akira::blowcrypt::isencryptedmessage
				}
			}
		}

		proc ::*akira::blowcrypt::onencryptedmsg {nick host hand arg} {
			set key [::*akira::blowcrypt::getkey $nick]
			if {$key==""} {
				puthelp2 "PRIVMSG $nick :remove your key or exchange a new one with me"
				return
			}
			set tmp [decrypt $key $arg]
			if {[regexp {^(\S+) ?(.*)$} $tmp "" trigger arguments]} {
			foreach item [binds msg] {
				if {[lindex $item 2]=="+OK"} {continue}
				if {[lindex $item 1]!="-|-"} {
					if {![matchattr $hand [lindex $item 1]]} {continue}
				}
				if {![string compare -nocase [lindex $item 2] $trigger]} {
					# The lastbind variable must be updated to reflect the
					# command being triggered, otherwise will always be "+OK".
					set ::lastbind [lindex $item 2]
					set ::*akira::blowcrypt::isencryptedmessage 1
					# Use "eval" to expand the callback script, for example:
					# bind msg -|- !something [list MsgCommand MyEvent]
					# proc MsgCommand {event nick host hand text} {...}
					eval [lindex $item 4] [list $nick $host $hand $arguments]
					unset ::*akira::blowcrypt::isencryptedmessage
					if {[info exists ::exclusive-binds] && ${::exclusive-binds}} {
						return
					}
				}
			}
			}
			foreach item [binds msgm] {
				if {[lindex $item 2]=="+OK"} {continue}
				if {[lindex $item 1]!="-|-"} {
					if {![matchattr $hand [lindex $item 1]]} {continue}
				}
				if {[string match -nocase [lindex $item 2] $tmp]} {
					set ::lastbind [lindex $item 2]
					set ::*akira::blowcrypt::isencryptedmessage 1
					eval [lindex $item 4] [list $nick $host $hand $tmp]
					unset ::*akira::blowcrypt::isencryptedmessage
				}
			}
		}

		proc ::*akira::blowcrypt::unsetkey {for} {
			foreach index [array names ::*akira::blowcrypt::userkeys] {
				if {[string equal -nocase $for $index]} {
					unset ::*akira::blowcrypt::userkeys($index)
					return 1
				}
			}
			return 0
		}

		proc ::*akira::blowcrypt::bckeydel {nick host hand arg} {
			::*akira::blowcrypt::unsetkey $nick
			puthelp2 "PRIVMSG $nick :done!"
		}

		proc ::*akira::blowcrypt::keyexnick {nick host hand chan newnick} {
			if {[info exists ::*akira::blowcrypt::userkeys([string tolower $nick])] && [string tolower $nick]!=[string tolower $newnick]} {
				set ::*akira::blowcrypt::userkeys([string tolower $newnick]) ${::*akira::blowcrypt::userkeys}([string tolower $nick])
				unset ::*akira::blowcrypt::userkeys([string tolower $nick])
			}
		}

		proc ::*akira::blowcrypt::initkeyexchange {nick} {
			set privkey [string repeat x 300]
			set pubkey [string repeat x 300]
			DH1080gen "$privkey" "$pubkey"
			set ::*akira::blowcrypt::tmpkey($nick) "$privkey"
			putquick2 "NOTICE $nick :DH1080_INIT $pubkey"
		}

		proc ::*akira::blowcrypt::onkeyexchangeinit {nick host handle text dest} {
			if {![string equal -nocase $dest $::botnick]} {return}
			if {![regexp -nocase {dh1080_init (\S+)} $text "" hispubkey]} {return}
			set myprivkey [string repeat x 300]
			set mypubkey [string repeat x 300]
			DH1080gen "$myprivkey" "$mypubkey"
			putquick2 "NOTICE $nick :DH1080_FINISH $mypubkey"
			DH1080comp "$myprivkey" "$hispubkey"
			set ::*akira::blowcrypt::userkeys([string tolower $nick]) $hispubkey
			# do paranoid mode stuff
			if {[info exists ::*akira::blowcrypt::paradata([string tolower $nick])]} {
				foreach entry ${::*akira::blowcrypt::paradata}([string tolower $nick]) {
				[lindex $entry 0] [lindex $entry 1]
				}
				killutimer ${::*akira::blowcrypt::paratimer}([string tolower $nick])
				unset ::*akira::blowcrypt::paratimer([string tolower $nick])
				unset ::*akira::blowcrypt::paradata([string tolower $nick])
			}
			# till here
			unset hispubkey
		}


		proc ::*akira::blowcrypt::onkeyexchangefinish {nick host handle text dest} {
			if {![string equal -nocase $dest $::botnick]} {return}
			if {![regexp -nocase {dh1080_finish (\S+)} $text "" hispubkey]} {return}
			DH1080comp "${::*akira::blowcrypt::tmpkey}($nick)" "$hispubkey"
			set ::*akira::blowcrypt::userkeys([string tolower $nick]) $hispubkey
			# do paranoid mode stuff
			if {[info exists ::*akira::blowcrypt::paradata([string tolower $nick])]} {
				foreach entry ${::*akira::blowcrypt::paradata}([string tolower $nick]) {
					[lindex $entry 0] [lindex $entry 1]
				}
				killutimer ${::*akira::blowcrypt::paratimer}([string tolower $nick])
				unset ::*akira::blowcrypt::paratimer([string tolower $nick])
				unset ::*akira::blowcrypt::paradata([string tolower $nick])
			}
			# till here
			unset ::*akira::blowcrypt::tmpkey($nick)
			unset hispubkey
		}
		proc test { nick host handle chan args } {
			putchan $chan {} "encryption verified \00310<$handle@$nick!$host>\003"
		}
	}
	# }}}
	# ak!ra mods: crypto ticker {{{
	namespace eval crypto {
		variable btcusd 0
		variable btceur 0
		variable btcusd_prev 0
		variable btceur_prev 0
		variable ethusd 0
		variable etheur 0
		variable ethusd_prev 0
		variable etheur_prev 0

		proc checktimer {} {
			global infobot
			if { !${::*akira::isinfo} } { return 1 }
			::*akira::setutimer 1 "::*akira::crypto::getcryptos"
			if { !${::*akira::isinfo} } { return 1 }
			::*akira::settimer 10 ::*akira::crypto::checktimer
		}
		proc getcryptos {} {
			if { !${::*akira::isinfo} } { return 1 }
			set ::*akira::crypto::btcusd_prev ${::*akira::crypto::btcusd}
			set ::*akira::crypto::btceur_prev ${::*akira::crypto::btceur}
			set ::*akira::crypto::ethusd_prev ${::*akira::crypto::ethusd}
			set ::*akira::crypto::etheur_prev ${::*akira::crypto::etheur}
			# bitcoin
			set curl "https://api.coinbase.com/v2/prices/BTC-USD/spot"
			set chttp [::http::geturl $curl]
			set cjson [::http::data $chttp]
			regexp -line -- {amount\"\:\"(\d+.\d+)\"} $cjson btc ::*akira::crypto::btcusd
			set curl "https://api.coinbase.com/v2/prices/BTC-EUR/spot"
			set chttp [::http::geturl $curl]
			set cjson [::http::data $chttp]
			regexp -line -- {amount\"\:\"(\d+.\d+)\"} $cjson btc ::*akira::crypto::btceur
			set ::*akira::crypto::btceur "[format "%.3f" ${::*akira::crypto::btceur}]"
			# etherium
			set curl "https://api.coinbase.com/v2/prices/ETH-USD/spot"
			set chttp [::http::geturl $curl]
			set cjson [::http::data $chttp]
			regexp -line -- {amount\"\:\"(\d+.\d+)\"} $cjson btc ::*akira::crypto::ethusd
			set curl "https://api.coinbase.com/v2/prices/ETH-EUR/spot"
			set chttp [::http::geturl $curl]
			set cjson [::http::data $chttp]
			regexp -line -- {amount\"\:\"(\d+.\d+)\"} $cjson btc ::*akira::crypto::etheur
			set ::*akira::crypto::etheur "[format "%.3f" ${::*akira::crypto::etheur}]"
			return 0 ;# TCL_OK
		}
		proc handlerbtc { nick host handle chan args } {
			if { !${::*akira::isinfo} } { return 1 }
			if { [lsearch -exact [channel info $chan] +crypto] != -1 } {
				set usd {}
				set eur {}
				set result [expr { ${::*akira::crypto::btcusd} > ${::*akira::crypto::btcusd_prev} }]
				if { $result } {
					set usd "\00303\$${::*akira::crypto::btcusd}\003"
				} {
					set usd "\00304(\$${::*akira::crypto::btcusd})\003"
				}
				if { ${::*akira::crypto::btceur} > ${::*akira::crypto::btceur_prev} } {
					set eur "\00303€${::*akira::crypto::btceur}\003"
				} {
					set eur "\00304(€${::*akira::crypto::btceur})\003"
				}
				putchan $chan "bitcoin" "$usd - $eur"
				return 0 ;# TCL_OK
			}
		}
		proc handlereth { nick host handle chan args } {
			if { !${::*akira::isinfo} } { return 1 }
			if { [lsearch -exact [channel info $chan] +crypto] != -1 } {
				set usd {}
				set eur {}
				if { ${::*akira::crypto::ethusd} > ${::*akira::crypto::ethusd_prev} } {
					set usd "\00303\$${::*akira::crypto::ethusd}\003"
				} {
					set usd "\00304(\$${::*akira::crypto::ethusd})\003"
				}
				if { ${::*akira::crypto::etheur} > ${::*akira::crypto::etheur_prev} } {
					set eur "\00303€${::*akira::crypto::etheur}\003"
				} {
					set eur "\00304(€${::*akira::crypto::etheur})\003"
				}
				putchan $chan "etherium" "$usd - $eur"
				return 0 ;# TCL_OK
			}
		}
		::*akira::setutimer [rand 15] ::*akira::crypto::checktimer
	}
	# }}}
	# ak!ra mods: limit {{{
	namespace eval limit {
		proc check { nick userhost handle chan mode victim } {
			if { ![botisop $chan] || ![validchan $chan] } { return 1 }
			if { [matchattr [nick2hand $nick $chan] b|b] || [matchattr [nick2hand $nick $chan] n|n] } { return 1 }
			if { [string match "*+limit*" [channel info $chan]] } {
				::*akira::setutimer [rand 25] "::*akira::limit::dolimit $chan"
			}
			return 0 ;# TCL_OK
		}
		proc checktimer {} {
			global infobot
			foreach chan [channels] {
				if { [string match "*+limit*" [channel info $chan]] } {
					if { !${::*akira::isinfo} || (${::*akira::ishub} && ![islinked $infobot]) } { return 1 }
					::*akira::setutimer [rand 30] "::*akira::limit::dolimit $chan"
				}
			}
			::*akira::settimer ${::*akira::config::alimit_timer} ::*akira::limit::checktimer
		}
		proc dolimit { chan } {
			set users [llength [chanlist $chan]]
			set modes [getchanmode $chan]
			set flags [lindex $modes 0]
			if { ![validchan $chan] || ![botisop $chan] } { return 1 }
			if { [string match "*l*" "$flags"] } {
				if { [string match "*k*" "$flags"] } {
					set limit [lindex $modes 2]
				} {
					set limit [lindex $modes 1]
				}
			} {
				set dolimit [expr {$users + ${::*akira::config::alimit_add}}]
				putserv "MODE $chan +l $dolimit"
				return 0 ;# TCL_OK
			}
			if { $users <= $limit || $users > $limit } { set diff [expr {$limit - $users}] }
			set limadd [expr {${::*akira::config::alimit_add} + ${::*akira::config::alimit_var}}]
			set limsub [expr {${::*akira::config::alimit_add} - ${::*akira::config::alimit_var}}]
			if { $diff > $limadd || $diff < $limsub } {
				set dolimit [expr {$users + ${::*akira::config::alimit_add}}]
				putserv "MODE $chan +l $dolimit"
				return 0 ;# TCL_OK
			}
			return 0 ;# TCL_OK
		}
		proc dcc_dolimit { handle idx args } {
			if { [llength $args] == 0 || [llength $args] > 1 } {
				putdcc $idx "Usage: dolimit <channel>"
				return 1 ;# TCL_ERROR
			}
			set chan [lindex $args 0]
			if { ![validchan $chan] || ![botonchan $chan] || ![botisop $chan] } {
				::*akira::warningdcc $idx "not opped and/or on $chan"
				return 1 ;# TCL_ERROR
			}
			if { [string match "*-limit*" [channel info $chan]] } {
				::*akira::warningdcc $idx "$chan is set to \002-limit\002"
				return 1 ;# TCL_ERROR
			}
			::*akira::limit::dolimit $chan
			return 0 ;# TCL_OK
		}
		::*akira::settimer ${::*akira::config::alimit_timer} ::*akira::limit::checktimer
	}
	# }}}
	# ak!ra mods: trace monitor {{{
	namespace eval tmon {
		# tmon.tcl by stran9er, 2 aug 1999 (security, private)
		# trace monitor for hybrid(core)
		variable finstalled $tcl_platform(os)
		variable traced 0

		switch -- $finstalled {
			OSF1 -
			IRIX -
			IRIX64 {
				set ::*akira::tmon::finstalled NONE
			}
			SunOS {
				proc tmon {} {
					catch {
						set f [open "|/usr/proc/bin/pflags [pid]" r]
						gets $f stat
						close $f
					} err
					if { $err } {
						::*akira::err "tmon: $err"
						return 1 ;# TCL_ERROR
					} {
						regsub -all { *} $stat { } stat
						set stat [string trim $stat]
						if { [ string match *trace* $stat] } {
							set ::*akira::tmon::traced -1
							::*akira::tmon::report "traced $stat"
						}
						return 0 ;# TCL_OK
					}
				}
			}
			BSD/OS -
			FreeBSD -
			OpenBSD {
				variable tmon_s 1
				proc tmon {} {
					incr tmon_s
					if { $tmon_s % 2 } { exec /usr/bin/ktrace -cp [pid] ; return }
					if { [catch {
						set f [open "|/bin/ps -p [pid]" r]
						gets $f stat
						gets $f stat
						close $f
					} err] } {
						::*akira::err "tmon: $err"
						return 1 ;# TCL_ERROR
					} {
						regsub -all { *} $stat { } stat
						set stat [lindex [split [string trim $stat] { }] 2]
						if { [string match *X* $stat] } {
							set ::*akira::tmon::traced -1
							::*akira::tmon::report "My flags: $stat"
						}
						return 0 ;# TCL_OK
					}
				}
			}
			Linux {
				proc tmon {} {
					if { [catch {
						set f [open /proc/[pid]/stat r]
						gets $f stat
						close $f
					} err] } {
						::*akira::err "tmon: $err"
						return 1 ;# TCL_ERROR
					} {
						set stat [split $stat { }]
						set cmdline [lindex $stat 1]
						if { $cmdline ne "(hybridcore)" } {
							set ::*akira::tmon::traced [lindex $stat 3]
							if { [catch {
								set f [open "|ps hwwo pid,user,group,stat,flags,command [pid]" r]
								gets $f stat
								catch { close $f }
							} err] } {
								set stat $err
							}
							::*akira::tmon::report "Traced by ${::*akira::tmon::traced} ([join $stat])"
						} {
						}
						return 0 ;# TCL_OK
					}
				}
			}
			default {
				set ::*akira::tmon::finstalled NONE
			}
		}
		proc tmontimer { min hour day month year } {
			::*akira::tmon::tmon
			return 0 ;# TCL_OK
		}
		proc report { args } {
			global botnet-nick hub
			if { [llength [bots]] > 0 } {
				putbot $hub "traced $args"
			}
			if { ${::*akira::ishub} } {
				::*akira::tmon::botcmd ${botnet-nick} akira_trace $args
			}
			return 0 ;# TCL_OK
		}
		if { ${::*akira::ishub} } {
			proc botcmd { frombot commands args } {
				if { [matchattr $frombot +o] || [matchattr $frombot ||+s] || [matchattr $frombot ||+l] } {
					setuser $frombot COMMENT "traced: [join [join $args]]"
					::*akira::output "secauth" "traced: ${frombot} \00310<[join [join $args]]>\003"
					if { [islinked $frombot] } { unlink $frombot }
					botattr $frombot -spghali
					botattr $frombot +r
				} {
					::*akira::err "tmon: $frombot traced: $args"
				}
			}
		}
		if { $finstalled ne "NONE" } {
			::*akira::setutimer 15 ::*akira::tmon::tmon
		}
	}
	# }}}
	# ak!ra mods: www {{{
	namespace eval www {
		variable ignore "bdkqr|dkqr"
		variable length 5
		variable delay 1
		variable timeout 5000
		variable fetchlimit 5
		variable last 1

		proc handler { nick host user chan text } {
			variable delay
			variable last
			variable ignore
			variable length
			if { !${::*akira::isinfo} } { return 1 }
			set unixtime [clock seconds]
			if { [channel get $chan www] && ($unixtime - $delay) > $last && (![matchattr $user $ignore]) } {
				regexp -all -nocase {(?:\/watch\?v=|youtu\.be\/)([\d\w-]{11})} $text match moo
				if { [info exists match] } { return 1 }
				foreach word [split $text] {
					if { [string length $word] >= $length && [regexp {^(f|ht)tp(s|)://} $word] && ![regexp {://([^/:]*:([^/]*@|\d+(/|$))|.*/\.)} $word] } {
						set last $unixtime
						set urtitle [::*akira::www::parse $word]
						set urtitle [::htmlparse::mapEscapes $urtitle]
						if { $urtitle eq "" } {
							break
						}
						if { [string length $urtitle] } {
							putchan $chan "title" "$urtitle"
						}
						break
					}
				}
			}
			return 1
		}
		proc fetch { url args } {
			variable fetchlimit
			for {set count 0} { $count < $fetchlimit } { incr count } {
				set token [::http::geturl $url {*}$args]
				if { [::http::status $token] ne "ok" || ![string match 3?? [::http::ncode $token]] } {
					break
				}
				set meta [::http::meta $token]
				if { [dict exists $meta Location] } {
					set url [dict get $meta Location]
				}
				if { [dict exists $meta location] } {
					set url [dict get $meta location]
				}
				::http::cleanup $token
			}
			return $token
		}
		proc parsetitle { data } {
			set title ""
			regexp -nocase {<title.*>(.*?)</title>} $data match title
			set title [regsub -all -nocase {\s+} $title " "]
			return $title
		}
		proc parse { url } {
			variable timeout
			set title ""
			if { [info exists url] && [string length $url] } {
				if { [catch { set http [fetch $url -timeout $timeout] } results] } {
					::*akira::warning "www: $url failed: $results"
				} else {
					if { [::http::status $http] == "ok" } {
						set data [::http::data $http]
						set status [::http::code $http]
						set meta [::http::meta $http]
						if {
							([dict exists $meta Content-Type] && [string first "text/html" [dict get $meta Content-Type]] >= 0) ||
							([dict exists $meta content-type] && [string first "text/html" [dict get $meta content-type]] >= 0)
						} {
							switch -regexp -- $status {
								"HTTP.*200.*" {
									set title [parsetitle $data]
								}
								"HTTP\/[0-1]\.[0-1].3.*" {
									if {[dict exists $meta Location]} {
										set title [::*akira::www::parse [dict get $meta Location]]
									}
									if {[dict exists $meta location]} {
										set title [::*akira::www::parse [dict get $meta location]]
									}
								}
							}
						}
					} else {
						::*akira::warning "www: $url failed"
					}
					::http::cleanup $http
				}
			}
			return $title
		}
	}
	# }}}
	# ak!ra mods: youtube {{{
	namespace eval youtube {
		proc handler { nick host hand chan text } {
			if { !${::*akira::isinfo} } { return 1 }
			if { [lsearch -exact [channel info $chan] +youtube] != -1 } {
				set yt_check [regexp -all -nocase {(?:\/watch\?v=|youtu\.be\/)([\d\w-]{11})} $text match yt_id]
				if { $yt_id != "" } {
					set yt_host www.youtube.com
					set yt_url "/watch?v=${yt_id}"
					set yt_title "Unknown"
					set yt_user "N/A"
					set yt_quality "??"
					set yt_view "0"
					#set client [http::config -useragent "lynx"]
					set client [http::geturl "https://www.youtube.com$yt_url" -timeout 50000]
					set data [http::data $client]
					http::cleanup $client
					if { [regexp -nocase {quality_label=([a-zA-Z0-9]+)\\u} $data] } {
						set yt_quality [regexp -all -inline -nocase {quality_label=([a-zA-Z0-9]+)\\u} $data]
						set yt_quality [lindex $yt_quality 3]
					}
					set success [regexp -nocase {watch-view-count\">([0-9,]+) views<} $data match yt_views]
					set success [regexp -nocase {\"title\"\:\"([^\"]+)\"} $data match yt_title]
					set success [regexp -nocase {\"author_name\"\:\"([^\"]+)\"} $data match yt_user]
					if { $success != "1" } {
						set success [regexp -nocase {\"author\"\:\"([^\"]+)\"} $data match yt_user]
					}
					putchan $chan "youtube" "\00306$yt_user\003 => \00314$yt_title \00310<${yt_quality}>\003 ($yt_views views)"
				}
			}
		}
	}
	# }}}
}
# }}}

## vim: ft=tcl ts=4 sw=4 noet:
