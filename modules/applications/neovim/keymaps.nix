{ ... }:

{
  programs.nvf.settings.vim = {
    maps = {
      normal = {
        # File tree
        "<leader>e" = {
          action = ":NvimTreeToggle<CR>";
          desc = "Toggle file tree";
        };
        "<leader>o" = {
          action = ":NvimTreeFocus<CR>";
          desc = "Focus file tree";
        };
        
        # Oil directory editing
        "-" = {
          action = ":Oil<CR>";
          desc = "Open parent directory";
        };
        
        # Telescope
        "<leader>ff" = {
          action = ":Telescope find_files<CR>";
          desc = "Find files";
        };
        "<leader>fg" = {
          action = ":Telescope live_grep<CR>";
          desc = "Live grep";
        };
        "<leader>fb" = {
          action = ":Telescope buffers<CR>";
          desc = "Find buffers";
        };
        "<leader>fh" = {
          action = ":Telescope help_tags<CR>";
          desc = "Help tags";
        };
        "<leader>fr" = {
          action = ":Telescope oldfiles<CR>";
          desc = "Recent files";
        };
        "<leader>fc" = {
          action = ":Telescope colorscheme<CR>";
          desc = "Colorschemes";
        };
        
        # Harpoon
        "<leader>a" = {
          action = ":lua require('harpoon.mark').add_file()<CR>";
          desc = "Harpoon add file";
        };
        "<leader>h" = {
          action = ":lua require('harpoon.ui').toggle_quick_menu()<CR>";
          desc = "Harpoon quick menu";
        };
        "<leader>1" = {
          action = ":lua require('harpoon.ui').nav_file(1)<CR>";
          desc = "Harpoon file 1";
        };
        "<leader>2" = {
          action = ":lua require('harpoon.ui').nav_file(2)<CR>";
          desc = "Harpoon file 2";
        };
        "<leader>3" = {
          action = ":lua require('harpoon.ui').nav_file(3)<CR>";
          desc = "Harpoon file 3";
        };
        "<leader>4" = {
          action = ":lua require('harpoon.ui').nav_file(4)<CR>";
          desc = "Harpoon file 4";
        };
        
        # Buffer navigation
        "<leader>bn" = {
          action = ":bnext<CR>";
          desc = "Next buffer";
        };
        "<leader>bp" = {
          action = ":bprevious<CR>";
          desc = "Previous buffer";
        };
        "<leader>bd" = {
          action = ":bdelete<CR>";
          desc = "Delete buffer";
        };
        
        # LSP
        "gd" = {
          action = ":lua vim.lsp.buf.definition()<CR>";
          desc = "Go to definition";
        };
        "gr" = {
          action = ":lua vim.lsp.buf.references()<CR>";
          desc = "Go to references";
        };
        "gi" = {
          action = ":lua vim.lsp.buf.implementation()<CR>";
          desc = "Go to implementation";
        };
        "K" = {
          action = ":lua vim.lsp.buf.hover()<CR>";
          desc = "Hover documentation";
        };
        "<leader>ca" = {
          action = ":lua vim.lsp.buf.code_action()<CR>";
          desc = "Code actions";
        };
        "<leader>rn" = {
          action = ":lua vim.lsp.buf.rename()<CR>";
          desc = "Rename symbol";
        };
        
        # Diagnostics
        "<leader>xx" = {
          action = ":TroubleToggle<CR>";
          desc = "Toggle trouble";
        };
        "[d" = {
          action = ":lua vim.diagnostic.goto_prev()<CR>";
          desc = "Previous diagnostic";
        };
        "]d" = {
          action = ":lua vim.diagnostic.goto_next()<CR>";
          desc = "Next diagnostic";
        };
        
        # Which-key
        "<leader>?" = {
          action = ":WhichKey<CR>";
          desc = "Show all keybindings";
        };
      };
    };
  };
}
