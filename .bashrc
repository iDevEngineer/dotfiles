#! /usr/local/bin/bash

export HOMEBREW="/opt/homebrew/bin"
export PNPM_HOME="$HOME/Library/pnpm"
export MY_HOME="$HOME/.local/bin"
export EDITOR="nvim"

export ANSIBLE_INVENTORY="$HOME/.config/ansible/hosts"

# Always append or prepend new paths to $PATH variable in your config file. Example: /etc/paths adds MacOS default paths
export PATH=$PATH:$HOMEBREW:$PNPM_HOME:$MY_HOME

# Start TMUX automatically
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   tmux a -t default || exec tmux new -s default && exit;
# fi

# ----------------------
# Aliases commands
# ----------------------
alias c="clear"
alias ..="cd .."
alias ...="cd ~"
alias ls="exa --icons --long --git -la"
alias o="open ."
alias s="ssh"
alias x="exit"
alias mv="mv -i -v"
alias rm="rm -i"
alias ln="ln -i"
alias "?"=duck
alias "??"=google
alias "???"=bing
alias ftank="asciiquarium"

# ----------------------
# Utilities
# ----------------------
alias myip="host myip.opendns.com resolver1.opendns.com | grep 'myip.opendns.com has' | awk '{print $4}'"
alias diskusage="df -h"
alias folderusage="du -ch"
alias totalfolderusage="du -sh"
if [[ $OSTYPE == darwin* ]]; then
  alias flush="dscacheutil -flushcache"
fi
# open .bashrc in using the default editor specified in $EDITOR
alias esh="$EDITOR "$HOME/.bashrc""
alias sc="source $HOME/.bashrc"
# Repo for dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias sslagent="eval $(ssh-agent -s)"

# Matrix animation in terminal
alias neo="tmatrix --color=cyan"

alias npml="npm list -g"

# Misc
getpid () {
	ps -ax | grep $1
}
mkcd () {
	mkdir $1 && cd $1
}
rmf () {
  rm -rf $1
}
lspath () {
  echo $PATH | sed "s/:/\n/g" | sort | uniq -c
}
bog () {
  toilet -f future Hi $(whoami) --filter metal
}
duck () {
  lynx "https://lite.duckduckgo.com/lite/?q="$1
}
sshg () {
  ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_$1 -C $1
  ssh-add ~/.ssh/id_ed25519_$1
}
sshl () {
  for key in ~/.ssh/id_*; do ssh-keygen -l -f "${key}"; done | uniq
}
chsh () {
  alias chsh="sudo chsh -s $(which zsh) $USER"
}

# GIT shortcuts
g () {
  git status
}
gs () {
  git status -sbu
}
gull () {
  git pull
}
gush () {
  git push
}
gb () {
  git checkout -b $1
}
gc () {
  git commit -am $1
}
gch () {
  git checkout $1
}
glean () {
  git clean -df
}
gmain () {
  git checkout main
}
ghard () {
  git reset --hard
}
grevert () {
  branch=$(git branch | grep \* | cut -d " " -f2);
  git reset --hard origin/$branch
}
gstream () {
  branch=$(git branch | grep \* | cut -d " " -f2);
  git push --set-upstream origin $branch
}
glg () {
	git log --graph --oneline --decorate --all
}
wsh () {
  echo "bash shell is being used"
}

# ----------------------
# vim "nvim"
# ----------------------
alias vi="nvim"
alias vim="nvim"
alias ea="nvim ~/.config/.config_aliases"
alias ez="nvim ~/.zshrc"
alias eg="nvim ~/.gitconfig"
alias ev="nvim ~/.vimrc"

# ----------------------
# tmux
# ----------------------
alias t="tmux" # start tmux
alias ta="t a -t" # attach to session
alias tls="t ls" # list sessions
alias tn="t new -s primary" # new session named primary
alias tks="t kill-session -t" # kill session by name

lynxpath=$(which lynx)

if [ -e "$HOME/.config/lynx/lynx.cfg" ]; then
  export LYNX_CFG="$HOME/.config/lynx/lynx.cfg"
fi
if [ -e "$HOME/.config/lynx/lynx.lss" ]; then
  export LYNX_LSS="$HOME/.config/lynx/lynx.lss"
fi
if [ ! -x "$lynxpath" ]; then
  echo "lynx is not installed"
fi

# yeah, i totally stole this from stack exchange, no shame
rawurlencode () {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  echo "${encoded}"    # You can either set a return variable (FASTER)
  REPLY="${encoded}"   #+or echo the result (EASIER)... or both... :p
}

duck () {
  declare url=$(rawurlencode "$*")
  lynx "https://lite.duckduckgo.com/lite/?q=$url"
}
google () {
  declare url=$(rawurlencode "$*")
  lynx "https://www.google.com/search?q=$url"
}
bing () {
  declare url=$(rawurlencode "$*")
  lynx "https://www.bing.com/search?q=$url"
}

# export NVM_DIR="$HOME/.nvm"
#   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" 

# Start Neofetch
# neofetch
bog

# Start Zoxide #
eval "$(zoxide init bash)"

# Start starship
eval "$(starship init bash)"

# . "$HOME/.cargo/env"
