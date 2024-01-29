# export PYTHON_HOME="/Users/aigen/Library/Python/3.8/bin"
export HOMEBREW="/opt/homebrew/bin:/opt/homebrew/sbin"
export PNPM_HOME="$HOME/Library/pnpm"
export MY_HOME="$HOME/.local/bin"
export EDITOR="nvim"
export ANSIBLE_INVENTORY="$HOME/.ansible/de-inventory"
export OPENAI_API_KEY="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"

# Always append or prepend new paths to $PATH variable in your config file. Example: /etc/paths adds MacOS default paths
export PATH=$HOMEBREW:$PNPM_HOME:$MY_HOME:$PATH

# Use my custom aliases file
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
[ -f "$HOME/.zsh/aliases.zsh" ] && source "$HOME/.zsh/aliases.zsh"
[ -f "$HOME/.zsh/functions.zsh" ] && source "$HOME/.zsh/functions.zsh"

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
plug "zap-zsh/exa"
plug "wintermi/zsh-brew"

# Start Neofetch
# neofetch
# bog

# Start Zoxide #
eval "$(zoxide init zsh)"

# fnm required
# eval "$(fnm env --use-on-cd)"

# Start starship
eval "$(starship init zsh)"

# Prevent duplication in .zshrc (Only ZSH)
typeset -U PATH