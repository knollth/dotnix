{config, pkgs,lib,...}:
{
  programs.nvf = {

    enable = true;

    settings = {

      vim = {
        lazy.plugins = {
          "nightfox.nvim" = {
            package = pkgs.vimPlugins.nightfox-nvim;
            setupModule = "nightfox";
            after = ''vim.cmd("colorscheme terafox")'';
          };
        };

        options = {
          shiftwidth = 2;
          tabstop = 2;
          expandtab = true;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        autopairs.nvim-autopairs.enable = true;

        languages = {
          enableLSP = true;
          enableTreesitter = true;

          nix.enable = true;
          ocaml.enable = true;
        };
      };
    };
  };
}
