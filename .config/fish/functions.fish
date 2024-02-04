# Initialise Fish Greeting
# function fish_greeting
# 	archey
# end
# funcsave fish_greeting

function printpaths -d "Print PATH on each line"
    for val in $PATH
        echo $val
    end
end

function mkcd
    mkdir $argv && cd $argv
end

function rmf
    rm -rf $argv
end

function bak
    cp $argv $argv.bak
end

function getpid
    ps -ax | grep $argv | grep -v grep | awk '{print $1}'
end

function killp
    kill -9 $argv
end

function chmodall
    chmod -R 777 $argv
end

function claim
    chown -R $USER $argv
end

function rtmux
    bind r source-file ~/.tmux.conf \; display "Reloaded ~/.tmux.conf"
end

# ----------------------
# SSH functions
# ----------------------
# Generate SSH key and add to ssh-agent
function sshg
    ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_$argv -C $argv
    ssh-add ~/.ssh/id_ed25519_$argv
end
# List SSH keys
function sshl
    for key in ~/.ssh/id_*
        ssh-keygen -l -f $key
    end | uniq
end

# Show users SHELL
function wsh
    echo (which $SHELL) shell is being used $USER
end
# Change shell
function chshell
    sudo chsh -s (which $argv) $USER
end

# ----------------------
# Search functions
# ----------------------
# alias "?"=duck
# alias "??"=google
# alias "???"=bing

# set lynxpath (which lynx)

# if test -e "$HOME/.config/lynx/lynx.cfg"
#     set -x LYNX_CFG "$HOME/.config/lynx/lynx.cfg"
# end
# if test -e "$HOME/.config/lynx/lynx.lss"
#     set -x LYNX_LSS "$HOME/.config/lynx/lynx.lss"
# end
# if not test -x "$lynxpath"
#     echo "lynx is not installed"
# end

# function rawurlencode
#     set -l string $argv[1]
#     set -l strlen (string length $string)
#     set -l encoded ""
#     set -l pos c o

#     for pos in (seq 1 $strlen)
#         set -l c (string sub -s $pos -l 1 $string)
#         switch $c
#             case '-_.~a-zA-Z0-9'
#                 set -l o $c
#             case '*'
#                 printf -v o '%%%02x' (printf '%d' "'$c")
#         end
#         set -l encoded $encoded$o
#     end
#     echo $encoded
#     set -g REPLY $encoded
# end

# function duck
#     set -l url (rawurlencode "$argv")
#     lynx "https://lite.duckduckgo.com/lite/?q=$url"
# end
# function google
#     set -l url (rawurlencode "$argv")
#     lynx "https://www.google.com/search?q=$url"
# end
# function bing
#     set -l url (rawurlencode "$argv")
#     lynx "https://www.bing.com/search?q=$url"
# end


# ----------------------
# Git commands
# ----------------------
function grevert
    set branch (git branch | grep \* | cut -d ' ' -f2)
    git reset --hard origin/$branch
end

function gstream
    set branch (git branch | grep \* | cut -d ' ' -f2)
    git push --set-upstream origin $branch
end

function remotepath
    git config --get remote.origin.url
end