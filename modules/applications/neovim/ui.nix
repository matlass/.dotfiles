{ ... }:

{
  programs.nvf.settings.vim = {
    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
    };
    
    ui = {
      noice.enable = true;
    };
    
    visuals = {
      rainbow-delimiters.enable = true;
      indent-blankline.enable = true;
    };
    
    statusline.lualine.enable = true;
    
    tabline.nvimBufferline = {
      enable = true;
    };
    
    git = {
      gitsigns.enable = true;
    };
    
    mini.pairs.enable = true;
  };
}
