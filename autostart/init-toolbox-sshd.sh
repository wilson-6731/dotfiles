#!/bin/bash

# This initialization script starts the ssh daemon in the toolbox container

if toolbox run pgrep sshd > /dev/null; then
    echo "sshd is already running"
else
    echo "starting sshd"
    toolbox run sudo /usr/sbin/sshd
fi
