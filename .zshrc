# Extra stuff
source ~/.zshrc_priv

eval "$(rbenv init -)"

. /usr/share/nvm/init-nvm.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# User configuration
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Ignore commands that start with spaces and duplicates.

export HISTCONTROL=ignoreboth


[[ -z "${plugins[*]}" ]] && plugins=(git fzf extract)

# source $ZSH/oh-my-zsh.sh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Don't add certain commands to the history file.

export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Use custom `less` colors for `man` pages.

export LESS_TERMCAP_md="$(tput bold 2> /dev/null; tput setaf 2 2> /dev/null)"
export LESS_TERMCAP_me="$(tput sgr0 2> /dev/null)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.

export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
  
# enable command-subsitution in PS1
setopt PROMPT_SUBST

# Fish-like syntax highlighting and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
  
if [[ "$(tty)" == '/dev/tty1' ]]; then
	exec startx
fi

# initialise autocompletion
autoload -Uz compinit
compinit

# history setup
export HISTFILE='~/.config/zshrc.d/.zsh_history'
setopt SHARE_HISTORY
HISTFILE=$HOME/.config/zshrc.d/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# Cleanup orphaned packages
alias cleanup="sudo pacman -Rsn $(pacman -Qtdq)"

alias pamcan=pacman

alias lgt="loginctl terminate-user $USER"
alias rbt="systemctl reboot"
alias sdn="systemctl poweroff"

alias py="python3"
alias nv="nvim"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=/home/justint/.cfg/ --work-tree=/home/justint'
