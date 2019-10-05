# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
    
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion""""]""""]""
alias cl='clear'
alias jc='javac'
alias c='cd ..'
alias e='exit'
alias c2='cd ../..'
alias c3='cd ../../..'
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias ga='git add .'
alias gc='git commit -m'
alias gsh='git push origin'
alias gb='git branch'
alias gl='git log'
alias gll='git pull origin'
alias gcd='git clone --depth 1'
alias gcl='git clone'
alias grb='git rebase -i'
alias gta='git tag -a'
alias gtg='git tag'
alias gp='git remote prune origin'
alias gco='git checkout -- .'
alias dev='npm run dev'
alias pi='pip install -i https://pypi.tuna.tsinghua.edu.cn/simple'
export PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH
export PATH=~/Documents/mongodb/bin:$PATH
export PATH=~/Documents/openssl-1-1-1/bin:$PATH
export PATH=~/Documents/seleniumDriver:$PATH
export PATH=~/Documents/flutter/bin:$PATH
export C_INCLUDE_PATH=/Users/linweiye/Documents/openssl-1-1-1/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=/Users/linweiye/Documents/openssl-1-1-1/include:$CPLUS_INCLUDE_PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_191.jdk/Contents/Home
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
export HISTSIZE=10000
export HISEFILESIZE=10000
# export SSLKEYLOGFILE=~/Documents/me/tls/sslkeylog.log
eval "$(pyenv init -)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*