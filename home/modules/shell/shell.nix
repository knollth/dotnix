{config, pkgs,lib,...}:
{
  home.shell.enableZshIntegration = true;
  programs.zsh = {
    enable = true;
    shellAliases = {
      uni-push = "rclone sync -v $HOME/Documents/Studium drive:/Studium";
      uni-pull = "rclone sync -v drive:/Studium $HOME/Documents/Studium";
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  home.sessionVariables = {
    EDITOR="nvim";
    UNI="$HOME/Documents/Studium";
    NIXOS_OZONE_WL = "1";
    _JAVA_OPTIONS = "-Dawt.toolkit.name=WLToolkit";
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromJSON (
      builtins.readFile ./omp-theme.json
    );
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
