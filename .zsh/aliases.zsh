# ----------------------
# Misc basic aliases
# ----------------------
alias c="clear"
alias ..="cd .."
alias ...="cd ~"
alias o="open ."
alias s="ssh"
alias grep="grep --color"
alias x="exit"

# Changing "ls" to "lsd"
alias ls='lsd -al --color=always --group-directories-first' # my preferred listing
alias la='lsd -a --color=always --group-directories-first' # all files and dirs
alias ll='lsd -l --color=always --group-directories-first' # long format
alias lt='lsd -aT --color=always --group-directories-first' # tree listing
alias l.='lsd -a | egrep "^\."'

# confirm before overwriting something
alias mv="mv -iv"
alias rm="rm -i"
alias ln="ln -iv"
alias cp="cp -riv"

alias "?"=duck
alias "??"=google
alias "???"=bing

# ----------------------
# Networking
# ----------------------
alias processes="ps -f"
alias ports="netstat -tulnp | grep LISTEN"
alias router="ip route | grep default"
alias ip-private="ipconfig getifaddr en0"
alias ip-public="curl -4 ifconfig.co"

# ----------------------
# Utilities
# ----------------------
alias myip="host myip.opendns.com resolver1.opendns.com | grep 'myip.opendns.com has' | awk '{print $4}'"
alias diskusage="df -h"
alias folderusage="du -ch"
alias totalfolderusage="du -sh"
# flush dns cache for macos
if [[ $OSTYPE == darwin* ]]; then
  alias flush="dscacheutil -flushcache"
fi
# open ~/.zshrc in using the default editor specified in $EDITOR
alias esh="$EDITOR ~/.zshrc"
alias eal="$EDITOR ~/.config/.custom_aliases"
alias sc="source $HOME/.zshrc"
# Repo for dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME" # git config

alias npml="npm list -g"
alias sslagent="eval $(ssh-agent -s)"

# Matrix animation in terminal
alias mx="tmatrix --color=cyan"
# ASCII aquarium
alias ftank="asciiquarium"

# ----------------------
# vim "nvim"
# ----------------------
alias vi="nvim"
alias vim="nvim"
alias ea="$EDITOR ~/.zsh/aliases.zsh"
alias ez="$EDITOR ~/.zshrc"
alias eg="$EDITOR ~/.gitconfig"
alias ev="$EDITOR ~/.vimrc"

# ----------------------
# tmux
# ----------------------
alias t="tmux" # start tmux
alias ta="t a -t" # attach to session
alias tls="t ls" # list sessions
alias tn="t new -s primary" # new session named primary
alias tks="t kill-session -t" # kill session by name