# zsh ansi motd (message of the day)

This zsh plugin adds an old skool ansi art based motd when the login shell is executed

![Example MOTD](./example.png)

## Why

I grew up in the day's of [ BBS's ](https://en.wikipedia.org/wiki/Bulletin_board_system) and [ ansi art ](https://en.wikipedia.org/wiki/ANSI_art) so I wanted something
to replicate the experience of jumping onto a new [ BBS ](https://en.wikipedia.org/wiki/Bulletin_board_system) everytime I started my login shell

## Installation

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

```
# using ansi_art_download (a function provided by the plugin) to download all zip files of ansi art from 1996
# and unpack them into the ansi motd config directory
# note: this can take a while depending on the amount of ansi art contained in that year

$ ansi_art_download http://artscene.textfiles.com/artpacks/1996/

# manually
# Copy any `.ans`, `.img` or `.asc` files containg ansi art into your ansi art config directory
# which is derived from ${XDG_CONFIG_HOME:-~/.config}/ansimotd
# note: it's a recursive search so any directory nesting is fine
```

### Note
Art to be displayed is assumed to use the [Code Page 437]( https://en.wikipedia.org/wiki/Code_page_437 ) character set


## License

This project is licensed under the [ MIT ](./LICENSE) license
