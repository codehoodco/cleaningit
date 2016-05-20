# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
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

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export PS1='\w ~ '
export MONGODB_HOME=/opt/mongodb 
export IDEA_HOME=/opt/idea
export M2_HOME=/opt/apache-maven
export PATH=$PATH:$MONGODB_HOME/bin:$IDEA_HOME/bin:$M2_HOME/bin:/bin

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vb='vim ~/.bashrc'
alias eb='source ~/.bashrc'
alias gp='git push'
alias gpl='git pull'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias go='git checkout'
alias gba="git branch -a"
alias gitc="git commit -am"
alias grap="grails clean; grails run-app"
alias gap="grails run-app"
alias showSshConfig="cat ~/.ssh/config"
alias remtpr="ssh-keygen -R"
alias kla="killall -i"
alias 223="sdk use grails 2.2.3"
alias 244="sdk use grails 2.4.4"
alias 251="sdk use grails 2.5.1"
alias pg="ps -eaf | grep -i"
alias sserve="cd ~/Code/sserve"
alias omniog="cd ~/Code/omniog"
alias tbip="cd ~/Code/tbip"
alias M="cd ~/Music"
alias D="cd ~/Downloads"
alias C="cd ~/Code"
alias startTomcat="sudo service tomcat8 start"
alias stopTomcat="sudo service tomcat8 stop"
alias startIdea="idea.sh &"
alias startMongo="mongod &"
alias startRedis="redis-server &"
alias startMongo17="mongod --config /etc/config/mongodb/27017.conf &"
alias startMongo18="mongod --config /etc/config/mongodb/27018.conf &"
alias startMongo19="mongod --config /etc/config/mongodb/27019.conf &"
alias showAllRecentCommits="git for-each-ref --sort=-committerdate refs/remotes/ --format='%(refname) %(committerdate) %(authorname)'"

function looper {
for i in `seq 1 10`; do
mplayer $1
done
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

LS_COLORS=$LS_COLORS:'di=1;31;40';
export LS_COLORS
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/abhishek/.sdkman"
[[ -s "/home/abhishek/.sdkman/bin/sdkman-init.sh" ]] && source "/home/abhishek/.sdkman/bin/sdkman-init.sh"
