# Dotfiles - Environment Configuration

This project is a container for alias, configuration files and scripts with
which my standard operating environment can be replicated. It includes .vim
and .zshrc configuration.

Inspired by:
- [xsgordon/environment-configuration](https://github.com/xsgordon/environment-configuration)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)

## Preview

> 27 May 2020

![screenshot](./screenshots/Screenshot%20from%202020-08-10%2009-08-49.png)

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork
this repository, review the code, and remove things you don’t want or need.
Don’t blindly use my settings unless you know what that entails. Use at your
own risk!

Follow i3-starterpack: https://github.com/addy-dclxvi/i3-starterpack

Remember to install:
* zsh shell.
* Tilix (Previously known as Terminix).
* Neovim.
* Git (of course).
* Tint2.
* PyWal.
* Rofi.
* Compton.
* Polybar.
* Powerline-font.
* ...

```zsh
$ git clone https://github.com/ntk148v/dotfiles.git
$ cd dotfiles && source bootstrap.sh
```

## Fonts

* [What are the best fonts to use in a terminal emulator?](https://www.slant.co/topics/7014/~fonts-to-use-in-a-terminal-emulator)
* [What are the best programming fonts?](https://www.slant.co/topics/67/~best-programming-fonts)
* [Hack](https://github.com/source-foundry/Hack)
* [Iosevka](https://github.com/be5invis/Iosevka)
* [Source Code Pro](https://github.com/adobe-fonts/source-code-pro)
* [Fira Code](https://github.com/tonsky/FiraCode)
* [Inconsolata](https://github.com/google/fonts/tree/master/ofl/inconsolata)
* ...

## Tilix Scheme

* All color schemes I'm using are available [here](https://github.com/storm119/Tilix-Themes).
* Now I generate terminal colorscheme based on wallpaper using Pywal.

## Rofi configuration

* [Rofi-menu](https://gitlab.com/vahnrr/rofi-menus) with modifications.

## Additional tools

* [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
* [z](https://github.com/rupa/z)
* [fzf](https://github.com/junegunn/fzf)
* [thefuck](https://github.com/nvbn/thefuck)
* [tint2](https://gitlab.com/o9000/tint2)
