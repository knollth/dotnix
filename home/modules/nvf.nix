{config, pkgs,lib,...}:
{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        options = {
          shiftwidth = 2;
          tabstop = 2;
          expandtab = true;
        };
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        languages = {
          enableLSP = true;
          enableTreesitter = true;

          nix.enable = true;
        };
      };
    };
  };
}
