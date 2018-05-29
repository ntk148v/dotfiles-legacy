# Dotfiles - Environment Configuration

This project is a container for alias, configuration files and scripts with
which my standard operating environment can be replicated. It includes .vim
and .zshrc configuration.

Inspired by:
- [xsgordon/environment-configuration](https://github.com/xsgordon/environment-configuration)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork
this repository, review the code, and remove things you don’t want or need.
Don’t blindly use my settings unless you know what that entails. Use at your
own risk!

Remember to install [zsh](https://github.com/zsh-users/zsh) & git first.

```zsh
$ git clone https://github.com/ntk148v/dotfiles.git
$ cd dotfiles && source bootstrap.sh # WIP!!!
```

# Fonts

* [What are the best fonts to use in a terminal emulator?](https://www.slant.co/topics/7014/~fonts-to-use-in-a-terminal-emulator)
* [What are the best programming fonts?](https://www.slant.co/topics/67/~best-programming-fonts)
* [Hack](https://github.com/source-foundry/Hack)
* [Iosevka](https://github.com/be5invis/Iosevka)
* [Source Code Pro](https://github.com/adobe-fonts/source-code-pro)

> TODO:
  - Add Ansible modules to install & configure automatically.
  - Use rsync (with --exclude option) in bootstrap.sh
