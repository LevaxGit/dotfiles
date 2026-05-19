#!/usr/bin/env bash
# ─────────────────────────────────────────────
# install.sh — symlink dotfiles into ~/.config
# ─────────────────────────────────────────────

set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="$HOME/.config"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

info()    { echo -e "${GREEN}→${NC} $1"; }
warn()    { echo -e "${YELLOW}⚠${NC}  $1"; }
success() { echo -e "${GREEN}✓${NC} $1"; }

symlink() {
    local src="$1"
    local dst="$2"

    mkdir -p "$(dirname "$dst")"

    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        warn "Backing up existing $dst → $dst.bak"
        mv "$dst" "$dst.bak"
    fi

    if [ -L "$dst" ]; then
        rm "$dst"
    fi

    ln -s "$src" "$dst"
    success "Linked $dst"
}

echo ""
echo "  notlevax dotfiles installer"
echo "  ───────────────────────────"
echo ""

symlink "$DOTFILES/hypr/hyprland.conf"    "$CONFIG/hypr/hyprland.conf"
symlink "$DOTFILES/hypr/hyprlock.conf"    "$CONFIG/hypr/hyprlock.conf"
symlink "$DOTFILES/waybar/config.jsonc"   "$CONFIG/waybar/config.jsonc"
symlink "$DOTFILES/waybar/style.css"      "$CONFIG/waybar/style.css"
symlink "$DOTFILES/rofi/config.rasi"      "$CONFIG/rofi/config.rasi"
symlink "$DOTFILES/rofi/theme.rasi"       "$CONFIG/rofi/theme.rasi"
symlink "$DOTFILES/wofi/style.css"        "$CONFIG/wofi/style.css"

echo ""
success "All done! Log out and back into Hyprland."
echo ""
