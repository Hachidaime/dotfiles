function lst --wraps='ls --sort=date' --description 'alias lst=ls --sort=date'
  ls --sort=date $argv; 
end
