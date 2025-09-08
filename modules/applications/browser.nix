{ config, pkgs, ... }:
{
  programs.brave = {
    enable = true;
    extensions = [
      "nngceckbapebfimnlniiiahkmmgnoini" # Bitwarden
      "okadibdjfemhmcjkaemgkpjjdhfalhmm" # uBlock Origin Light
      "clngdbkpkpeebahjckkjfobafhncgmne" # Stylus
    ];
  };
}