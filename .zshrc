eval $(/opt/homebrew/bin/brew shellenv)

# Use my custom aliases file
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
[ -f "$HOME/.zsh/aliases.zsh" ] && source "$HOME/.zsh/aliases.zsh"
[ -f "$HOME/.zsh/functions.zsh" ] && source "$HOME/.zsh/functions.zsh"
[ -f "$HOME/.env" ] && source "$HOME/.env"

# Start TMUX automatically
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   tmux a -t default || exec tmux new -s default && exit;
# fi

# Start ZSH automatically
if [[ -z "$SSH_AUTH_SOCK" ]]; then
  eval "$(ssh-agent -s)"
fi

# Example install plugins
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
# Example theme
# plug "zap-zsh/zap-prompt"
# Example install completion
plug "esc/conda-zsh-completion"
plug "wintermi/zsh-fnm"
plug "zap-zsh/vim"
plug "wintermi/zsh-brew"

# Start Neofetch
# neofetch
# bog

# Start Zoxide #
eval "$(zoxide init zsh)"

# fnm required
eval "$(fnm env --use-on-cd)"

# Start starship
eval "$(starship init zsh)"

# Prevent duplication in .zshrc (Only ZSH)
typeset -U PATH

# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
