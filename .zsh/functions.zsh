# ----------------------
# Terminal functions
# ----------------------
getpid () {
	ps -ax | grep $1
}
mkcd () {
	mkdir -vp $1 && cd $1
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
sshls () {
  ssh-add -l
}
sshpth () {
  git config --get remote.origin.url
}
chshell () {
  sudo chsh -s $(which $1) $USER
}
# print path on each line function for zsh
printpaths () {
  echo $PATH | sed "s/:/\n/g" | sort | uniq -c
}
killp () {
  kill -9 $argv
}
# backup file
bak() {
  cp $1{,.bak}
}
# add all permissions
perm-all() {
  chmod -R 777 $1
}
# change owner to me
claim() {
  sudo chown -R $USER $1
}


# ts () {
#   tmux new -s primary
#   tmux new-window $1
# }

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

# rawurlencode "$*"

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

sshwn () {
  ssh-add -D
  ssh-add ~/.ssh/id_ed25519_github-wn-minimac
}
sshnv () {
  ssh-add -D
  ssh-add ~/.ssh/id_ed25519_github-neuvim-minimac
}

see () {
	local site=""
    if [[ -f "$(pwd)/$1" ]]; then
        site="$(pwd)/$1"
    elif [[ "$1" =~ "^http" ]]; then
        site="$1"
    else
        site="http://$1"
    fi
	open -a "Brave Browser" $site;
}

# Adds nvim switching
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kick="NVIM_APPNAME=KickStart nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
  items=("default" "KickStart" "LazyVim" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

zle -N nvims
bindkey '^A' 'nvims'
# Ends nvim switching

wsh () {
  echo "$(which $SHELL) shell is being used $USER"
}