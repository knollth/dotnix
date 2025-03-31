{config, pkgs,lib,...}:
{
  programs.zsh.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
