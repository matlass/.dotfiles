let
  nvf = import (builtins.fetchTarball {
    url = "https://github.com/notashelf/nvf/archive/0383311.tar.gz";
  });
in {
  imports = [
    nvf.homeManagerModules.nvf
  ];

  programs.nvf.enable = true;
}
