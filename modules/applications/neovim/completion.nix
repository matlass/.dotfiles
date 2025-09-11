{ pkgs, ... }:

{
  programs.nvf.settings.vim = {
    autocomplete = {
      nvim-cmp = {
        enable = true;
        sources = {
          nvim_lsp = "[LSP]";
          path = "[Path]";
          buffer = "[Buffer]";
          luasnip = "[Snippet]";
        };
        mappings = {
          complete = "<C-Space>";
          confirm = ["<CR>" "<Tab>"];
          next = ["<Tab>" "<C-n>"];
          previous = ["<S-Tab>" "<C-p>"];
          close = "<C-e>";
          scrollDocsUp = "<C-d>";
          scrollDocsDown = "<C-f>";
        };
      };
    };
    
    # Add path completion via lazy plugins
    # lazy.plugins."cmp-path" = {
    #   package = pkgs.vimPlugins.cmp-path;
    #   event = "InsertEnter";
    # };
  };
}
