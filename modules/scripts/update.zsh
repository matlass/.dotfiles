#!/usr/bin/env zsh

set -e

FLAKE_PATH="$HOME/.config/nixos"
HOST="bok"
USER_OUT="matthieu"

cd "$FLAKE_PATH"

echo "Staging all changes for git..."
git add .

echo "Enter your commit message: "
read COMMIT_MSG

git commit -m "$COMMIT_MSG"

echo "Updating flake inputs in $FLAKE_PATH..."
nix flake update

echo "Upgrading NixOS system ($HOST)..."
sudo nixos-rebuild switch --flake "$FLAKE_PATH#$HOST"

echo "Upgrading Home Manager user config ($USER_OUT)..."
home-manager --flake "$FLAKE_PATH#$USER_OUT" switch

echo "Pushing to remote..."
git push

echo "Done! Your work is committed, system and user packages are up-to-date."
