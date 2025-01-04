# My personal dotfiles

My personal dotfiles for **Zsh** and **Oh My Zsh**.

## Installation

Make sure **git** and **curl** are installed on your system. Then clone the repository in your home directory and
execute the installation script:

```shell
git clone https://github.com/barthjs/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

These configurations are designed for Arch and Debian-based systems but should work on other distributions with minimal
tweaks.

What the installation script does:

- Deletes any existing Zsh and Oh My Zsh configurations.
- Installs Oh My Zsh and essential plugins
- Symlinks `.zshrc` which loads configs from `~/.dotfiles/shell`

⚠️ Note: Back up any existing `.zshrc` or related files before running the script.

## Recommended Programs

To fully utilize the aliases and functions provided in these dotfiles, the following programs are recommended. Install
them for the best experience:

- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [eza](https://github.com/eza-community/eza)
- [bat](https://github.com/sharkdp/bat)
- [yazi](https://github.com/sxyazi/yazi)
- [fzf](https://github.com/junegunn/fzf)
- [fd](https://github.com/sharkdp/fd)

## Customization

Add personal tweaks by creating the following files in the `~/.dotfiles/custom` directory:

- `zshrc`: Add Zsh-specific configurations.
- `aliases.sh`: Add or modify command aliases.
- `functions.sh`: Define custom shell functions.
- `exports.sh`: Set environment variables.

These scripts will be automatically sourced.

## License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.
