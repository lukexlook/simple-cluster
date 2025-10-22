#!/bin/bash
SCRIPTS_DIR=$(dirname $(realpath $0))
source ${SCRIPTS_DIR}/0.env.sh
set -e

# Install docker
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

# Install nvidia container toolkit
if [[ $(nvidia-detector) -ne "None" ]]; then
    curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | \
        sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg

    curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
        sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
        sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

    sudo apt-get update

    sudo apt-get install -y \
      nvidia-container-toolkit=${NV_CONTAINER_TOOLKIT_VERSION} \
      nvidia-container-toolkit-base=${NV_CONTAINER_TOOLKIT_VERSION} \
      libnvidia-container-tools=${NV_CONTAINER_TOOLKIT_VERSION} \
      libnvidia-container1=${NV_CONTAINER_TOOLKIT_VERSION}

fi

# Allow user access
sudo usermod -aG docker $USER
