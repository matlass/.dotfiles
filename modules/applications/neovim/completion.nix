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
          confirm = "<CR>";      
          next = "<Tab>";         
          previous = "<S-Tab>";    
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
