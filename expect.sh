#!/usr/bin/env expect
proc do_exit {msg} {
    puts stderr $msg
    exit 1
}

set timeout 2
spawn docker run -ti --name os161 xcv58/os161
expect "trinity@zion:"
send "cd os161/root; sys161 kernel\r"
expect "OS/161 kernel"
send "?\r"
expect "Next kernel heap generation"
send "q\r"
expect {
    "trinity1@zion:" { exit 0 }
    timeout {do_exit "timed out waiting for prompt"}
}
