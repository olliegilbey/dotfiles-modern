# Brewfile for declarative package management
# Generated from brew.sh for idempotent installations

# Taps
tap "oven-sh/bun"

# Essential shells
# Note: bash kept for script compatibility - many tools and CI systems expect bash
brew "bash"              # POSIX shell - required for script compatibility
brew "bash-completion"   # Bash autocompletion
brew "zsh"              # Your primary shell

# Version control and Git utilities
brew "git"              # Distributed version control system
brew "git-extras"       # Useful git extensions for common tasks
brew "gh"               # GitHub CLI for command-line GitHub interaction
brew "lazygit"          # Terminal UI for Git operations

# Core development languages and tools
brew "go"               # Go programming language
brew "lua"              # Lightweight, high-performance programming language
brew "rust-analyzer"    # Language server for Rust

# Modern command-line tools (Rust-based alternatives)
brew "ripgrep"          # Recursive line-oriented search tool (extremely fast)
brew "fd"               # Fast file finder alternative to find (used by LazyVim)
brew "bat"              # Enhanced cat with syntax highlighting and git integration
brew "eza"              # Modern ls replacement with icons, git status, and better defaults
brew "zoxide"           # Smart cd replacement with frecency algorithm
brew "fzf"              # Fuzzy finder for command-line (works with zoxide)
brew "delta"            # Enhanced git diff viewer with syntax highlighting

# Editors and development environments
brew "neovim"           # Modern text editor, enhancement from Vim
brew "vim"              # Highly configurable and robust text editor

# System utilities and tools
brew "tree"             # Recursive directory listing command
brew "wget"             # Network utility to retrieve files from the web
brew "jq"               # JSON processor
brew "imagemagick"      # Image manipulation utilities
brew "findutils"        # File and directory search tools

# Modern package managers and version managers
brew "uv"               # Modern Python package manager (replaces pip, pipenv, poetry)
brew "bun"              # Modern JavaScript runtime and package manager (faster than npm/node)
brew "mise"             # Universal version manager (replaces nvm, rbenv, pyenv, etc.)

# Productivity and task management
brew "todo-txt"         # Simple todo.txt manager for command line
brew "csvkit"           # CSV processing tools including csvstat

# Security and authentication
cask "1password-cli"    # 1Password command-line interface

# Fonts
cask "font-fira-code-nerd-font"  # Programming font with ligatures and icons

# macOS-specific tools
if OS.mac?
  brew "coreutils"      # GNU core utilities (macOS has outdated versions)
  brew "docker"         # Container platform for development
end

# Linux-specific tools
if OS.linux?
  brew "xclip"          # Clipboard utility for accessing clipboard in terminal
end

# gemini-cli
brew "gemini-cli"

# curl
brew "curl"
