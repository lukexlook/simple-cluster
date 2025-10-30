#!/bin/bash
SCRIPTS_DIR=$(dirname $(realpath $0))
set -e

sudo apt install incus qemu-system cgroup-tools
sudo adduser $USER incus-admin

sudo incus admin init --preseed ${SCRIPTS_DIR}/../assets/incus.yaml
sudo incus profile set default raw.lxc "lxc.cgroup.relative=1"

MemMax=$(awk '/MemTotal/ {printf "%.0f\n", $2*0.9/1024/1024}' /proc/meminfo)
echo "
Pls run:
---------------------------------
sudo systemctl edit incus.service
---------------------------------

And add the following lines there:
---------------------------------
[Service]
MemoryMax=${MemMax}G
---------------------------------
"
