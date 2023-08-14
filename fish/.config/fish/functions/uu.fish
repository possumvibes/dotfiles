function uu --wraps='sudo dnf upgrade --refresh -y' --description 'alias uu sudo dnf upgrade --refresh -y'
  sudo dnf upgrade --refresh -y $argv; 
end
