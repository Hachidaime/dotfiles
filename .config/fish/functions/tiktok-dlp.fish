function tiktok-dlp --description 'alias tiktok-dlp=for f in ; yt-dlp -vU $f;
end'
  for f in $argv; yt-dlp -o "%(id)s.%(ext)s" $f; end
end
