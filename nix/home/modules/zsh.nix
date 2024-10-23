{
  programs.zsh = {
    enable = true;
    syntaxHighlighting = {
      enable = true;
      catppuccin.enable = true;
    };

    initExtra = ''
      HIST_STAMPS="dd/mm/yyyy"

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
      alias zf="zoxide query -l | fzf --reverse"
      alias ta="tmux attach || tmux new-session"
      alias tc="nvim ~/.tmux.conf"
      alias sp="source venv/bin/activate"
      alias todo="nvim ~/code/.todo"
      alias nxswitch="darwin-rebuild switch --flake ~/nix#mac"
      alias c="clear"
      alias prev="fzf --preview 'bat --color=always {}' --preview-window '~3'"

      alias ga="git add"
      alias gc="git commit"
      alias gp="git push"
      alias gst="git status"
      alias glg="git log"
      alias gco="git checkout"

      alias ls="lsd"
      alias ll="lsd -l"
      alias la="lsd -all"

      eval "$(zoxide init zsh)"
      eval "$(fzf --zsh)"
      eval "$(starship init zsh)"

      # scripts under bin
      export PATH="$HOME/bin:$PATH:$HOME/go/bin"
      export GOPATH="$HOME"
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

      function blastoff() {
        echo "🚀"
      }

      starship_precmd_user_func="blastoff"
    '';
  };
}
