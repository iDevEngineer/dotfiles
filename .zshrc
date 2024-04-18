eval $(/opt/homebrew/bin/brew shellenv)

# Use my custom aliases file
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
[ -f "$HOME/.zsh/aliases.zsh" ] && source "$HOME/.zsh/aliases.zsh"
[ -f "$HOME/.zsh/functions.zsh" ] && source "$HOME/.zsh/functions.zsh"
[ -f "$HOME/.env" ] && source "$HOME/.env"

# Start ZSH automatically
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
    eval $(ssh-agent)
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
    ssh-add ~/.ssh/$PRIVATE_KEY
fi

if [ -f ~/.ssh/ssh_auth_sock ]; then
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
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

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

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
