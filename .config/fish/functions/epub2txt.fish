function epub2txt --wraps='pandoc -f epub -t plain -o' --description 'alias epub2txt=pandoc -f epub -t plain -o'
  pandoc -f epub -t plain -o $argv; 
end
