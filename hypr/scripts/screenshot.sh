#!/bin/bash

SAVE_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SAVE_DIR"
FILE="$SAVE_DIR/$(date +%Y-%m-%d_%H-%M-%S).png"

case "$1" in
  area)   grimblast --notify copysave area "$FILE" ;;
  screen) grimblast --notify copysave screen "$FILE" ;;
  window) grimblast --notify copysave active "$FILE" ;;
  *)      grimblast --notify copysave area "$FILE" ;;
esac