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

# Show users SHELL
function wsh
    echo (which $SHELL) shell is being used $USER
end
# Change shell
function chshell
    sudo chsh -s (which $argv) $USER
end

# ----------------------
# SSH functions
# ----------------------
# Generate SSH key and add to ssh-agent
function sshg
    ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_$argv -C $argv
    ssh-add ~/.ssh/id_ed25519_$argv
end
# List all SSH keys
function ssha
    for key in ~/.ssh/id_*
        ssh-keygen -l -f $key
    end | uniq
end
# Show SSH keys added to ssh-agent
function sshl
    ssh-add -l
end

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
