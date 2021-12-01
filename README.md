![ANSI Logo](https://gitlab.com/kyaulabs/akira/raw/master/akira.ans.png "ANSI Logo")  
<a href="irc://irc.kyaulabs.com:+9999/ak!ra">irc://irc.kyaulabs.com:+9999/ak!ra</a>

[![](https://img.shields.io/badge/coded_in-vim-green.svg?logo=vim&logoColor=brightgreen&colorB=brightgreen&longCache=true&style=flat)](https://vim.org) &nbsp; [![](https://img.shields.io/badge/license-AGPL_v3-blue.svg?style=flat)](https://gitlab.com/kyaulabs/akira/blob/master/LICENSE) &nbsp; [![](https://img.shields.io/badge/hybrid\(core\)-1.8.4+-C85000.svg?style=flat)](https://gitlab.com/kyaulabs/hybridcore) &nbsp; [![](https://img.shields.io/badge/tcl-8.5+-C85000.svg?style=flat)](https://www.tcl.tk/)  
[![](https://img.shields.io/badge/pkg:http->=_2.9.0-8E68AC.svg?style=flat)](https://core.tcl.tk/tcllib/) &nbsp; [![](https://img.shields.io/badge/pkg:tls->=_1.7.11-8E68AC.svg?style=flat)](https://core.tcl.tk/tcltls/)

### About
This botnet script has been around for longer than I can remember (see History). 
The reasons for the creation of this script are two-fold. On one hand it was 
nostalgia that brought me back to IRC and bots in general (shout out to 
#majorbbs on EFnet and nexace in particular). I also had found a treasure-trove 
of botpacks from the old EFnet war days a while back that I had been meaning to 
go through for a while. On the other hand, I have been off/on IRC since '96. I 
have also been running a botnet since before I can remember. This and running 
*ahem* glftpd servers are what got me into BSD and Linux in the first place. And 
to be frank, my net was in massive need of an update.

### Features
* Secure op protection (cookies sent over botnet to verify ops)
* Trace protection for hybrid(core)
* Script stating across the net to verify all bots are using the same script
* Special "hub" and "info" bots are set globally, infobot is used for all 
channel responses
* Servers are tracked by the hub and knows which bots are on which servers
* All logs are sent to the hub bot and logged to file only on the hub
* New channel flags: `+crypto`, `+secure`, `+youtube`, `+www`
* The `+secure` channel flag is used in-place of the `+bitch` flag, it uses 
a more blunt approach to channel control, and makes sure it stays that way
* Infobot: The `+crypto` channel flag is used to display current 
crypto-currency prices from Coinbase Pro. These prices are recorded via timer on 
the back-end to reflect prices changes over 10 minute periods
* Infobot: The `+youtube` channel flag is used to respond to youtube urls 
posted in the channel, it will display the video poster, title, quality and view 
count
* Infobot: The `+www` channel flag is used to respond to any url that isn't a 
youtube url and display the title of the webpage

### Usage
This script (if named `akira.tcl` and properly encrypted) is auto-loaded by 
hybrid(core).

##### Config
Editing the configuration is relatively straight forward, provided it is the 
same across the entire net.

##### Linking Bots
In order to link bots to the botnet, first make sure every single bot is using 
the exact encrypted copy of your tcl (main tcl script file stats are checked and 
verified across the net), then use the following:

```shell
"On the HUB"
> .+bot leafbot 1.2.3.4 +2601
> .+host leafbot *!ident@hostname
> .chattr leafbot +bfopA
> .botattr leafbot +gls
> .+telnet 1.2.3.4
```

```shell
"On Each Connecting Bot"
> .+bot hub 1.2.3.4 +2600
> .+host hub *!ident@hostname
> .chattr hub +bfopA
> .botattr hub +ghp
```

### History

##### 2003-01
`tribe9.tcl` is privately released, loosely based on an original version of 
netbots.

##### 2003-11
`blackmajick.tcl v1.1d` is privately released based on a well-known private 
irc-war script from EFnet. The original script of which it was based is lost to 
memory, but I remember choosing it because it had the fastest mass 
(op/kick/etc.) commands at the time. This also contained code from the original 
`tribe9.tcl`.

##### 2017-08
`darkmage.tcl v1.032` is released publicly on GitHub based on `blackmajick.tcl`. 
Automatic channel limit control was added in this release.

##### 2017-08
`darkmage.tcl v1.035` is released. Encrypted ops (aka. cookie ops) was added in 
this release.

##### 2018-11
`darkmage.tcl v1.040` is released. YouTube url response was added as a channel 
flag in tis release. This was the final release of dark!mage.

##### 2018-12
Work begins on hybrid(core) remake and recreation of the botpack tcl.

##### 2019-01
`akira.tcl v2.053` is privately released on Gitlab. This is the complete 
refactor of the original `tribe9.tcl` and `blackmajick.tcl` (dark!mage) with 
other inspirations from `abusive.tcl`, `core.tcl`, `dacrew.tcl`, `secauth.tcl`, 
`tnt.tcl` and many many more... This script requires hybrid(core) v1.8.4 or 
newer.

##### 2021-11
The decision is made to finally release to the public, I hopefully have ironed 
out most of the major bugs.
