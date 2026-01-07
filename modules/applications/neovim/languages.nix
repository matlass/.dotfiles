{...}: {
  programs.nvf.settings.vim = {
    # Explicitly enable treesitter as a core plugin
    treesitter = {
      enable = true;
    };

    languages = {
      enableTreesitter = true;
      enableFormat = true;
      enableExtraDiagnostics = true;

      # Core languages
      nix.enable = true;
      bash.enable = true;

      # System programming
      clang.enable = true;
      rust.enable = true;
      go.enable = true;

      # Web development
      html.enable = true;
      css.enable = true;

      # Data formats
      yaml.enable = true;
      markdown.enable = true;

      # Other
      python.enable = true;
    };
  };
}
