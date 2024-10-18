{
  programs.bat.enable = true;
  programs.btop.enable = true;
  programs.ripgrep.enable = true;
  programs.lsd.enable = true;
  programs.fzf.enable = true;
  # programs.gh.enable = true;
  programs.zoxide.enable = true;
  programs.fastfetch.enable = true;

  programs.git = {
    enable = true;
    userName = "weijie";
    userEmail = "jackchong398@gmail.com";
    aliases = {
      tree = "log --oneline --graph --decorate --all";
    };
    extraConfig = {
      credential.helper = "osxkeychain";
      init.defaultBranch = "main";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](green)";
      };

      cmd_duration = {
        disabled = true;
      };

      git_status = {
        stashed = "";
      };

      line_break = {
        disabled = false;
      };

      os = {
        disabled = false;
      };

      aws = {
        symbol = "  ";
      };

      buf = {
        symbol = " ";
      };

      c = {
        symbol = " ";
      };

      conda = {
        symbol = " ";
      };

      crystal = {
        symbol = " ";
      };

      dart = {
        symbol = " ";
      };

      directory = {
        read_only = " 󰌾";
        truncation_length = 4;
        style = "bold lavender";
      };

      docker_context = {
        symbol = " ";
      };

      elixir = {
        symbol = " ";
      };

      elm = {
        symbol = " ";
      };

      fennel = {
        symbol = " ";
      };

      fossil_branch = {
        symbol = " ";
      };

      git_branch = {
        symbol = " ";
      };

      golang = {
        symbol = " ";
      };

      guix_shell = {
        symbol = " ";
      };

      haskell = {
        symbol = " ";
      };

      haxe = {
        symbol = " ";
      };

      hg_branch = {
        symbol = " ";
      };

      hostname = {
        ssh_symbol = " ";
      };

      java = {
        symbol = " ";
      };

      julia = {
        symbol = " ";
      };

      kotlin = {
        symbol = " ";
      };

      lua = {
        symbol = " ";
      };

      memory_usage = {
        symbol = "󰍛 ";
      };

      meson = {
        symbol = "󰔷 ";
      };

      nim = {
        symbol = "󰆥 ";
      };

      nix_shell = {
        symbol = " ";
      };

      nodejs = {
        symbol = " ";
      };

      ocaml = {
        symbol = " ";
      };

      os.symbols = {
        Alpaquita = " ";
        Alpine = " ";
        AlmaLinux = " ";
        Amazon = " ";
        Android = " ";
        Arch = " ";
        Artix = " ";
        CentOS = " ";
        Debian = " ";
        DragonFly = " ";
        Emscripten = " ";
        EndeavourOS = " ";
        Fedora = " ";
        FreeBSD = " ";
        Garuda = "󰛓 ";
        Gentoo = " ";
        HardenedBSD = "󰞌 ";
        Illumos = "󰈸 ";
        Kali = " ";
        Linux = " ";
        Mabox = " ";
        Macos = " ";
        Manjaro = " ";
        Mariner = " ";
        MidnightBSD = " ";
        Mint = " ";
        NetBSD = " ";
        NixOS = " ";
        OpenBSD = "󰈺 ";
        openSUSE = " ";
        OracleLinux = "󰌷 ";
        Pop = " ";
        Raspbian = " ";
        Redhat = " ";
        RedHatEnterprise = " ";
        RockyLinux = " ";
        Redox = "󰀘 ";
        Solus = "󰠳 ";
        SUSE = " ";
        Ubuntu = " ";
        Unknown = " ";
        Void = " ";
        Windows = "󰍲 ";
      };

      package = {
        symbol = "󰏗 ";
      };

      perl = {
        symbol = " ";
      };

      php = {
        symbol = " ";
      };

      pijul_channel = {
        symbol = " ";
      };

      python = {
        symbol = " ";
      };

      rlang = {
        symbol = "󰟔 ";
      };

      ruby = {
        symbol = " ";
      };

      rust = {
        symbol = " ";
      };

      scala = {
        symbol = " ";
      };

      swift = {
        symbol = " ";
      };

      zig = {
        symbol = " ";
      };
    };
  };
}
