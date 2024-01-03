# ##########################################################################
# possumvibes dotfiles
# https://github.com/possumvibes/dotfiles
# update.fish - a single function for cross-distro Default Package Updates
# ##########################################################################

if command -q xbps-install
  function uu -d 'xbps-install repository sync and package update'
    sudo xbps-install -Su && sudo makewhatis /usr/share/man
  end
  exit
end

if command -q dnf
    function uu -d 'dnf package update and upgrade'
        sudo dnf upgrade --refresh -y $argv;
    end
    exit
end

if command -q apt
    function uu -d 'apt and apt-get package update and upgrade'
        sudo apt update && sudo apt upgrade -y
        sudo apt-get update && sudo apt-get upgrade -y
    end
    exit
end


