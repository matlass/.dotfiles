#!/usr/bin/env bash
set -e
echo "starting to save space"
sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system
home-manager expire-generations '-1 days'

echo "removing garbage"
sudo nix-collect-garbage -d
nix-collect-garbage -d
nix-store --gc
nix-store --optimise
