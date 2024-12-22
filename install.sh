#!/bin/bash

# Install hyprpanel
sudo pacman -S --needed wireplumber libgtop bluez bluez-utils btop networkmanager dart-sass wl-clipboard brightnessctl swww python upower pacman-contrib power-profiles-daemon gvfs
yay -S --needed aylurs-gtk-shell-git grimblast-git gpu-screen-recorder-git hyprpicker matugen-bin python-gpustat hyprsunset-git hypridle-git

# Clipboard
yay -S fuzzel cliphist wl-clipboard


# Touch
sudo pacman -S nwg-drawer iio-sensor-proxy glm
yay -S iio-hyprland-git
# Hyprgrass
hyprpm update
hyprpm add https://github.com/horriblename/hyprgrass
hyprpm enable hyprgrass
# Hyprspace
hyprpm add https://github.com/KZDKM/Hyprspace
hyprpm enable Hyprspace
# Dynamic cursors
hyprpm add https://github.com/virtcode/hypr-dynamic-cursors
hyprpm enable dynamic-cursors
