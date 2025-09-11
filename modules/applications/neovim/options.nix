{ ... }:

{
  programs.nvf.settings.vim = {
    lineNumberMode = "relNumber";
    options = {
      # Indentation
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
      
      # Search
      ignorecase = true;
      smartcase = true;
      hlsearch = false;
      incsearch = true;
      
      # Display
      wrap = false;
      termguicolors = true;
      scrolloff = 8;
      signcolumn = "yes";
      colorcolumn = "80";
      
      # Behavior
      updatetime = 50;
      isfname = "@,48-57,/,.,-,_,+,,,#,$,%,~,=";
    };
  };
}
