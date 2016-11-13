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
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".emacs.d"        # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

source ~/.bash_profile

