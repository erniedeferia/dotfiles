########## Variables


#
# Modify this run only if the following directories DON'T exist:
#
# ~/.emacs-live.el
# ~/.live-packs
#
# Source: http://overtone.github.io/emacs-live/
if [[ ! -d ~/.emacs-live.el && ! -d ~/.live-packs ]]; then
  bash <(curl -fksSL https://raw.github.com/overtone/emacs-live/master/installer/install-emacs-live.sh)
fi

dir=~/dotfiles                    # dotfiles directory

source ~/.bash_profile

