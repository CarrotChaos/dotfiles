# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
fpath=(/usr/share/zsh/site-functions $fpath)
autoload -Uz compinit
compinit
autoload -U colors && colors
alias ls='ls --color=auto'

RANGER_LOAD_DEFAULT_RC=false
export PASSWORD_STORE_TOMB_KEY=/mnt/Ventoy/.password.tomb.key
export EDITOR=nvim
source "$HOME/.zsh/zsh-vi-mode/zsh-vi-mode.zsh"


# Only changing the escape key to `jk` in insert mode, we still
# keep using the default keybindings `^[` in other modes
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
eval "$(starship init zsh)"

