# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[00m\]\A\[\033[04;35m\]\u@\h\[\033[00m\]:\[\033[01;32m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\[\033[04;35m\]\A\[\033[00m\]\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then 
    . /etc/bash_completion
fi

PATH=$PATH:$HOME/.rvm/bin: # Add RVM to PATH for scripting

JAVA_HOME=/usr/lib/jvm/oracle-java
CLASSPATH=.:$JAVA_HOME/lib:$CLASSPATH

ANDROID_SRC=/home/android/android-src
ANDROID_HOME=/home/android/android-sdk-linux
ANDROID_PLATFORM_TOOLS=$ANDROID_HOME/platform-tools
ANDROID_TOOLS=$ANDROID_HOME/tools
NDK_ROOT=/opt/android-ndk-linux
GOROOT=/usr/local/go 

ANDROID_STUDIO_HOME=/opt/android-studio

# android src using ccache
export USE_CCACHE=1
export CCACHE_DIR=~/.ccache

M2_HOME=/usr/local/apache/maven-2.2.1 # maven2
MAVEN_HOME=/usr/local/apache/maven-3.1.1
GRADLE_HOME=/usr/local/gradle

JAVA_OPTS="-Xmx1024m -Xms1024m -XX:MaxPermSize=2048m"

#GRADLE_OPTS="-Xmx3072m -Xms2048m -XX:MaxPermSize=2048m -XX:+CMSClassUnloadingEnabled -XX:+HeapDumpOnOutOfMemoryError -XX:-UseGCOverheadLimit"
GRADLE_OPTS="-Xmx1024m -Xms1024m -XX:MaxPermSize=2048m -XX:+CMSClassUnloadingEnabled -XX:-UseGCOverheadLimit"

SONAR_BIN_HOME=/var/www/sonarqube/bin/linux-x86-64/
SONAR_RUNNER_HOME=/usr/local/sonar-runner

#export NDK_TOOLCHAIN=/usr/local/android/android-ndk-r8b/ndk-toolchain-p9/
PATH=$PATH:$ANDROID_PLATFORM_TOOLS:$ANDROID_TOOLS:$ANDROID_STUDIO_HOME/bin:$NDK_ROOT:$COCOS2DX_HOME:/opt/bin:$GOROOT/bin:$GRADLE_HOME/bin:$MAVEN_HOME/bin:$SONAR_RUNNER_HOME/bin:$SONAR_BIN_HOME

export JAVA_HOME ANDROID_HOME ANDROID_SRC M2_HOME NDK_ROOT

export LC_CTYPE="zh_CN.UTF-8"

# rvm is not a function, .bash_profile is not function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# export GTK2_RC_FILES=/usr/share/themes/dorian-theme/gtk-2.0/gtkrc

ANDROID_SECURITY=/home/android/android-security
APKTOOL_HOME=$ANDROID_SECURITY/apktool1.5.2
DEX2JAR_HOME=$ANDROID_SECURITY/dex2jar-0.0.9.13
export PATH=$PATH:$ANDROID_SECURITY:$APKTOOL_HOME:$DEX2JAR_HOME:~/VirtualBoxVMs/genymotion

# SET GNUstep
GNUSTEP_ROOT=/usr/share/GNUstep
export GNUSTEP_ROOT
source $GNUSTEP_ROOT/Makefiles/GNUstep.sh
export GNUSTEP_MAKEFILES=$GNUSTEP_ROOT/Makefiles/

export LD_LIBRARY_PATH=/usr/lib64/gtk-2.0/2.10.0/engines:

# tip
echo "Did you know that:"; whatis $(ls /bin | shuf -n 1)

#export TERM=fbterm
export TERM=xterm-256color

# tmux
tmux_init()
{
  tmux new-session -s "thom" -d -n "local"
  #tmux new-window -n "other"
  tmux attach-session -d
}

#if which tmux 2>&1 > /dev/null; then
#  test -z "$TMUX" && (tmux attach || tmux_init)
#fi

export EDITOR='vi'
source ~/.bin/tmuxinator.bash
