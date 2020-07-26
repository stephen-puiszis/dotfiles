# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git ruby brew rvm nvm)

source $ZSH/oh-my-zsh.sh
export EDITOR="code --wait" # VS Code

# python and pyenv config
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# NVM Configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# NVM auto-loading hook, make sure this happens after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Android Emulator
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
export ANDROID_HOME="$ANDROID_SDK_ROOT"
export ANDROID_NDK_HOME="$ANDROID_SDK_ROOT/ndk-bundle"
export PATH="$PATH:$ANDROID_SDK_ROOT/emulator"
export PATH="$PATH:$ANDROID_SDK_ROOT/tools"
export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"

#### Docker Stuff ###################################

# Find a docker-container, and attach to it
# To detach, by default this is Ctrl-P/Ctrl-Q
# but most people think that Control-C should do it, so we set that
# Ref: https://docs.docker.com/engine/reference/commandline/attach
#
# Note: in order to attach to a container, you must have it started
# with docker-compose settings:
# app:
#   tty: true
#   stdin_open: true
function docker-compose-attach() {
  docker attach $(docker-compose ps -q $1) --detach-keys="ctrl-c";
}

alias dockerc='docker-compose'
alias dockerc-attach='docker-compose-attach'
alias dockerc-attach='docker-compose-attach'

# Helpful Aliases
alias whatismyip="dig +short myip.opendns.com @resolver1.opendns.com"
alias reload-zshrc=". ~/.zshrc"   # Reloads shell session

# Yarn configuration
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export GEM_HOME="$RVM_PATH/gems"  # Gems
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to path for scripting (to manage Ruby versions)
export PATH="$GEM_HOME/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
