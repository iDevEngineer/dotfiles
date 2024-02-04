# ----------------------
# Aliases commands
# ----------------------
alias c clear
alias .. 'cd ..'
alias ... 'cd ~'
alias o 'open .'
alias vsc code-insiders
alias s ssh
alias x exit

# Aliasing "ls" to use "lsd" pretty colors
alias ls='lsd -al --color=always --group-directories-first' # my preferred listing
alias la='lsd -a --color=always --group-directories-first' # all files and dirs
alias ll='lsd -l --color=always --group-directories-first' # long format
alias lt='lsd -aT --color=always --group-directories-first' # tree listing
alias l.='lsd -a | egrep "^\."'

# ----------------------
# Utilities
# ----------------------
alias diskusage 'df -h'
alias folderusage 'du -ch'
alias totalfolderusage 'du -sh'
alias flushdns "dscacheutil -flushcache"

# confirm before overwriting something
alias mv='mv -iv'
alias rm='rm -i'
alias ln='ln -iv'
alias cp='cp -riv'

# switch between shells
alias tobash="sudo chsh $USER -s /opt/homebrew/bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /opt/homebrew/bin/fish && echo 'Now log out.'"

# Repo for dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# ----------------------
# Networking
# ----------------------
alias processes='ps -f'
alias ports='netstat -tulnp | grep LISTEN'
alias router='ip route | grep default'
alias ip-private='ipconfig getifaddr en0'
alias ip-public='curl -4 ifconfig.co'
alias myip 'host myip.opendns.com resolver1.opendns.com | grep "myip.opendns.com has" | awk "{print $4}"'

# ----------------------
# Git Aliases
# ----------------------
alias gull 'git pull'
alias gush 'git push'
alias gl 'git log'
alias gdiff 'git diff'
alias glean 'git clean -df'
alias ghard 'git reset --hard'
alias glg 'git log --graph --oneline --decorate --all'
alias gss='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'

# ----------------------
# vim 'nvim'
# ----------------------
alias vi nvim
alias vim nvim
alias ea 'nvim ~/.config/fish/aliases.fish'
alias ef 'nvim ~/.config/fish/functions.fish'
alias ec 'nvim ~/.config/fish/config.fish'

# ----------------------
# tmux
# ----------------------
alias t tmux # start tmux
alias ta 't a -t' # attach to session
alias tls 't ls' # list sessions
alias tn 't new -s primary' # new session named primary
alias tks 't kill-session -t' # kill session by name

## EXAMPLE OF COMMAIND FOR FIGLET TEXT CREATOR
alias bog 'toilet -f future Scott Mackey --filter metal'
alias ftank asciiquarium
alias mx 'tmatrix --color=cyan'
