# 🌿 notlevax dotfiles
My personal Hyprland rice on Arch Linux — dynamic theming powered by matugen.

---

## 🖥️ Setup

| Component | Tool |
|-----------|------|
| WM | Hyprland |
| Bar | Waybar |
| Launcher | Rofi (wayland) |
| Terminal | Kitty |
| Browser | Zen Browser |
| Notifications | Swaync |
| OSD | Swayosd |
| Wallpaper | Awww + Waypaper |
| Lockscreen | Hyprlock |
| Idle | Hypridle |
| Clipboard | Cliphist |
| Cursor | Vimix |
| Icons | Papirus-Dark |
| Color scheme | Dynamic (matugen) |
| Font | JetBrainsMono Nerd Font (Propo) |

---

## 📦 Dependencies

```bash
sudo pacman -S hyprland waybar rofi-wayland kitty hypridle hyprlock \
               cliphist wl-clipboard papirus-icon-theme \
               ttf-jetbrains-mono-nerd polkit-gnome \
               mpv ffmpeg playerctl
```

AUR:
```bash
yay -S awww-git zen-browser-bin vimix-cursors waypaper \
       swaync swayosd-git mpvpaper matugen-bin grimblast-git
```

---

## 🚀 Install

```bash
git clone https://github.com/LevaxGit/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash install.sh
```

The install script will detect your distro and ask before installing dependencies.

---

## 🎨 Dynamic Theming

Colors are generated from your wallpaper using [matugen](https://github.com/InioX/matugen). Changing the wallpaper automatically updates:

- Waybar
- Rofi
- Swaync
- Kitty
- Hyprland borders

Use `Super + W` to open the wallpaper picker (rofi with thumbnails), select a wallpaper and everything reloads automatically.

---

## ⌨️ Key Bindings

| Keybind | Action |
|---------|--------|
| `Super + Enter` | Terminal (Kitty) |
| `Super + D` | App launcher (Rofi) |
| `Super + Q` | Close window |
| `Super + E` | File manager |
| `Super + B` | Browser |
| `Super + L` | Lock screen |
| `Super + A` | Notification center (Swaync) |
| `Super + V` | Clipboard history |
| `Super + W` | Wallpaper picker |
| `Super + S` | Scratchpad |
| `Super + F` | Fullscreen |
| `Super + Space` | Toggle float |
| `Super + 1-9` | Switch workspace |
| `Super + Shift + 1-9` | Move window to workspace |
| `Super + F10` | Focus mode (screen off, all keybinds disabled) |
| `Super + Escape` | Exit focus mode |
| `Super + Shift + S` | Screenshot (area) |
| `Print` | Screenshot (full) |
| `Super + Shift + Print` | Screenshot (active window) |

---

## ✅ Features

- [x] Hyprland config
- [x] Waybar (status bar with icons)
- [x] Rofi (app launcher with icons)
- [x] Hyprlock (lockscreen)
- [x] Hypridle (idle daemon)
- [x] Swaync (notification center + control panel + media player)
- [x] Swayosd (volume/brightness/caps lock OSD)
- [x] Cliphist (clipboard manager)
- [x] Wallpaper support (Awww + Waypaper + mpvpaper for video)
- [x] Dynamic theming (matugen — colors from wallpaper)
- [x] Rofi wallpaper picker with thumbnails
- [x] Screenshot script (area, full, window)
- [x] Blur & animations
- [x] Focus mode (screen off + keybinds disabled)
- [x] Windows-style keybinds
- [x] Install script (auto detects distro)
- [ ] AGS / Quickshell bar (maybe)

---

## 📸 Preview

![Preview](readme%20things/screenshot1.png)

---

## 📁 Structure

```
dotfiles/
├── hypr/
│   ├── hyprland.conf
│   ├── hyprlock.conf
│   └── scripts/
│       ├── screenshot.sh
│       └── wallpaper.sh
├── waybar/
│   ├── config.jsonc
│   └── style.css
├── rofi/
│   ├── config.rasi
│   └── theme.rasi
├── swaync/
│   ├── config.json
│   └── style.css
├── kitty/
│   ├── kitty.conf
│   └── colors.conf
├── matugen/
│   ├── config.toml
│   └── templates/
│       ├── waybar.css
│       ├── rofi.rasi
│       ├── kitty-colors.conf
│       ├── swaync.css
│       └── hyprland-colors.conf
├── install.sh
└── README.md
```

---

## 🤖 Credits

Vibe Coded, Maintained and Fixed By LevaxGit (me) and my friend [Claude](https://claude.ai)