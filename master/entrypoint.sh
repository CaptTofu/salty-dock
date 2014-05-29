#!/bin/bash

/usr/bin/salt-minion -d &
/usr/sbin/sshd -D $@
