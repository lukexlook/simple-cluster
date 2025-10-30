#!/bin/bash
set -e

ip -br addr show
echo    "---------------------------"
read -p "Interface name: " INTERFACE
echo    "---------------------------"

echo "Pls edit the default profile so that its eth0 looks like:

devices:
  eth0:
    nictype: macvlan
    parent: ${INTERFACE}
    type: nic
"
echo    "---------------------------"

read -p "Press ENTER to proceed" CONFIRM
sudo incus profile edit default
