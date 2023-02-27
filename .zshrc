# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/cold/.zshrc'

fpath=(/home/cold/.local/share/zsh/site-functions $fpath)
autoload -Uz compinit
compinit
# End of lines added by compinstall

LFCD="/home/cold/.bashrc.d/lfcd"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

bindkey -s '^o' 'lfcd\n'  # zsh

# Color Script
colorscript -e 13

# Starship
eval "$(starship init zsh)"
