{config, pkgs,lib,...}:
{
  programs.direnv = {
    enable = true;
    settings = {
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
