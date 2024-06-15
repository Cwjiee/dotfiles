export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
HIST_STAMPS="dd/mm/yyyy"

# zsh plugins
plugins=(git)
source $ZSH/oh-my-zsh.sh
source ~/.config/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
alias zshconfig="nvim ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias config='/usr/bin/git --git-dir=/Users/weijie/.cfg/ --work-tree=/Users/weijie'

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
eval "$(starship init zsh)"

function commit() {
  git add .
  git commit -m "$1"
  git push -u origin "$2"
}
