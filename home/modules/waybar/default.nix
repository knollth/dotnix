{config, pkgs,lib,...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;
        spacing = 0;

        modules-left = [
          ""
        ]
        
      };
    };
  };
}
