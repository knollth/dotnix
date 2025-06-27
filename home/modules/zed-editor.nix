{config, pkgs,lib,...}:
{
  programs.zed-editor = {
    enable = false;
    extensions = [
      "nix"
      "nvim-nightfox"
      "ocaml"
      "marksman"
    ];
    userSettings = {
      buffer_font_family =  "Hasklug Nerd Font";
      buffer_font_features = {
        "liga" = true;
        "salt" = true;
        "calt" = true;
      };
      load_direnv = "shell_hook";
      vim_mode = true;
      ui_font_size = 16;
      buffer_font_size = 16;
      theme = {
        mode = "system";
        light = "Terafox";
        dark = "Terafox";
      };
    };
  };
}
