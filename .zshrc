# Extra stuff
source ~/.zshrc_priv

export ZSH=$HOME/.zsh

# Linux/Arch specific stuff
if [[ "$(uname)" == "Linux" ]]; then
    source ~/.zshrc_arch
fi

# Use custom `less` colors for `man` pages.
export LESS_TERMCAP_md="$(tput bold 2> /dev/null; tput setaf 2 2> /dev/null)"
export LESS_TERMCAP_me="$(tput sgr0 2> /dev/null)"
  
# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# yazi
export EDITOR="nvim"
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
# zoxide
eval "$(zoxide init zsh)"

# initialise autocompletion
autoload -Uz compinit
compinit

# history setup
export HISTFILE="$ZSH/.zsh_history"
SAVEHIST=5000
HISTSIZE=4999
setopt SHARE_HISTORY
export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"
export HISTCONTROL=ignoreboth
setopt HIST_FIND_NO_DUPS
# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
# enable command-subsitution in PS1
setopt PROMPT_SUBST

alias py="python3"
alias nv="nvim"

alias gs="git status --short"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gu="git pull" # pull ~= update
alias gd="git diff"

# https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=/home/justint/.cfg/ --work-tree=/home/justint'

eval "$(starship init zsh)"
