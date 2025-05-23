{config, pkgs,lib,...}:
{
  home.shell.enableZshIntegration = true;

  programs.zsh = {
    enable = true;
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
