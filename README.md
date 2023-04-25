# zsh ansi motd (message of the day) [![Lint for errors](https://github.com/yuhonas/zsh-ansimotd/actions/workflows/ci.yml/badge.svg)](https://github.com/yuhonas/zsh-ansimotd/actions/workflows/ci.yml) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)



This zsh plugin adds an old skool ansi art based motd when the login shell is executed

![Example MOTD](./example.png)

## Why

I grew up in the day's of [ BBS's ](https://en.wikipedia.org/wiki/Bulletin_board_system) and [ ansi art ](https://en.wikipedia.org/wiki/ANSI_art) so I wanted something
to replicate the experience of jumping onto a new [ BBS ](https://en.wikipedia.org/wiki/Bulletin_board_system) everytime I started my login shell

## Installation

### Dependencies

* [zsh](https://www.zsh.org/)
* [shuf]( https://en.wikipedia.org/wiki/Shuf) which is part of gnu [coreutils](https://formulae.brew.sh/formula/coreutils)

For Mac/Linux using [ Homebrew ](https://brew.sh/) you can install coreutils using

```
brew install coreutils
```

#### Optional
* [fd](https://github.com/sharkdp/fd) a modern `find` replacement, it will use this preferentially if it's installed otherwise fallback to `find`


### Install using your favourite plugin manager or not

```
# for znap
znap source yuhonas/zsh-ansimotd

# for antigen
antigen bundle yuhonas/zsh-ansimotd

# manually
# Clone the repository and source it in your shell's rc file
```

### Getting some awesome ansi art to display
After installation you'll need to download some ansi art for it to randomly display, I suggest
finding a pack you like at [artscene](http://artscene.textfiles.com/artpacks/) and unpacking it
into the ansi motd config directory

You can do this by

#### Using the plugins helper function
Use [ansi_art_download](https://github.com/yuhonas/zsh-ansimotd/blob/main/zsh-ansimotd.plugin.zsh#L15) to download all zip files of ansi art from a url and unpack them into the ansi motd config directory (this can take a while depending on the amount of ansi art contained in that year)

eg. to download and unpack all ansi art from `1996` (one of my favourites) from the url http://artscene.textfiles.com/artpacks/1996/ run the following in your shell

```
ansi_art_download http://artscene.textfiles.com/artpacks/1996/
```

#### Manually

Copy any `.ans`, `.img` or `.asc` files containg ansi art into your ansi art config directory which is derived from `${XDG_CONFIG_HOME:-$HOME/.config}/ansimotd` (the plugin performs a recursive search for art so any directory nesting is fine)

### Damn that piece of ansi art that just got shown was awesome! which one was it?

They're all pretty awesome but if you happen to fall in love with one in particular the plugin keeps the full path of the one displayed in the current session under the ENV variable `ANSI_MOTD_FILENAME` so you can track it down


### Note
Art to be displayed is assumed to use the [Code Page 437]( https://en.wikipedia.org/wiki/Code_page_437 ) character set


## License

This project is licensed under the [ MIT ](./LICENSE) license
