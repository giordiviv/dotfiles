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

# Vim motions in zsh
# Removed zsh-vi-mode was making the termianl slow.
# The natural zsh vi motions seem fine for the moment
#'^?' backward-delete-char -> allow to use backspace even after using vi mode 
bindkey -v '^?' backward-delete-char

# zsh-autocompletions: Autocompletion for zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlightig
# MUST BE SOURCED AT THE END OF THE .zshrc FILE
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

