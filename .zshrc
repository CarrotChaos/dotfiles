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
export PS1="%{$fg_bold[green]%}%n@%{$reset_color%}%{$fg_bold[magenta]%}%m%{$reset_color%} %{$fg_bold[yellow]%}%~%{$reset_color%} %{$fg_bold[yellow]%}$%{$reset_color%} "

RANGER_LOAD_DEFAULT_RC=false
# export PASSWORD_STORE_TOMB_KEY=/mnt/Ventoy/.password.tomb.key
# export PASSWORD_STORE_TOMB_KEY=~/.password.tomb.key
export EDITOR=nvim
source "$HOME/.zsh/zsh-vi-mode/zsh-vi-mode.zsh"
export PATH="$HOME/.cargo/bin:$PATH"
# export PATH="$PATH:$(go env GOPATH)/bin"
alias sudo='doas'
alias sudoedit='doasedit'
alias decrypt='~/scripts/decrypt.sh'
alias encrypt='~/scripts/encrypt.sh'
alias start-vm='~/scripts/start-vm.sh'
alias stop-vm='~/scripts/stop-vm.sh'
alias theme='~/scripts/theme.sh'

# Only changing the escape key to `jk` in insert mode, we still
# keep using the default keybindings `^[` in other modes
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
