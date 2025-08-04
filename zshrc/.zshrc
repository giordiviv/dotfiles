eval "$(starship init zsh)"
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"


HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000

setopt inc_append_history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fastfetch

# Plug ins:

# zsh-vi-mode: Vim motions in zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# zsh-autocompletions: Autocompletion for zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlightig
# MUST BE SOURCED AT THE END OF THE .zshrc FILE
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

