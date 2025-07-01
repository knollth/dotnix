{config, pkgs,lib,...}:
{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        statusline.lualine.enable = true;
        telescope.enable = true;
        autopairs.nvim-autopairs.enable = true;

        utility.preview.markdownPreview.enable = true;

        diagnostics = {
          enable = true;
          config = {
            #virtual_lines = true;
            virtual_signs = true;
            virtual_text = true;
          };
        };

        clipboard = {
          enable = true;
          registers = "unnamedplus";
        };

        lsp.enable = true;

        languages = {
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          nix.enable = true;
          markdown.enable = true;
          typst = {
            enable = true;
            lsp.enable = true;
          };
          ocaml = {
            enable = true;
            format.enable = false;
          };
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
