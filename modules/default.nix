{ lib, ... }:

{
  imports = builtins.attrValues (
    lib.filterAttrs 
      (name: type: 
        type == "regular" && 
        lib.hasSuffix ".nix" name && 
        name != "default.nix"
      )
      (builtins.mapAttrs 
        (name: type: ./. + "/${name}")
        (builtins.readDir ./.)
      )
  );
}

