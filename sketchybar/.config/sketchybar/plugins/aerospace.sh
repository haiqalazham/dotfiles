#!/usr/bin/env bash

CONFIG_DIR="$HOME/.config/sketchybar"
source "$CONFIG_DIR/helpers/icon_map.sh"

# Get all apps in this workspace
apps=$(aerospace list-windows --workspace "$1" --format "%{app-name}")

icons=""
for app in $apps; do
  __icon_map "$app"
  icons="$icons$icon_result "
done

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" background.drawing=on label="$icons"
else
  sketchybar --set "$NAME" background.drawing=off label="$icons"
fi
