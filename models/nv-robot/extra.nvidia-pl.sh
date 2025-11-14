#!/bin/bash
GPU_ID=${GPU_ID:-0}

sudo nvidia-smi -i ${GPU_ID} -pm ENABLED
sudo nvidia-smi -i ${GPU_ID} -pl $1
