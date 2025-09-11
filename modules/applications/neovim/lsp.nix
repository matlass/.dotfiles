{...}: {
  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
      lspkind.enable = true;
      trouble = {
        enable = true;
      };
      lightbulb.enable = true;
      lspsaga.enable = false;
    };
    ui.fastaction.enable = true;
    diagnostics = {
      nvim-lint = {
        enable = true;
        lint_after_save = true;
        linters_by_ft = {
          python = ["ruff"];
          nix = ["statix"];
          c = ["clang-tidy"];
          javascript = ["eslint"];
          typescript = ["eslint"];
        };
      };
    };
  };
}
