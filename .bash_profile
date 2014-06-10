
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# fbterm
[[ $(tty) == \/dev\/tty[0-9]* ]] && fcitx-fbterm-helper -l
#[[ $(tty) == \/dev\/tty[0-9]* ]] && env DISPLAY=:0 fbterm -i fcitx-fbterm 

#if [ "$TERM" = "linux" ]; then
#    #alias fbterm='LANG=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8 fbterm -i fbterm_ucimf'
#    export DISPLAY=":0"
#    alias fbterm='LANG=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8 fbterm -i fcitx-fbterm'
#    fbterm
#fi
