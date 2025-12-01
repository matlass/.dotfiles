{lib, ...}: let
  # Import all .nix files from current directory (excluding default.nix)
  currentDirImports = builtins.attrValues (
    lib.filterAttrs
    (
      name: type:
        type
        == "regular"
        && lib.hasSuffix ".nix" name
        && name != "default.nix"
    )
    (
      builtins.mapAttrs
      (name: type: ./. + "/${name}")
      (builtins.readDir ./.)
    )
  );

  # Import all .nix files from subdirectories
  subdirectoryImports = let
    dirs = builtins.readDir ./.;
    subdirs = lib.filterAttrs (name: type: type == "directory") dirs;
    importFromSubdir = subdir: let
      subdirPath = ./. + "/${subdir}";
      subdirContents = builtins.readDir subdirPath;
      nixFiles =
        lib.filterAttrs
        (name: type: type == "regular" && lib.hasSuffix ".nix" name)
        subdirContents;
    in
      builtins.attrValues (
        builtins.mapAttrs
        (name: type: subdirPath + "/${name}")
        nixFiles
      );
  in
    lib.flatten (builtins.attrValues (builtins.mapAttrs (name: type: importFromSubdir name) subdirs));
in {
  imports = currentDirImports ++ subdirectoryImports;
}
