fpath=( "$HOME/.zfunctions" $fpath )
# oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
ZSH_THEME="bira"
#ZSH_THEME="lambda"

#alias look_busy="docker run -it --rm svenstaro/genact"

#[[ $EMACS = t ]] && unsetopt zle

# Disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="false"

# Plugins
plugins=(golang rust git-extras macos yarn zsh-completions brew wd python vi-mode colorize docker docker-compose zsh-syntax-highlighting history pipenv pip compleat zsh-autosuggestions)

# For zsh-completions
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

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
eval "$( brew shellenv )"
export PYENV_VERSION=3.9.5  # Set your preferred Python version.
export PYENV_ROOT=~/.pyenv
export PIPX_BIN_DIR=~/.local/bin
export -U PATH path         # -U eliminates duplicates
path=( 
    $PIPX_BIN_DIR
    $PYENV_ROOT/{bin,shims} 
    $path
)

eval "$( pyenv init - )"
eval "$( pip completion --zsh )"
eval "$( register-python-argcomplete pipx )"
# eval "$( pipenv --completion )"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
