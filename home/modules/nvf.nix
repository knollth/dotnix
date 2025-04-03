{config, pkgs,lib,...}:
{
  programs.nvf = {

    enable = true;

    settings = {

      vim = {
        
        statusline.lualine.enable = true;
        telescope.enable = true;
        autopairs.nvim-autopairs.enable = true;

        useSystemClipboard = true;

        languages = {
          enableLSP = true;
          enableTreesitter = true;

          nix.enable = true;
          ocaml.enable = true;
        };

        autocomplete.nvim-cmp = {
          enable = true;
          mappings = {
            confirm = "<C-y>";
            next = "<C-n>";
            previous = "<C-p>";
          };
        };

        options = {
          shiftwidth = 2;
          tabstop = 2;
          expandtab = true;
        };

        lazy.plugins = {
          "nightfox.nvim" = {
            package = pkgs.vimPlugins.nightfox-nvim;
            setupModule = "nightfox";
            after = ''vim.cmd("colorscheme terafox")'';
          };
        };
      };
    };
  };
}
