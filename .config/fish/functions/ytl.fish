function ytl --wraps='yt-dlp -F ' --description 'yt-dlp list available format'
  yt-dlp -F  $argv; 
end
