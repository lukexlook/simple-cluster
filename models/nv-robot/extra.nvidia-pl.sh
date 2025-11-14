#!/bin/bash
GPU_ID=${GPU_ID:-0}

sudo nvidia-smi -i ${GPU_ID} -pm ENABLED
sudo nvidia-smi -i ${GPU_ID} -pl $1

echo "===
Use this script with cron to enable power limit at boot:

sudo -i
crontab -e
@reboot GPU_ID=${GPU_ID} $(pwd)/extra.nvidia-pl.sh $1
"
