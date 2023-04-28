# Project:  zsh-animotd
# File:     /zsh-ansimotd.plugin.zsh
# Created:  2021-11-21 13:05:00
# Author:   Clint Plummer

set -o pipefail

ANSI_ART_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/ansimotd"

[ -d "$ANSI_ART_DIR" ] || mkdir -p "$ANSI_ART_DIR"

# recursively download all zip's from the supplied url into our config dir
# then unpack all displayable art
# eg. ansi_art_download "http://artscene.textfiles.com/artpacks/1996/"
function ansi_art_download {
  wget --directory-prefix "$ANSI_ART_DIR" --recursive \
       --no-verbose --no-clobber --no-parent --level 1 --accept zip "$1"

  cd "$ANSI_ART_DIR"

  for file in **/*.zip
  do
    # UnZip 6.00
    # no long flag options unfortunately
    # so run with quiet mode, never overwite, case insensitive case match for the filename
    # and extract to a directory of the zip's filename (minus extension)
    unzip -q -n -C "$file" '*.ans' '*.img' '*.asc' -d "$ANSI_ART_DIR/$file:r"
  done
}

# find a random piece of ansi art to display
function ansi_art_random_file {
  # if fd is installed let's use that, it's faster (at least in my testing)
  # https://github.com/sharkdp/fd
  if (( $+commands[fd] )); then
    fd --extension ans \
       --extension img \
       --extension asc \
       --absolute-path \
       --type f \
       --search-path "$ANSI_ART_DIR" |\
       shuf -n 1
  else
    find "$ANSI_ART_DIR" -type f \
     -iname '*.ans' -or \
     -iname '*.img' -or \
     -iname '*.asc' |\
     shuf -n 1
  fi;
}

function ansi_art_random {
  ansi_filename="$(ansi_art_random_file)"

  if [ -n "$ansi_filename" ]; then
    # turn off automatic margins (a.k.a. line wrapping) if we've been told too
    # this is so it'll still render something usable even if the terminal is too narrow
    if [ -n "$ANSI_MOTD_DISABLE_LINE_WRAPPING" ]; then print -n '\e[?7l'; fi;

    # convert from the original character set (Code page 437)
    # see https://en.wikipedia.org/wiki/Code_page_437
    iconv -f 437 < $ansi_filename

    # restore automatic margins if we've been told too
    if [ -n "$ANSI_MOTD_DISABLE_LINE_WRAPPING" ]; then print -n '\e[?7h'; fi;

    # record the filename in this session incase the user wants to find it later
    export ANSI_MOTD_FILENAME="$ansi_filename"
  else
    echo "\
zsh-ansimotd.plugin.zsh:
I couldn't find any ansi art to display, I tried looking in '$ANSI_ART_DIR' 😢
There are many artpacks available at http://artscene.textfiles.com/artpacks/
You can download an unpack one of these using 'ansi_art_download'
eg. ansi_art_download http://artscene.textfiles.com/artpacks/1996/" >&2
  fi;
}

ansi_art_random
