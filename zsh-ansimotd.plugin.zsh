# Project:  zsh-animotd
# File:     /zsh-ansimotd.plugin.zsh
# Created:  2021-11-21 13:05:00
# Author:   Clint Plummer
set -o pipefail

ANSI_ART_DIR="${XDG_CONFIG_HOME:-~/.config}/ansimotd"

[ -d $ANSI_ART_DIR ] || mkdir -p $ANSI_ART_DIR

# recursively download all zip's from the supplied url into our config dir
# eg. ansi_art_download http://artscene.textfiles.com/artpacks/1996/
function ansi_art_download {
  wget --directory-prefix $ANSI_ART_DIR -r -np -l 1 -A zip "$1"
}

function ansi_art_random_zip {
  find "$ANSI_ART_DIR" -type f -iname "*.zip" | shuf -n 1
}

function ansi_art_random_file {
  unzip -Z1 "$1"  | grep -i -E ".*\.(ans|asc)$" | shuf -n 1
}

zip_filename=$(ansi_art_random_zip)
ansi_filename=$(ansi_art_random_file $zip_filename)

if [ $? -eq 0 ]; then
  # print and decode to stdout
  unzip -q -p "$zip_filename" "$ansi_filename" | iconv -f 437

  # save these incase the user wants to find them later
  export ANSI_MOTD_ZIP="$zip_filename"
  export ANSI_MOTD_FILENAME="$ansi_filename"
fi;
