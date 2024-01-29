# ----------------------
# Aliases commands
# ----------------------
alias c 'clear'
alias .. 'cd ..'
alias ... 'cd ~'
# alias ls 'exa --icons --long --git -la'
alias o 'open .'
alias dev 'cd ~/Repo'
alias vsc 'code-insiders'
alias s 'ssh'
alias x 'exit'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# Changing "ls" to "exa"
alias ls='eza -al --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | egrep "^\."'

# switch between shells
# I do not recommend switching default SHELL from bash.
alias tobash="sudo chsh $USER -s /opt/homebrew/bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /opt/homebrew/bin/fish && echo 'Now log out.'"

# Repo for dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# ----------------------
# Utilities
# ----------------------
alias pubip "host myip.opendns.com resolver1.opendns.com | grep 'myip.opendns.com has' | awk '{print $4}'"
alias myip 'ipconfig'
alias diskusage 'df -h'
alias folderusage 'du -ch'
alias totalfolderusage 'du -sh'

function wtf -d "Print which and --version output for the given command"
    for arg in $argv
        echo $arg: (which $arg)
        echo $arg: (sh -c "$arg --version")
    end
end

function prpath -d "Print PATH on each line"
	for val in $PATH
		echo $val
	end
end

function killp
    kill -9 $argv
end

function rtmux
  bind r source-file ~/.tmux.conf \; display "Reloaded ~/.tmux.conf"
end

function mkcd
	mkdir $argv && cd $argv
end

function rmf
  rm -rf $argv
end

function sshg
  ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_$argv -C $argv
  ssh-add ~/.ssh/id_ed25519_$argv
end

# function sshl
#   for key in ~/.ssh/id_*; do ssh-keygen -l -f "${key}"; done | uniq
# end

function chshell
  sudo chsh -s $(which $argv) $USER
end

# ----------------------
# Git Aliases
# ----------------------
alias g 'git status'
alias gull 'git pull'
alias gush 'git push'
alias gl 'git log'
alias gdiff 'git diff'
alias glean 'git clean -df'
alias gd 'git checkout develop'
alias ghard 'git reset --hard'
alias glg 'git log --graph --oneline --decorate --all'
alias gss='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'

# ----------------------
# Git commands
# ----------------------
function gb
  git checkout -b $argv
end

function gch
  git checkout $argv
end

function gc
  git commit -am $argv
end

# ----------------------
# vim 'nvim'
# ----------------------
alias vi 'nvim'
alias vim 'nvim'
alias ea 'nvim ~/.config/fish/aliases.fish'
alias ef 'nvim ~/.config/fish/config.fish'
alias eg 'nvim ~/.gitconfig'
alias ev 'nvim ~/.vimrc'

# ----------------------
# tmux
# ----------------------
alias t 'tmux' # start tmux
alias ta 't a -t' # attach to session
alias tls 't ls' # list sessions
alias tn 't new -s primary' # new session named primary
alias tks 't kill-session -t' # kill session by name

# function grevert
#   branch $(git branch | grep \* | cut -d ' ' -f2)
#   git reset --hard origin/$branch
# end

# function gstream
#   branch $(git branch | grep \* | cut -d ' ' -f2)
#   git push --set-upstream origin $branch
# end

# Initialise Fish Greeting
# function fish_greeting
# 	archey
# end
# funcsave fish_greeting

## EXAMPLE OF COMMAIND FOR FIGLET TEXT CREATOR
alias bog 'toilet -f future Scott Mackey --filter metal'
alias ftank 'asciiquarium'