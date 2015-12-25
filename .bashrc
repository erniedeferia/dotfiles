alias ll='ls -la'
alias emacs='/usr/local/Cellar/emacs/24.5/Emacs.app/Contents/MacOS/Emacs -nw'
alias e='/usr/local/Cellar/emacs/24.5/Emacs.app/Contents/MacOS/Emacs -nw'
alias documents='cd ~/Documents'
alias downloads='cd ~/Downloads'
PATH=~/dotfiles:$PATH
PATH=/Applications/VeraCrypt.app/Contents/MacOS:$PATH

tcmount() {
    veracrypt --text --truecrypt --protect-hidden=no --keyfiles="" --mount ~/Documents/protected/data /Volumes/Protected
}

tcdismount() {
    veracrypt -d
}
