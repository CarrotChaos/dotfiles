# ~/.zshrc
RANGER_LOAD_DEFAULT_RC=false
export EDITOR=nvim

# Load default LS_COLORS for your terminal
if [ -x /usr/bin/dircolors ]; then
  eval "$(dircolors -b)"
fi

zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
alias ls="ls --color"

zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt interactivecomments
setopt no_case_glob no_case_match # make cmp case insensitive

eval "$(starship init zsh)"

source ~/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
