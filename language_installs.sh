#!/bin/bash

# Rust Installation
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Node.js Installation via fnm
echo "Installing fnm..."
curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash

# After installing fnm, you might want to install a specific Node.js version
echo "Installing Node.js..."
fnm install --latest
