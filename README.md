# 🌿 notlevax dotfiles

My personal Hyprland rice on Arch Linux.

---

## 🖥️ Setup

| Component | Tool |
|-----------|------|
| WM | Hyprland |
| Bar | Waybar |
| Launcher | Rofi (wayland) |
| Terminal | Kitty |
| Browser | Zen Browser |
| Notifications | Dunst |
| Wallpaper | Awww |
| Lockscreen | Hyprlock |
| Idle | Hypridle |
| Clipboard | Cliphist |
| Cursor | Vimix |
| Icons | Papirus-Dark |
| Color scheme | Catppuccin Mocha |
| Font | JetBrainsMono Nerd Font (Propo) |

---

## 📦 Dependencies

```bash
sudo pacman -S hyprland waybar rofi-wayland kitty dunst hypridle hyprlock \
               cliphist wl-clipboard papirus-icon-theme \
               ttf-jetbrains-mono-nerd polkit-gnome
```

AUR:
```bash
yay -S awww-git zen-browser-bin vimix-cursors waypaper
```

---

## 🚀 Install

```bash
git clone https://github.com/notlevax/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash install.sh
```

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
| `Super + V` | Clipboard history |
| `Super + S` | Scratchpad |
| `Super + F` | Fullscreen |
| `Super + Space` | Toggle float |
| `Super + 1-9` | Switch workspace |
| `Super + Shift + 1-9` | Move window to workspace |
| `Super + F10` | Focus mode (screen off, all keybinds disabled) |
| `Super + Escape` | Exit focus mode |
| `Alt + F4` | Close window |
| `Super + Shift + S` | Screenshot (area) |
| `Print` | Screenshot (full) |

---

## ✅ Features

- [x] Hyprland config
- [x] Waybar (status bar)
- [x] Rofi (app launcher)
- [x] Hyprlock (lockscreen)
- [x] Hypridle (idle daemon)
- [x] Dunst (notifications)
- [x] Cliphist (clipboard manager)
- [x] Wallpaper support (Awww)
- [x] Blur & animations
- [x] Focus mode (screen off + keybinds disabled)
- [x] Windows-style keybinds
- [x] Catppuccin Mocha theme
- [ ] AGS / Quickshell bar (maybe)
- [ ] Hypridle config
- [ ] Screenshot script
- [ ] Install script (to make it work properly)

---

## 📸 Preview

![just-screenshot-:>](screenshot1.png)

---

## 🤖 Credits

Vibe Coded, Maintained and Fixed By LevaxGit (me) and my friend [Claude](https://claude.ai)

---

## 📁 Structure

```
dotfiles/
├── hypr/
│   ├── hyprland.conf
│   └── hyprlock.conf
├── waybar/
│   ├── config.jsonc
│   └── style.css
├── rofi/
│   ├── config.rasi
│   └── theme.rasi
├── wofi/
│   └── style.css
├── install.sh
└── README.md
```