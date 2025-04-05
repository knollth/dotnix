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

  home.sessionVariables = {
    EDITOR="nvim";
    UNI="$HOME/Documents/Studium";
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
