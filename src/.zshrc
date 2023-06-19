fpath=( "$HOME/.zfunctions" $fpath )
# oh-my-zsh configuration.
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
ZSH_THEME="bira"
#ZSH_THEME="lambda"

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"

#alias look_busy="docker run -it --rm svenstaro/genact"

#[[ $EMACS = t ]] && unsetopt zle

# Disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="false"

# Plugins
plugins=(
		nvm
		node
		golang
		rust
		git-extras
		macos
		yarn
		zsh-completions
		wd
		python
		vi-mode
		colorize
		docker
		docker-compose
		zsh-syntax-highlighting
		history
		pipenv
		compleat
		zsh-autosuggestions
)
#		brew
#		pip

# For zsh-completions
autoload -U compinit && compinit

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
# source $ZSH/oh-my-zsh.sh

# Vi mode normal prompt indicator
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[green]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$EPS1"
    zle reset-prompt
}

source $HOME/.aliases

# eval $(thefuck --alias)

# Fix for vim-instant-markdown
set shell=bash\ -i

# The next line updates PATH for the Google Cloud SDK.
# source '/Applications/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
# source '/Applications/google-cloud-sdk/completion.zsh.inc'

#export BOOT_CLOJURE_VERSION=1.9.0
#export BOOT_VERSION=2.8.0-SNAPSHOT
#export BOOT_JVM_OPTIONS='
#	-client
#	-XX:+TieredCompilation
#	-XX:TieredStopAtLevel=1
#	-Xmx2g
#	-XX:+CMSClassUnloadingEnabled
#	-Xverify:none'
#

# for pipenv
#eval "$( brew shellenv )"
#export PYENV_VERSION=3.9.5  # Set your preferred Python version.
#export PYENV_ROOT=~/.pyenv
#export PIPX_BIN_DIR=~/.local/bin
#export -U PATH path         # -U eliminates duplicates
#path=(
#    $PIPX_BIN_DIR
#    $PYENV_ROOT/{bin,shims}
#    $path
#)
#
#eval "$( pyenv init - )"
#eval "$( pip completion --zsh )"
#eval "$( register-python-argcomplete pipx )"
# eval "$( pipenv --completion )"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#export GOROOT=/usr/local/go-1.18.1
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/go/bin
. "$HOME/.cargo/env"

eval "$(fnm env --use-on-cd)"
export PATH=/usr/local/share/npm/bin:$PATH

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="/Users/olivergilbey/cudos/rust/cwc/target/release:$PATH"
