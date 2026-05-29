#!/usr/bin/env bash
# ─────────────────────────────────────────────────────
# wallpaper.sh — set wallpaper + regenerate theme
# Usage:
#   wallpaper.sh /path/to/image.jpg        (static)
#   wallpaper.sh /path/to/video.mp4        (video)
#   wallpaper.sh --pick                    (rofi picker with thumbnails)
# ─────────────────────────────────────────────────────

WALLPAPER="$1"
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

set_static() {
    pkill -9 mpvpaper 2>/dev/null
    awww img "$1" --transition-type wave --transition-fps 60 2>/dev/null \
        || awww img "$1" 2>/dev/null
}

set_video() {
    pkill -9 awww-daemon 2>/dev/null
    sleep 0.3
    awww-daemon &disown
    sleep 0.5
    mpvpaper -o "no-audio loop-file=inf hwdec=vaapi" '*' "$1" &disown
}

# ── Pick mode — rofi with image thumbnails ────────────
if [[ "$1" == "--pick" ]]; then
    SELECTED=$(find "$WALLPAPER_DIR" -type f \( \
        -iname "*.jpg" -o -iname "*.jpeg" -o \
        -iname "*.png" -o -iname "*.gif" -o \
        -iname "*.mp4" -o -iname "*.webm" -o \
        -iname "*.mkv" \
    \) | sort | while read -r file; do
        name=$(basename "$file")
        mime=$(file --mime-type -b "$file")
        if [[ "$mime" == video/* ]]; then
            thumb="/tmp/wallpaper-thumb-$(echo "$file" | md5sum | cut -d' ' -f1).jpg"
            [[ ! -f "$thumb" ]] && ffmpeg -i "$file" -vframes 1 -q:v 5 -vf "scale=200:-1" "$thumb" -y 2>/dev/null
            echo -en "$name\0icon\x1f$thumb\n"
        else
            echo -en "$name\0icon\x1f$file\n"
        fi
    done | rofi -dmenu -p "󰸉 Wallpaper" \
        -theme ~/.config/rofi/theme.rasi \
        -show-icons \
        -icon-size 100)

    [[ -z "$SELECTED" ]] && exit 0
    exec "$0" "$WALLPAPER_DIR/$SELECTED"
fi

# ── Validate input ────────────────────────────────────
if [[ -z "$WALLPAPER" ]]; then
    echo "Usage: wallpaper.sh <image|video> or wallpaper.sh --pick"
    exit 1
fi

if [[ ! -f "$WALLPAPER" ]]; then
    echo "File not found: $WALLPAPER"
    exit 1
fi

# ── Detect type + apply ───────────────────────────────
MIME=$(file --mime-type -b "$WALLPAPER")

if [[ "$MIME" == video/* ]]; then
    echo "→ Video wallpaper: $WALLPAPER"
    TMPFRAME="/tmp/wallpaper-frame.jpg"
    ffmpeg -i "$WALLPAPER" -vframes 1 -q:v 2 "$TMPFRAME" -y 2>/dev/null
    set_video "$WALLPAPER"
    matugen image "$TMPFRAME" --source-color-index 0
else
    echo "→ Static wallpaper: $WALLPAPER"
    set_static "$WALLPAPER"
    matugen image "$WALLPAPER" --source-color-index 0
fi

# ── Reload everything AFTER matugen finishes ──────────
hyprctl reload
pkill -9 waybar && sleep 0.5 && waybar &disown
pkill -9 swaync && sleep 0.3 && swaync &disown
sleep 1 && notify-send -i preferences-desktop-wallpaper "Theme updated" "Colors regenerated from wallpaper" &disown

echo "✓ Done"
