# Bazzite Hyprland

A custom [bootc](https://github.com/bootc-dev/bootc) image based on [Bazzite](https://bazzite.gg/) that replaces KDE Plasma with [Hyprland](https://hyprland.org/) as the default window manager.

## Features

- Based on `ghcr.io/ublue-os/bazzite:stable`
- Hyprland as the default and only visible session in SDDM
- Pre-configured Hyprland ecosystem with sensible defaults
- All the gaming goodness from Bazzite (Steam, Lutris, drivers, etc.)

### Included Packages

**Hyprland Ecosystem** (from [solopasha/hyprland COPR](https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/)):
- hyprland - Wayland compositor
- hyprpaper - Wallpaper utility
- hypridle - Idle daemon
- hyprlock - Screen locker
- hyprpicker - Color picker
- xdg-desktop-portal-hyprland

**Supporting Applications**:
- waybar - Status bar
- wofi - Application launcher
- mako - Notification daemon
- foot - Terminal emulator
- polkit-gnome - Authentication agent
- grim + slurp + swappy - Screenshot tools
- wl-clipboard + cliphist - Clipboard management
- brightnessctl, playerctl, pamixer - Hardware controls
- network-manager-applet, blueman, pavucontrol - System utilities

## Installation

Switch to this image from an existing bootc system:

```bash
sudo bootc switch ghcr.io/proelio57/bazzite-hyprland:latest
```

Then reboot.

## Configuration

Default configurations are provided in `/etc/skel/.config/` and are automatically applied for new users:
- `hypr/` - Hyprland, hyprpaper, hypridle, hyprlock configs
- `waybar/` - Status bar config and styling
- `wofi/` - Application launcher config
- `mako/` - Notification daemon config
- `foot/` - Terminal emulator config

To customize, copy the configs to your home directory:
```bash
cp -r /etc/skel/.config/hypr ~/.config/
cp -r /etc/skel/.config/waybar ~/.config/
# etc.
```

## Building Locally

Requires [Podman](https://podman.io/) and [just](https://just.systems/).

```bash
# Build the container image
just build

# Build a QCOW2 VM image for testing
just build-qcow2

# Run in a VM
just run-vm-qcow2
```

## Credits

- [Universal Blue](https://universal-blue.org/) for Bazzite and the image template
- [Hyprland](https://hyprland.org/) for the amazing compositor
- [solopasha](https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/) for maintaining the Hyprland COPR
