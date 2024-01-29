set PATH /usr/local/bin /usr/local/sbin /opt/homebrew/bin /opt/homebrew/sbin /usr/local/opt/python/libexec/bin $PATH
set -g fish_greeting

. ~/.config/fish/aliases.fish

if test -z "$TMUX"
	neofetch
end

# Start tmux session automatically
# if command -v tmux &> /dev/null && [ -z "$TMUX" ]
#     tmux attach -t main || tmux new -s main
# end

fnm env --use-on-cd | source

# Start starship #
starship init fish | source

# Start Zoxide #
zoxide init fish | source
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
