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

echo "Upgrading NixOS system ($HOST)..."
sudo nixos-rebuild switch --flake "$FLAKE_PATH#$HOST"
