{config, pkgs,lib,...}:
{
  programs.git = {
    enable = true;
    userName = "knollth";
    userEmail = "tom@knollth.xyz";
  };
}
