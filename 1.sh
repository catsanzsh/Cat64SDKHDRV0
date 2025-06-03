#!/bin/bash
set -e

echo "[*] Setting up N64 toolchain via wget (no git)..."

# Prep
mkdir -p ~/n64dev
cd ~/n64dev

# Dependencies
sudo apt update
sudo apt install -y build-essential wget unzip cmake bison flex libpng-dev zlib1g-dev texinfo

# Download prebuilt toolchain (hosted by DragonMinded or community mirrors)
echo "[*] Downloading prebuilt N64 toolchain..."
wget -O toolchain.zip https://retrons.dev/files/n64dev/toolchain_mips64-elf.zip

# Extract
echo "[*] Extracting..."
unzip toolchain.zip -d toolchain

# Optional: download precompiled libdragon (if needed)
echo "[*] Downloading precompiled libdragon..."
wget -O libdragon.zip https://retrons.dev/files/n64dev/libdragon_prebuilt.zip
unzip libdragon.zip -d libdragon

# Set up environment (can be added to .bashrc/.zshrc)
echo "export N64DEV=\$HOME/n64dev" >> ~/.bashrc
echo "export PATH=\$PATH:\$HOME/n64dev/toolchain/bin" >> ~/.bashrc

echo "[✓] Toolchain installed!"
echo "🕹️  Run 'source ~/.bashrc' or restart terminal."
