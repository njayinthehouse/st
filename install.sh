#!/bin/sh
# install.sh — build st and install the binary into ~/.local/bin.
#
#   st -> ~/.local/bin/st
#
# Re-runnable. Copies the built binary (not a symlink), then stamps itself LAST
# so the .zshrc change-detector sees the stamp as newer than every build
# artifact — only editing a source file (e.g. config.h) re-triggers a rebuild.
# Mirrors the nvwm / sweettalker self-install pattern.

set -eu

REPO="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"

make -C "$REPO" >/dev/null

mkdir -p "$HOME/.local/bin"
cp -f "$REPO/st" "$HOME/.local/bin/st"
chmod 755 "$HOME/.local/bin/st"

touch "$HOME/.local/bin/.st-installed"
echo "installed $HOME/.local/bin/st"
