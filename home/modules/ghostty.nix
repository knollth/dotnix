{config, pkgs,lib,...}:
{
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "terafox";
      window-theme = "ghostty";
      font-family = "Fira Code Nerd Font";
      keybind = [
        "alt+enter=new_split:auto"
        "alt+q=close_surface"

        "alt+k=goto_split:up"
        "alt+j=goto_split:down"
        "alt+h=goto_split:left"
        "alt+l=goto_split:right"

        "alt+shift+k=resize_split:up,20"
        "alt+shift+j=resize_split:down,20"
        "alt+shift+h=resize_split:left,20"
        "alt+shift+l=resize_split:right,20"
      ];

    };
  };
}
