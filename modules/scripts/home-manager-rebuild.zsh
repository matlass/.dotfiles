#!/usr/bin/env zsh

set -e

FLAKE_PATH="$HOME/.config/nixos"
USER_OUT="matthieu"

cd "$FLAKE_PATH"

echo "Staging all changes for git..."
git add .

echo "Enter your commit message: "
read COMMIT_MSG

git commit -m "$COMMIT_MSG"

echo "Upgrading Home Manager user config ($USER_OUT)..."
home-manager --flake "$FLAKE_PATH#$USER_OUT" switch

