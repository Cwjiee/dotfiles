export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
HIST_STAMPS="dd/mm/yyyy"

# zsh plugins
source ~/.oh-my-zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# nvm
source ~/.nvm/nvm.sh
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && \. "/usr/local/opt/nvm/etc/bash_completion"

alias v="nvim"
alias vimrc="nvim ~/.config/nvim"
alias cat="bat"
alias neofetch="fastfetch"
alias lz="lazygit"
alias zc="nvim ~/.zshrc"
alias zs="source ~/.zshrc"
alias config='/usr/bin/git --git-dir=/Users/weijie/.cfg/ --work-tree=/Users/weijie'
alias ls="lsd"
alias zf="zoxide query -l | fzf --reverse"
alias ta="tmux attach || tmux new-session"
alias tc="nvim ~/.tmux.conf"
alias sp="source venv/bin/activate"
alias todo="nvim ~/code/.todo"
alias dbuild="darwin-rebuild switch --flake ~/nix#mac"

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
eval "$(starship init zsh)"

# scripts under bin
export PATH="$HOME/bin:$PATH:$HOME/go/bin"
export XDG_CONFIG_HOME="$HOME/.config"

function upbrew() {
  brew leaves | > Brewfile
  brew ls --casks | >> Brewfile
}

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/weijie/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/weijie/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/weijie/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/weijie/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# BLUE="\e[0;35m"
# 
# printf "$BLUE"
# figlet -f larry3d -w 300 Hi, I\'m Wei Jie
