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

load_dokku_secrets() {
   veracrypt --text --protect-hidden=no --keyfiles="" --pim=0 --mount ~/dokkumento-info /Volumes/dokkumento
}


gpg_encrypt() {

    if [ "$#" -ne 3 ]; then
        echo "---------------------------------------------------------"
        echo "Usage: gpg_encrypt input-file output-file recipient-email"
        echo "---------------------------------------------------------"
    else
        gpg --output $2 --encrypt --recipient $3 $1
    fi
}

gpg_decrypt() {

   if [ "$#" -ne 2 ]; then
        echo "---------------------------------------------------------"
        echo "Usage: gpg_decrypt input-file output-file"
        echo "---------------------------------------------------------"
   else
       gpg --output $2 --decrypt $1
   fi
}

gpg_export_key() {

   if [ "$#" -ne 2 ]; then
        echo "-------------------------------------------------------------------------------"
        echo "Usage: gpg_export_key  key-name-email output-file"
        echo ""
        echo "  where [key-name-email] is the email associated with the key to be exported."
        echo "-------------------------------------------------------------------------------"
    else
        gpg --armor --output $2 --export $1
    fi
}


gpg_import_key() {

   if [ "$#" -ne 1 ]; then
        echo "-------------------------------------------------------------------------------"
        echo "Usage: gpg_import_key [file-with-key-to-import]"
        echo "-------------------------------------------------------------------------------"
   else
       gpg --import %1
   fi
}
