{pkgs, ...}: {
  imports = [
    ./options.nix
    ./ui.nix
    ./lsp.nix
    ./completion.nix
    ./telescope.nix
    ./filetree.nix
    ./navigation.nix
    ./keymaps.nix
    ./languages.nix
    ./plugins.nix
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        withNodeJs = true;
        withPython3 = true;
        withRuby = true;
        globals = {
          mapleader = " ";
          maplocalleader = " ";
        };
      };
    };
  };

  # External packages needed for LSP servers and tools
  home.packages = with pkgs; [
    # Core tools
    fzf
    ripgrep
    fd

    # Nix
    nixpkgs-fmt
    nil
    statix

    # System
    nodejs
    gcc
    gnumake
    libclang

    # Language servers
    nodePackages.typescript-language-server
    nodePackages.eslint
    python3Packages.python-lsp-server
    ruff
    rust-analyzer
    gopls
    html-tidy
    nodePackages.vscode-langservers-extracted # html, css, json, eslint

    #library for C
    libpng12
    pkg-config
  ];
}
