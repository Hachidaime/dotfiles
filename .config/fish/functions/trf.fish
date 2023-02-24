function trf --wraps='trans -show-languages n -show-prompt-message n -show-alternatives n -no-ansi -no-warn' --description 'alias trf=trans -show-languages n -show-prompt-message n -show-alternatives n'
  trans -show-languages n -show-prompt-message n -show-alternatives n -no-ansi -no-warn $argv; 
end
