#!/bin/bash
set -e

curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o ./ros-archive-keyring.gpg
sudo mv ./ros-archive-keyring.gpg /usr/share/keyrings/
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] https://mirrors.tuna.tsinghua.edu.cn/ros2/ubuntu noble main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update
sudo apt install ros-jazzy-desktop-full
