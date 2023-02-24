function trb --wraps='trans -show-languages n -show-prompt-message n
-show-alternatives n -no-ansi -no-warn -b' --description 'alias trf=trans
-show-languages n -show-prompt-message n -show-alternatives n -b'
  trans -show-languages n -show-prompt-message n -show-alternatives n -no-ansi -no-warn -b $argv; 
end
