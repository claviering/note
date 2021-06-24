# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/linweiye/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  z
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
alias uat='npm run uat'
alias 10dev='nvm use 10 && dev'
alias 10uat='nvm use 10 && uat'
alias pi='pip install -i https://pypi.tuna.tsinghua.edu.cn/simple'
alias f='fuck -y'
alias gbr="git branch | grep -v "master" | xargs git branch -D"
alias textshot="python /Users/linweiye/Documents/textshot/textshot.py"
alias togif="python3 /Users/linweiye/Documents/pythonroom/convert-to-gif/main.py"
alias gsf="git submodule foreach git pull"
alias note="code note.code-workspace"
alias cli="/Applications/wechatwebdevtools.app/Contents/MacOS/cli"
alias cli-upload="/Users/linweiye/Documents/shell-script/wechatDevToolsUpload.sh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/Documents/mongodb-macos-x86_64-4.4.4/bin"
export PATH="$PATH:$HOME/Documents/openssl-1-1-1/bin"
export PATH="$PATH:$HOME/Documents/seleniumDriver"
export PATH="$PATH:$HOME/Documents/flutter/bin"
export PATH="$PATH:$HOME/Documents/apache-maven-3.6.3/bin"
export PATH="$PATH:$HOME/Applications/wechatwebdevtools.app/Contents/MacOS"
export PUB_HOSTED_URL=https://pub.flutter-io.cn # flutter中国镜像
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn # flutter中国镜像
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home"
export PATH="$PATH:$JAVA_HOME/bin"
export CLASSPATH="$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:"
export HISTSIZE=10000
export HISEFILESIZE=10000
export LC_ALL=$LANG
export HOMEBREW_NO_AUTO_UPDATE=1
export CPATH=":/usr/local/include"
export CPLUS_INCLUDE_PATH=":/usr/local/include"
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
export PATH="$PATH:$HOME/Documents/protoc-3.13.0-osx-x86_64/bin"

# eval "$(pyenv init -)"

# eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
# eval $(thefuck --alias FUCK)