# dotfiles

My Dotfiles for windows, linux and Mac

## Windows GitBash

* Install gitbash https://git-scm.com/downloads
* Setup `windows-terminal.json`
* Using gitbash, Install starship prompt and several apps

```
winget install starship
winget install fzf eza-community.eza sharkdp.bat sharkdp.fd BurntSushi.ripgrep.MSVC Clement.bottom
scoop install dust
```

* Then use your [prefered theme](https://starship.rs/presets/)

```
mkdir -p ~/.config
starship preset gruvbox-rainbow -o ~/.config/starship.toml
```
