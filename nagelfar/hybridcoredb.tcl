# This syntax definition is for the hybridcore package
# package require hybridcore

set ::knownGlobals {botnick botname nick server serveraddress version numversion uptime lastbind isjuped handlen config configargs hub userfile chanfile server-online botnet-nick modes-per-line ctcp-version}
set ::knownCommands {
*dcc:+ban
*dcc:+bot
*dcc:+chan
*dcc:+chanrec
*dcc:+exempt
*dcc:+host
*dcc:+ignore
*dcc:+invite
*dcc:+lang
*dcc:+lsec
*dcc:+noteign
*dcc:+telnet
*dcc:+user
*dcc:-ban
*dcc:-bot
*dcc:-chan
*dcc:-chanrec
*dcc:-exempt
*dcc:-host
*dcc:-ignore
*dcc:-invite
*dcc:-lang
*dcc:-lsec
*dcc:-noteign
*dcc:-telnet
*dcc:-user
*dcc:addlog
*dcc:adduser
*dcc:away
*dcc:back
*dcc:backup
*dcc:banner
*dcc:bans
*dcc:binds
*dcc:boot
*dcc:botattr
*dcc:botinfo
*dcc:bots
*dcc:bottree
*dcc:channel
*dcc:chaninfo
*dcc:chanload
*dcc:chansave
*dcc:chanset
*dcc:chattr
*dcc:chfinger
*dcc:chhandle
*dcc:chinfo
*dcc:chnick
*dcc:chpass
*dcc:clearqueue
*dcc:comment
*dcc:console
*dcc:dccstat
*dcc:debug
*dcc:dehalfop
*dcc:deluser
*dcc:deop
*dcc:devoice
*dcc:die
*dcc:dump
*dcc:echo
*dcc:exempts
*dcc:fixcodes
*dcc:flush
*dcc:fprint
*dcc:fwd
*dcc:halfop
*dcc:handle
*dcc:help
*dcc:ignores
*dcc:info
*dcc:invite
*dcc:invites
*dcc:jump
*dcc:kick
*dcc:kickban
*dcc:language
*dcc:link
*dcc:loadmod
*dcc:lstat
*dcc:ldump
*dcc:match
*dcc:module
*dcc:modules
*dcc:newpass
*dcc:nick
*dcc:note
*dcc:noteigns
*dcc:op
*dcc:page
*dcc:quit
*dcc:rehash
*dcc:rehelp
*dcc:relang
*dcc:relay
*dcc:reload
*dcc:reset
*dcc:resetbans
*dcc:resetconsole
*dcc:resetexempts
*dcc:resetinvites
*dcc:restart
*dcc:save
*dcc:servers
*dcc:set
*dcc:status
*dcc:stick
*dcc:store
*dcc:strip
*dcc:tcl
*dcc:telnet
*dcc:topic
*dcc:trace
*dcc:traffic
*dcc:unlink
*dcc:unloadmod
*dcc:unstick
*dcc:uptime
*dcc:vbottree
*dcc:voice
*dcc:whoami
*dcc:whois
*dcc:whom
}

