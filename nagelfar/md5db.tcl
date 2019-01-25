# This syntax definition is for the tcllib md5 package
# package require md5

set ::syntax(md5::md5) {x*}
set ::syntax(md5::hmac) {x*}
set ::syntax(md5::MD5Init) 0
set ::syntax(md5::MD5Update) 2
set ::syntax(md5::MD5Final) 1
set ::syntax(md5::HMACInit) 1
set ::syntax(md5::HMACUpdate) 2
set ::syntax(md5::HMACFinal) 1

lappend ::knownPackages md5
