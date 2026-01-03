# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
autoload -U colors && colors
export PS1="%{$fg_bold[green]%}%n@%{$reset_color%}%{$fg_bold[cyan]%}%m%{$reset_color%} %{$fg_bold[yellow]%}%~%{$reset_color%} %{$fg_bold[yellow]%}$%{$reset_color%} "
alias ls='ls --color=auto'

RANGER_LOAD_DEFAULT_RC=false
export PASSWORD_STORE_TOMB_KEY=/mnt/Ventoy/.password.tomb.key
export EDITOR=nvim
source ~/zsh_plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Only changing the escape key to `jk` in insert mode, we still
# keep using the default keybindings `^[` in other modes
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
