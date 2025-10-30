#!/bin/bash

# change sysctl settings
if ! grep -q "^fs\.inotify\.max_user_watches" /etc/sysctl.conf; then
    echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.conf
fi

# apply sysctl settings now
sudo sysctl -p
