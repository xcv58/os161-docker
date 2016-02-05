#!/usr/bin/env expect
proc do_exit {msg} {
    puts stderr $msg
    exit 1
}

set timeout 5
spawn docker run -ti xcv58/os161
send "bash\r"
expect "xcv58@"
send "cd os161/root; sys161 kernel\r"
expect "OS/161 kernel"
send "?\r"
expect "Next kernel heap generation"
send "q\r"
expect {
    "xcv58@" { exit 0 }
    timeout {do_exit "timed out waiting for prompt"}
}
