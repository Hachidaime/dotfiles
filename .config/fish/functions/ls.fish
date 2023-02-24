function ls --wraps='exa --icons -lh' --wraps='exa --icons -lh --time-style=long-iso' --description 'alias ls=exa --icons -lh --time-style=long-iso'
  exa --icons -lhg --time-style=long-iso $argv; 
end
