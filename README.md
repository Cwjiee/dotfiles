# Nix Dofiles

My nix configuration for 
- MacOS
- Arch Linux (work in progress)


## Usage
**Clone this repository:**

```
git clone https://github.com/cwjiee/dotfiles ~/nix
```
<br>

**Then, rebuild and switch system configuration**

### MacOS

```
darwin-rebuild switch --flake ~/nix#mac
```

### Arch Linux
- *work in progress*
```
home-manager switch --flake ~/nix#arch
```

## Contents
- CLIs and TUIs
- Configured terminal
- System settings
- Language version managers
- Nix lsp
- Essential env variables and aliases


## My setup

| Config    | <!-- -->    |
|-------------|-------------|
| Terminal | WezTerm |
| Shell | Zsh |
| Prompt | Starship |
| Editor |[Neovim](https://github.com/cwjiee/nvim-config) |
| Terminal multiplexer | Tmux |
| Colorscheme | Catppuccin (superior colorscheme XD) |
| Font | FiraCode Nerd Font Mono |
