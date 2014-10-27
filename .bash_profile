
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# fbterm
#if [ "$TERM" = "linux" ]; then
#    alias fbterm='fcitx-fbterm-helper -l' # fcitx-frontend-fbterm
#    fbterm
#fi

[[ $(tty) == \/dev\/tty[0-6]* ]] && fcitx-fbterm-helper -l

#http_proxy=127.0.0.1:8087
#export http_proxy

# emacs daemon
emacs --daemon &