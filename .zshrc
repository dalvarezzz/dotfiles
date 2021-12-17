# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.bin:$HOME/.deno/bin:$PATH
export DENO_INSTALL=$HOME/.deno
# Path to your oh-my-zsh installation.
export ZSH="/home/ddvlzsz/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# dotfiles config
alias config='git --git-dir=/home/ddvlzsz/dotfiles/.git --work-tree=/home/ddvlzsz/.config'
alias cat='bat'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(zoxide init zsh)"