set ::syntax(putserv) {x p*}
set ::option(putserv) {-next -normal}
set ::syntax(puthelp) {x p*}
set ::option(puthelp) {-next -normal}
set ::syntax(putquick) {x p*}
set ::option(putquick) {-next -normal}
set ::syntax(putnow) {x p*}
set ::option(putnow) {-online}
set ::syntax(putkick) {r 2 3}
set ::syntax(putlog) 1
set ::syntax(putcmdlog) 1
set ::syntax(putxferlog) 1
set ::syntax(putloglev) 3
set ::syntax(dumpfile) 2
set ::syntax(queuesize) {r 0 1}
set ::syntax(clearqueue) 1
set ::syntax(countusers) 0
set ::syntax(validuser) 1
set ::syntax(finduser) 1
set ::syntax(userlist) {r 0 2}
set ::syntax(passwdok) 2
set ::syntax(getuser) {r 1 4}
set ::syntax(setuser) {r 1 4}
set ::syntax(chhandle) 2
set ::syntax(chattr) {r 1 3}
set ::syntax(botattr) {r 1 3}
set ::syntax(matchattr) {r 2 3}
set ::syntax(adduser) {r 1 2}
set ::syntax(addbot) {r 2 4}
set ::syntax(deluser) 1
set ::syntax(delhost) 2
set ::syntax(addchanrec) 2
set ::syntax(delchanrec) 2
set ::syntax(haschanrec) 2
set ::syntax(getchaninfo) 2
set ::syntax(setchaninfo) 2
set ::syntax(newchanban) {r 4 6}
set ::syntax(newban) {r 3 5}
set ::syntax(newchanexempt) {r 4 6}
set ::syntax(newexempt) {r 3 5}
set ::syntax(newchaninvite) {r 4 6}
set ::syntax(newinvite) {r 3 5}
set ::syntax(stickban) {r 1 2}
set ::syntax(unstickban) {r 1 2}
set ::syntax(stickexempt) {r 1 2}
set ::syntax(unstickexempt) {r 1 2}
set ::syntax(stickinvite) {r 1 2}
set ::syntax(unstickinvite) {r 1 2}
set ::syntax(killchanban) 2
set ::syntax(killban) 1
set ::syntax(killchanexempt) 2
set ::syntax(killexempt) 1
set ::syntax(killchaninvite) 2
set ::syntax(killinvite) 1
set ::syntax(ischanjuped) 1
set ::syntax(isban) {r 1 2}
set ::syntax(ispermban) {r 1 2}
set ::syntax(isexempt) {r 1 2}
set ::syntax(ispermexempt) {r 1 2}
set ::syntax(isinvite) {r 1 2}
set ::syntax(isperminvite) {r 1 2}
set ::syntax(isbansticky) {r 1 2}
set ::syntax(isexemptsticky) {r 1 2}
set ::syntax(isinvitesticky) {r 1 2}
set ::syntax(matchban) {r 1 2}
set ::syntax(matchexempt) {r 1 2}
set ::syntax(matchinvite) {r 1 2}
set ::syntax(banlist) {r 0 1}
set ::syntax(exemptlist) {r 0 1}
set ::syntax(invitelist) {r 0 1}
set ::syntax(newignore) {r 3 4}
set ::syntax(killignore) 1
set ::syntax(ignorelist) 0
set ::syntax(isignore) 1
set ::syntax(save) 0
set ::syntax(reload) 0
set ::syntax(backup) 0
set ::syntax(getting-users) 0
set ::syntax(channel) {s x*}
set ::subCmd(channel) "add set info get remove"
set ::syntax(channel\ add) {r 1 2}
set ::syntax(channel\ set) {x*}
set ::syntax(channel\ info) 1
set ::syntax(channel\ get) {x*}
set ::syntax(channel\ remove) 1
set ::syntax(savechannels) 0
set ::syntax(loadchannels) 0
set ::syntax(channels) 0
set ::syntax(channame2dname) 1
set ::syntax(chandname2name) 1
set ::syntax(isbotnick) 1
set ::syntax(botisop) {r 0 1}
set ::syntax(botishalfop) {r 0 1}
set ::syntax(botisvoice) {r 0 1}
set ::syntax(botonchan) {r 0 1}
set ::syntax(isop) {r 1 2}
set ::syntax(ishalfop) {r 1 2}
set ::syntax(wasop) 2
set ::syntax(washalfop) 2
set ::syntax(isvoice) {r 1 2}
set ::syntax(onchan) {r 1 2}
set ::syntax(nick2hand) {r 1 2}
set ::syntax(hand2nick) {r 1 2}
set ::syntax(handonchan) {r 1 2}
set ::syntax(ischanban) 2
set ::syntax(ischanexempt) 2
set ::syntax(ischaninvite) 2
set ::syntax(chanbans) 1
set ::syntax(chanexempts) 1
set ::syntax(chaninvites) 1
set ::syntax(resetbans) 1
set ::syntax(resetexempts) 1
set ::syntax(resetinvites) 1
set ::syntax(resetchanidle) {r 1 2}
set ::syntax(resetchanjoin) {r 1 2}
set ::syntax(resetchan) {r 1 2}
set ::syntax(getchanhost) {r 1 2}
set ::syntax(getchanjoin) 2
set ::syntax(onchansplit) {r 1 2}
set ::syntax(chanlist) {r 1 2}
set ::syntax(getchanidle) 2
set ::syntax(getchanmode) 1
set ::syntax(jump) {r 0 3}
set ::syntax(pushmode) {x*}
set ::syntax(flushmode) 1
set ::syntax(topic) 1
set ::syntax(validchan) 1
set ::syntax(isdynamic) 1
set ::syntax(setudef) 2
set ::syntax(renudef) 2
set ::syntax(getudefs) {r 0 1}
set ::syntax(chansettype) 1
set ::syntax(putdcc) {x x p*}
set ::option(putdcc) {-raw}
set ::syntax(dccbroadcast) 1
set ::syntax(dccputchan) 2
set ::syntax(boot) {r 1 2}
set ::syntax(dccsimul) 2
set ::syntax(hand2idx) 1
set ::syntax(idx2hand) 1
set ::syntax(valididx) 1
set ::syntax(getchan) 1
set ::syntax(setchan) 2
set ::syntax(console) {r 1 3}
set ::syntax(resetconsole) 1
set ::syntax(echo) {r 1 2}
set ::syntax(strip) {r 1 2}
set ::syntax(putbot) 2
set ::syntax(putallbots) 1
set ::syntax(killdcc) 1
set ::syntax(bots) 0
set ::syntax(botlist) 0
set ::syntax(islinked) 1
set ::syntax(dccused) 0
set ::syntax(dcclist) {r 0 1}
set ::syntax(whom) 1
set ::syntax(getdccidle) 1
set ::syntax(getdccaway) 1
set ::syntax(setdccaway) 2
set ::syntax(connect) 2
set ::syntax(listen) {r 1 4}
set ::syntax(dccdumpfile) 2
# notes module
set ::syntax(notes) {r 1 2}
set ::syntax(erasenotes) 2
set ::syntax(listnotes) 2
set ::syntax(storenote) 4
# assoc module
set ::syntax(assoc) 2
set ::syntax(killassoc) 1
# compress module
set ::syntax(compressfile) {x*}
set ::syntax(uncompressfile) {r 1 2}
set ::syntax(iscompressed) 1
# filesys module
set ::syntax(setpwd) 2
set ::syntax(getpwd) 1
set ::syntax(getfiles) 1
set ::syntax(getdirs) 1
set ::syntax(dccsend) 2
set ::syntax(filesend) {r 2 3}
set ::syntax(fileresend) {r 2 3}
set ::syntax(setdesc) 3
set ::syntax(getdesc) 2
set ::syntax(setowner) 3
set ::syntax(getowner) 2
set ::syntax(setlink) 3
set ::syntax(getlink) 2
set ::syntax(getfileq) 1
set ::syntax(getfilesendtime) 1
set ::syntax(mkdir) {x*}
set ::syntax(rmdir) 1
set ::syntax(mv) 2
set ::syntax(cp) 2
set ::syntax(getflags) 1
set ::syntax(setflags) {r 1 3}
# misc commands
set ::syntax(bind) {r 3 4}
set ::syntax(unbind) 4
set ::syntax(binds) {r 0 1}
set ::syntax(logfile) {r 0 3}
set ::syntax(maskhost) {r 1 2}
set ::syntax(timer) {r 2 3}
set ::syntax(utimer) {r 2 3}
set ::syntax(timers) 0
set ::syntax(utimers) 0
set ::syntax(killtimer) 1
set ::syntax(killutimer) 1
set ::syntax(unixtime) 0
set ::syntax(duration) 1
set ::syntax(strftime) {r 1 2}
set ::syntax(ctime) 1
set ::syntax(myip) 0
set ::syntax(rand) 1
set ::syntax(control) 2
set ::syntax(sendnote) 3
set ::syntax(link) {r 1 2}
set ::syntax(unlink) 1
set ::syntax(encrypt) 2
set ::syntax(decrypt) 2
set ::syntax(encpass) 1
set ::syntax(die) {r 0 1}
set ::syntax(unames) 0
set ::syntax(dnslookup) {x*}
set ::syntax(md5) 1
set ::syntax(callevent) 1
set ::syntax(traffic) 0
set ::syntax(modules) 0
set ::syntax(loadmodule) 1
set ::syntax(unloadmodule) 1
set ::syntax(loadhelp) 1
set ::syntax(unloadhelp) 1
set ::syntax(reloadhelp) 0
set ::syntax(restart) 0
set ::syntax(rehash) 0
set ::syntax(stripcodes) 2
set ::syntax(matchaddr) 2
set ::syntax(matchcidr) 3
set ::syntax(matchstr) 2
set ::syntax(rfcequal) 2
set ::syntax(status) {r 0 1}
set ::syntax(istls) 1
set ::syntax(starttls) 1
set ::syntax(tlsstatus) 1
# hybrid(core) additions
set ::syntax(idx2ip) 1
set ::syntax(idx2host) 1
set ::syntax(host2ip) 1

lappend ::knownPackages hybridcore
