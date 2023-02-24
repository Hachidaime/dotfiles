function yts --wraps='yt-dlp --write-auto-sub --convert-subs=srt
--skip-download' --description 'yt-dlp download subtitle only'
  yt-dlp --write-auto-sub --convert-subs=srt --skip-download $argv; 
end
