function md2pdf --wraps='pandoc --pdf-engine=xelatex --highlight-style kate --table-of-contents --number-sections -s' --description 'alias md2pdf=pandoc --pdf-engine=xelatex --highlight-style kate --table-of-contents --number-sections -s'
  pandoc --pdf-engine=xelatex --highlight-style kate --table-of-contents --number-sections -s $argv; 
end
