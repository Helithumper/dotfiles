#!/usr/bin/env bash

DOTFILES="$HOME/src/github.com/helithumper/dotfiles"
CONFIG="$DOTFILES/.config/wofi/config/config"
STYLE="$DOTFILES/.config/wofi/src/macchiato/style.css"

if [[ ! $(pidof wofi) ]]; then
    wofi --conf "${CONFIG}" --style "${STYLE}" --normal-window $@
else
    pkill wofi
fi
