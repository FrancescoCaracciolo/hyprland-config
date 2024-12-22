#!/bin/bash

# Install hyprpanel
sudo pacman -S --needed wireplumber libgtop bluez bluez-utils btop networkmanager dart-sass wl-clipboard brightnessctl swww python upower pacman-contrib power-profiles-daemon gvfs
yay -S --needed aylurs-gtk-shell-git grimblast-git gpu-screen-recorder-git hyprpicker matugen-bin python-gpustat hyprsunset-git hypridle-git

# Clipboard
yay -S fuzzel cliphist wl-clipboard

