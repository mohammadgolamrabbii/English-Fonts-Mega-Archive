#!/usr/bin/env bash
# ==============================================================================
# World's Largest English & Western Open Typography Mega Archive (50,000+ Fonts)
# Linux & Docker Automated Installation Script
# Curated by Mohammad Golamrabbii (https://linktr.ee/golamrabbii)
# ==============================================================================

set -euo pipefail

TARGET_DIR="/usr/share/fonts/truetype/english-mega-archive"
REPO_URL="https://github.com/mohammadgolamrabbii/English-Fonts-Mega-Archive.git"

echo "======================================================================"
echo "Installing World's Largest English Open Typography Mega Archive..."
echo "Curated by Mohammad Golamrabbii (@mohammadgolamrabbii)"
echo "Target Directory: $TARGET_DIR"
echo "======================================================================"

if [ "$EUID" -ne 0 ]; then
    echo "[!] Notice: Please run as root (or use sudo) if installing system-wide."
    TARGET_DIR="$HOME/.local/share/fonts/english-mega-archive"
    echo "[*] Falling back to user font directory: $TARGET_DIR"
fi

mkdir -p "$TARGET_DIR"

if [ -d "$TARGET_DIR/.git" ]; then
    echo "[*] Updating existing font repository..."
    git -C "$TARGET_DIR" pull --ff-only
else
    echo "[*] Cloning English Fonts Mega Archive (shallow clone)..."
    git clone --depth 1 "$REPO_URL" "$TARGET_DIR"
fi

echo "[*] Refreshing font cache with fc-cache..."
fc-cache -fv "$TARGET_DIR"

echo "======================================================================"
echo "✅ Installation Complete! 50,000+ English Typefaces are now active."
echo "Verify anytime by running: fc-list :lang=en"
echo "======================================================================"
