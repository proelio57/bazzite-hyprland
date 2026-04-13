# Bazzite Hyprland

A custom [bootc](https://github.com/bootc-dev/bootc) image based on [Bazzite](https://bazzite.gg/) that replaces KDE Plasma with [Hyprland](https://hyprland.org/) as the default window manager.

## Features

### Base System
- Based on `ghcr.io/ublue-os/bazzite:stable` with all Bazzite gaming features (Steam, Lutris, drivers, etc.)
- Hyprland as the default and only visible session in SDDM (KDE Plasma sessions hidden)
- XWayland enabled for legacy app compatibility
- Podman socket enabled by default

### Visual Design
- Rounded corners (8px) with gradient borders (cyan → green)
- Window gaps (5px inner, 10px outer)
- Blur effects on waybar and notifications
- Smooth animations with custom bezier curves
- Slightly dimmed inactive windows (95% opacity)
- Variable framerate (VFR) for power efficiency

### Gaming Optimizations
- Flat mouse acceleration profile
- Steam auto-assigned to workspace 9
- Game windows: no blur, no rounding, auto-fullscreen
- Allow tearing disabled for consistent frame pacing

### Power Management
- Auto-lock screen after 5 minutes of inactivity
- Display turns off after 10 minutes
- Wake on mouse movement or key press
- Lock before sleep

### Keybindings (SUPER = Windows key)

| Keys | Action |
|------|--------|
| `SUPER + Return` | Terminal (foot) |
| `SUPER + D` | App launcher (wofi) |
| `SUPER + E` | File manager (dolphin) |
| `SUPER + C` | Clipboard history |
| `SUPER + Q` | Close window |
| `SUPER + F` | Fullscreen |
| `SUPER + V` | Toggle floating |
| `SUPER + L` | Lock screen |
| `SUPER + R` | Resize mode (HJKL/arrows, Escape to exit) |
| `SUPER + 1-0` | Switch to workspace 1-10 |
| `SUPER + SHIFT + 1-0` | Move window to workspace |
| `SUPER + HJKL` | Vim-style focus navigation |
| `SUPER + SHIFT + HJKL` | Move window |
| `Print` | Screenshot region → editor |
| `SHIFT + Print` | Screenshot full screen |
| `SUPER + Print` | Screenshot active window |
| Media keys | Volume, mute, play/pause, prev/next |

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
- grim + slurp + swappy - Screenshot workflow
- wl-clipboard + cliphist - Clipboard history (100 entries)
- brightnessctl, playerctl, pamixer - Hardware controls
- network-manager-applet, blueman, pavucontrol - System tray utilities
- jq - JSON processing (used for window screenshots)

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
