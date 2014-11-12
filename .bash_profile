
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

# to tmux
. ~/.bashrc

#if [ `emacs --version | grep 'Emacs 23*' | grep 'Emacs 24*' | wc -l` = 1 ]
#then
#   if [ `ps ux | grep emacs | grep \ --daemon | wc -l` = 0 ]
#   then
#       `emacs --daemon` # tmux multi window no use
#   else
#       echo 'Emacs daemon is already running.'
#   fi
#else
#   echo 'Can not run the daemon in this version of Emacs'
#fi
