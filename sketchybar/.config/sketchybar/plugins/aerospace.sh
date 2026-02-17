#!/usr/bin/env bash

CONFIG_DIR="${CONFIG_DIR:-$HOME/.config/sketchybar}"
source "$CONFIG_DIR/helpers/icon_map.sh"

workspace="$1"
[ -z "$workspace" ] && exit 0

# Determine the focused workspace so we can highlight it in SketchyBar.
focused_workspace="$FOCUSED_WORKSPACE"
if [ -z "$focused_workspace" ]; then
  focused_workspace="$(aerospace list-workspaces --focused --format '%{workspace}' 2>/dev/null | head -n 1)"
fi

icons=""
declare -a seen_apps

# Collect all apps on the workspace and render their corresponding icons.
while IFS= read -r app || [ -n "$app" ]; do
  [ -z "$app" ] && continue

  already_seen=0
  for seen in "${seen_apps[@]}"; do
    if [ "$seen" = "$app" ]; then
      already_seen=1
      break
    fi
  done
  [ $already_seen -eq 1 ] && continue

  seen_apps+=("$app")
  __icon_map "$app"
  icons+="$icon_result "
done < <(aerospace list-windows --workspace "$workspace" --format '%{app-name}' 2>/dev/null)

# Trim trailing whitespace produced while building the icon string.
icons="${icons%" "}"

args=(--set "$NAME" label="$icons")
if [ -n "$focused_workspace" ] && [ "$workspace" = "$focused_workspace" ]; then
  args+=(background.drawing=on)
else
  args+=(background.drawing=off)
fi

sketchybar "${args[@]}"
