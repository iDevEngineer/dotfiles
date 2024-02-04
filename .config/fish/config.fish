set fish_greeting "" # set -g fish_greeting
set -gx EDITOR "nvim"

set PATH /usr/local/bin /usr/local/sbin /opt/homebrew/bin /opt/homebrew/sbin /usr/local/opt/python/libexec/bin $PATH
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

. ~/.config/fish/functions.fish
. ~/.config/fish/aliases.fish

fnm env --use-on-cd | source

# Start starship #
starship init fish | source

# Start Zoxide #
zoxide init fish | source
# bun
