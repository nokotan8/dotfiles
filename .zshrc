# Extra stuff
source ~/.zshrc_priv

export ZSH=$HOME/.zsh

# IMF setup
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx

if [[ "$(tty)" == '/dev/tty1' ]]; then
	exec startx
fi

# Use custom `less` colors for `man` pages.
export LESS_TERMCAP_md="$(tput bold 2> /dev/null; tput setaf 2 2> /dev/null)"
export LESS_TERMCAP_me="$(tput sgr0 2> /dev/null)"
  
# Spaceship
export SPACESHIP_CONFIG="$HOME/.config/spaceship.zsh"
source "$ZSH/spaceship/spaceship.zsh"

[[ -z "${plugins[*]}" ]] && plugins=(git fzf extract)
# Fish-like syntax highlighting and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
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
SAVEHIST=1000
HISTSIZE=999
setopt SHARE_HISTORY
export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"
export HISTCONTROL=ignoreboth
setopt HIST_FIND_NO_DUPS
# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
# enable command-subsitution in PS1
setopt PROMPT_SUBST

# Cleanup orphaned packages
alias cleanup="sudo pacman -Rsn $(pacman -Qtdq)"
alias pamcan=pacman

alias lgt="loginctl terminate-user $USER"
alias rbt="systemctl reboot"
alias sdn="systemctl poweroff"

alias py="python3"
alias nv="nvim"

alias gs="git status --short"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gu="git pull" # pull ~= update

# nvm
. /usr/share/nvm/init-nvm.sh
eval "$(rbenv init -)"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=/home/justint/.cfg/ --work-tree=/home/justint'
