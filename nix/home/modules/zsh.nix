{pkgs, ...}:

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

      # asdf
      . "${pkgs.asdf-vm}/share/asdf-vm/asdf.sh"
      . "${pkgs.asdf-vm}/share/bash-completion/completions/asdf.bash"

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
      alias sp="source .venv/bin/activate"
      alias todo="nvim ~/code/.todo"
      alias nxswitch="darwin-rebuild switch --flake ~/nix#mac --impure"
      alias c="clear"
      alias prev="fzf --preview 'bat --color=always {}' --preview-window '~3'"

      alias ga="git add"
      alias gc="git commit"
      alias gp="git push"
      alias gst="git status"
      alias glg="git log"
      alias gco="git checkout"
      alias gd="git diff"

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
      export JAVA_HOME=$(/usr/libexec/java_home -v 23.0.1)
      export PATH=$JAVA_HOME/bin:$PATH

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
    '';
  };
}
