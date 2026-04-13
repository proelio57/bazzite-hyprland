#!/bin/bash

set -ouex pipefail

### Hide Plasma sessions from SDDM (only Hyprland visible)
rm -f /usr/share/wayland-sessions/plasma.desktop
rm -f /usr/share/wayland-sessions/plasmawayland.desktop
rm -f /usr/share/wayland-sessions/plasmawayland6.desktop
rm -f /usr/share/xsessions/plasma.desktop
rm -f /usr/share/xsessions/plasmax11.desktop

### SDDM: set Hyprland as default session and clear remembered session state
mkdir -p /etc/sddm.conf.d
cat > /etc/sddm.conf.d/hyprland.conf << 'EOF'
[General]
DefaultSession=hyprland.desktop
[Autologin]
Session=hyprland.desktop
EOF

# Clear any persisted last-session state so SDDM uses the default above
rm -f /var/lib/sddm/.config/sddm/state.conf

### Hyprland COPR (latest packages)
dnf5 -y copr enable solopasha/hyprland

# Core WM — must succeed
dnf5 install -y \
    hyprland \
    xdg-desktop-portal-hyprland

# Hyprland ecosystem — skip if not available in this COPR
# (hyprpaper, hypridle, hyprlock are also in Fedora repos as fallback)
dnf5 install -y --skip-unavailable \
    hyprpaper \
    hypridle \
    hyprlock \
    hyprpicker

dnf5 -y copr disable solopasha/hyprland

### Supporting packages from Fedora repos
dnf5 install -y --skip-unavailable \
    waybar \
    wofi \
    mako \
    foot \
    polkit-gnome \
    qt5-qtwayland \
    qt6-qtwayland \
    brightnessctl \
    playerctl \
    pamixer \
    grim \
    slurp \
    wl-clipboard \
    swappy \
    network-manager-applet \
    blueman \
    pavucontrol \
    cliphist \
    jq

### Copy configs to /etc/skel (applied automatically for new users)
mkdir -p /etc/skel/.config/{hypr,waybar,mako,wofi,foot}
cp -r /ctx/configs/hypr/.    /etc/skel/.config/hypr/
cp -r /ctx/configs/waybar/.  /etc/skel/.config/waybar/
cp -r /ctx/configs/mako/.    /etc/skel/.config/mako/
cp -r /ctx/configs/wofi/.    /etc/skel/.config/wofi/
cp -r /ctx/configs/foot/.    /etc/skel/.config/foot/

### System units
systemctl enable podman.socket
