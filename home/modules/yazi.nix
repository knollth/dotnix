{pkgs,lib,config,...}:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };
}
