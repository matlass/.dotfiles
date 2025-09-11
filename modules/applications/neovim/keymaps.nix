{ lib, ... }:

{
  programs.nvf.settings.vim = {
    maps = {
      normal = {
        # File tree (use mkForce to override any conflicts)
        "<leader>e" = lib.mkForce {
          action = ":NvimTreeToggle<CR>";
          desc = "Toggle file tree";
        };
        "<leader>o" = lib.mkForce {
          action = ":NvimTreeFocus<CR>";
          desc = "Focus file tree";
        };
        
        # Oil directory editing
        "-" = {
          action = ":Oil<CR>";
          desc = "Open parent directory";
        };
        
        # Telescope (these should be safe)
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
        
        # Harpoon (these should be safe)
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
        
        # Buffer navigation (fixed to be consistent and avoid conflicts)
        "<leader>bn" = lib.mkForce {
          action = ":bnext<CR>";
          desc = "Next buffer";
        };
        "<leader>bp" = lib.mkForce {
          action = ":bprevious<CR>";
          desc = "Previous buffer";
        };
        "<leader>bd" = {
          action = ":bdelete<CR>";
          desc = "Delete buffer";
        };
        
        # Alternative buffer navigation (recommended to avoid conflicts)
        "]b" = {
          action = ":bnext<CR>";
          desc = "Next buffer";
        };
        "[b" = {
          action = ":bprevious<CR>";
          desc = "Previous buffer";
        };
        
        # LSP (use mkForce for potential conflicts)
        "gd" = lib.mkForce {
          action = ":lua vim.lsp.buf.definition()<CR>";
          desc = "Go to definition";
        };
        "gr" = lib.mkForce {
          action = ":lua vim.lsp.buf.references()<CR>";
          desc = "Go to references";
        };
        "gi" = lib.mkForce {
          action = ":lua vim.lsp.buf.implementation()<CR>";
          desc = "Go to implementation";
        };
        "K" = lib.mkForce {
          action = ":lua vim.lsp.buf.hover()<CR>";
          desc = "Hover documentation";
        };
        "<leader>ca" = lib.mkForce {
          action = ":lua vim.lsp.buf.code_action()<CR>";
          desc = "Code actions";
        };
        "<leader>rn" = lib.mkForce {
          action = ":lua vim.lsp.buf.rename()<CR>";
          desc = "Rename symbol";
        };
        
        # Diagnostics (these might conflict with NVF's diagnostic module)
        "<leader>xx" = lib.mkForce {
          action = ":TroubleToggle<CR>";
          desc = "Toggle trouble";
        };
        "[d" = lib.mkForce {
          action = ":lua vim.diagnostic.goto_prev()<CR>";
          desc = "Previous diagnostic";
        };
        "]d" = lib.mkForce {
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
