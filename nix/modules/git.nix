{
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
}
