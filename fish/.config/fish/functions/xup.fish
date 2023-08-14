function xup --wraps='xrdb -load ~/.Xresources && echo "reloaded .Xresources"' --description 'alias xup xrdb -load ~/.Xresources && echo "reloaded .Xresources"'
  xrdb -load ~/.Xresources && echo "reloaded .Xresources" $argv; 
end
