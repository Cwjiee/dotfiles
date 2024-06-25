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
alias y="yazi"
alias zshconfig="nvim ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias config='/usr/bin/git --git-dir=/Users/weijie/.cfg/ --work-tree=/Users/weijie'
alias ls="lsd"

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
eval "$(starship init zsh)"

# scripts under bin
export PATH="$HOME/bin:$PATH"

function commit() {
  git add .
  git commit -m "$*"
  git push -u origin main
}

function upbrew() {
  brew leaves | > Brewfile
  brew ls --casks | >> Brewfile
}
