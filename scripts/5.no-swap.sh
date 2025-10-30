#!/bin/bash
sudo sed -i '/^[^#].*swap/s/^/# /' /etc/fstab
