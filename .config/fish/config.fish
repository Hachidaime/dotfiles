if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Clear Greeting
set -U fish_greeting ""

set -gx EDITOR nvim

# Key binding
bind \co 'set old_tty (stty -g); stty sane; lfcd; stty $old_tty; commandline -f repaint'

# Color Script
colorscript -e 13

# Starship
starship init fish | source

