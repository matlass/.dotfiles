{ inputs, ... }:

let
  # Get the repository root path from flake inputs
  repoRoot = "${inputs.self}";
in
{
  # Base repository paths
  dotfilesPath = "${repoRoot}";
  
  # Module paths
  modulesPath = "${repoRoot}/modules";
  scriptsPath = "${repoRoot}/modules/scripts";
  imagesPath = "${repoRoot}/modules/images";
  iconsPath = "${repoRoot}/modules/icons";
  
  # Script paths for aliases
  nixosRebuildScript = "${repoRoot}/modules/scripts/nixos-rebuild.sh";
  updateScript = "${repoRoot}/modules/scripts/update.sh";
  homeManagerRebuildScript = "${repoRoot}/modules/scripts/home-manager-rebuild.sh";
  
  # Image paths
  nixDarkImage = "${repoRoot}/modules/images/nix-dark.png";
  nixosAsciiWallpaper = "${repoRoot}/modules/images/nixos_ascii_wallpapaer.jpg";
}
