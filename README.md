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

These dotfiles are designed for Arch and Debian-based distros but should work on other distributions with minimal
tweaks.

#### What the installation script does

- Deletes any existing **Zsh** and **Oh My Zsh** configurations.
- Installs **Oh My Zsh** and essential plugins
- Symlinks `.zshrc` which loads configs from `~/.dotfiles/shell`

⚠️ Note: Back up any existing `.zshrc` or related files before running the script.

## Updates

An `update.sh` script is included alongside the installation script.
Run it to pull the latest changes from the repository and update Oh My Zsh along with its plugins.

```shell
cd ~/.dotfiles
./update.sh

# Or with the update alias
update-dotfiles
```

## Recommended Programs

To fully use the aliases and functions provided in these dotfiles, the following programs are recommended.

- [bat](https://github.com/sharkdp/bat)
- [eza](https://github.com/eza-community/eza)
- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)
- [yazi](https://github.com/sxyazi/yazi)
- [zoxide](https://github.com/ajeetdsouza/zoxide)

## Customization

Add personal tweaks by creating the following files in the `~/.dotfiles/custom` directory:

- `zshrc`: Add Zsh-specific configurations.
- `aliases.sh`: Add aliases.
- `functions.sh`: Define custom shell functions.
- `exports.sh`: Set environment variables.

These scripts will be automatically sourced.

## License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.
