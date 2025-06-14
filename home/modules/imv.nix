{config, pkgs,lib,...}:
{
  programs.imv = {
    enable = true;
    package = pkgs.imv;
  };
}
