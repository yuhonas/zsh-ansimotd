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
* [pv](https://www.ivarch.com/programs/pv.shtml) a pipe viewer which can limit the art rendering speed to [emulate the feel of an old skool BBS](https://github.com/yuhonas/zsh-ansimotd#the-real-bbs-experience)

### Install using your favourite plugin manager or not

```
# for znap
znap source yuhonas/zsh-ansimotd

# for antigen
antigen bundle yuhonas/zsh-ansimotd

# for zplug
zplug "yuhonas/zsh-ansimotd"

# manually
# Clone the repository and source it in your shell's rc file
```

### Getting some awesome ansi art to display

After installation you'll need to download some ansi art for it to randomly display, I suggest a few places

#### 16colo.rs

Head over to [16colo.rs](https://16colo.rs/) and if you find a year(s) you like you can download everything from that year using their rsync mirror

eg. to download everything from [1996](https://16colo.rs/year/1996/) to the `ANSI_MOTD_ART_DIR`
```
rsync -azvhP --include '*/' --include '*.ANS' --exclude '*' rsync://16colo.rs/pack/1996 "$ANSI_MOTD_ART_DIR"
```

#### artscene.textfiles.com

Find a pack you like at [artscene](http://artscene.textfiles.com/artpacks/) and unpack it into the ansi motd config directory

You can do this by

##### Using the plugins helper function
Use [ansi_art_download](https://github.com/yuhonas/zsh-ansimotd/blob/main/zsh-ansimotd.plugin.zsh#L15) to download all zip files of ansi art from a url and unpack them into the ansi motd config directory (this can take a while depending on the amount of ansi art contained in that year)

eg. to download all ansi art from `1996` from the url http://artscene.textfiles.com/artpacks/1996/ run the following in your shell

```
ansi_art_download http://artscene.textfiles.com/artpacks/1996/
```

#### Manually

Copy any `.ans`, `.img` or `.asc` files containg ansi art into your `ANSI_MOTD_ART_DIR` directory which is derived from `${XDG_CONFIG_HOME:-$HOME/.config}/ansimotd` (the plugin performs a recursive search for art so any directory nesting is fine)

### Configuration / Settings

The plugin exports the following useful variables to the session

* `ANSI_MOTD_ART_DIR`  - the full path to the config directory where the plugin will search for ansi art
* `ANSI_MOTD_FILENAME` - the full file path to the last shown peice of ansi art, if you want to do something with it, laud over it, delete it etc

There's also a handful of ENV variables you can use to configure the plugin (these will need to be set prior to plugin instantiation)

#### The real BBS experience

To buffer the ansi art output at a fixed speed you can set the `ANSI_MOTD_RATE_LIMIT_OUTPUT` ENV variable

eg. to limit the ansi art rendering rate to a data rate of 8k
```
export ANSI_MOTD_RATE_LIMIT_OUTPUT="8k"
```

See also [Pull Request #10](https://github.com/yuhonas/zsh-ansimotd/pull/10#pullrequestreview-1407110513) to see it in action

#### Small screens
If you happen to be running on a small fixed screen perhaps on something like [termux](https://termux.dev/en/) you can set the following ENV variable to truncate the art to screen width

```
export ANSI_MOTD_DISABLE_LINE_WRAPPING=1
```

See also [Pull Request #6](https://github.com/yuhonas/zsh-ansimotd/pull/6)


### Note
Art to be displayed is assumed to use the [Code Page 437]( https://en.wikipedia.org/wiki/Code_page_437 ) character set


### License

This project is licensed under the [ MIT ](./LICENSE) license

### Contributors

<a href="https://github.com/yuhonas/zsh-ansimotd/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=yuhonas/zsh-ansimotd" />
</a>

Made with [contrib.rocks](https://contrib.rocks).

### Special Thanks 🙇

* To [romkatv](https://www.reddit.com/r/zsh/comments/12ueb6b/comment/jhmlgez/?utm_source=share&utm_medium=web2x&context=3) for posting a fix for the word wrapping issue on narrow terminals
* To [mainsm](https://github.com/yuhonas/zsh-ansimotd/issues/5#issue-1683181011) for posting 👆 as an issue in the repo
