#
# Zsh Config.
#

# Enable Powerlevel10k instant prompt. Should stay close to the top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source zsh setopts.
export PATH="/home/mateus/.config/composer/vendor/bin:$PATH"
[ -f "${ZDOTDIR}/zshopt" ] && source "${ZDOTDIR}/zshopt"

# Source zsh auto-complete options.
[ -f "${ZDOTDIR}/zshcmp" ] && source "${ZDOTDIR}/zshcmp"

# Source zsh enviroment variables.
[ -f "${ZDOTDIR}/zshenv" ] && source "${ZDOTDIR}/zshenv"

# Source zsh keybinds
[ -f "${ZDOTDIR}/zshkeys" ] && source "${ZDOTDIR}/zshkeys"

# Source zsh alias
[ -f "${ZDOTDIR}/zshalias" ] && source "${ZDOTDIR}/zshalias"

# Source zsh-autosuggestions plugin.
source "${ZDOTDIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Zsh-syntax-highlighting enabled highlighters.
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(main brackets)

# Source zsh Colors.
[ -f "${ZDOTDIR}/zshcolors" ] && source "${ZDOTDIR}/zshcolors"
ZLE_RPROMPT_INDENT=0

# History options.
HISTFILE=$ZDOTDIR/hist/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Auto complete.
autoload -Uz compinit
compinit

# Source powerlevel10k.
source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme

# Powerlevel10k configs, run `p10k configure` to edit.
[[ ! -f ~/.config//zsh//.p10k.zsh ]] || source ~/.config//zsh//.p10k.zsh

# Source syntax highlighting configs.
[ -f "${ZDOTDIR}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "${ZDOTDIR}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Created by `pipx` on 2025-02-18 17:34:53
export PATH="$PATH:/home/mateus/.local/bin"
