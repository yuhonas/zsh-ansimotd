# Project:  zsh-animotd
# File:     /zsh-ansimotd.plugin.zsh
# Created:  2021-11-21 13:05:00
# Author:   Clint Plummer
set -o pipefail

ANSI_ART_DIR="${XDG_CONFIG_HOME:-~/.config}/ansimotd"

# get a random zip
zip_filename=$(find "$ANSI_ART_DIR" -type f -iname "*.zip" | shuf -n 1)

# get a random ansi/ascii file from within the zip
ansi_filename=$(unzip -Z1 "$zip_filename"  | grep -i -E ".*\.(ans|asc)$" | shuf -n 1)

if [ $? -eq 0 ]; then
  # print and decode to stdout
  unzip -q -p "$zip_filename" "$ansi_filename" | iconv -f 437

  # save these incase the user wants to find them later
  export ANSI_MOTD_ZIP="$zip_filename"
  export ANSI_MOTD_FILENAME="$ansi_filename"
fi;
