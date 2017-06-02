# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="false"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(colored-man colorize command-not-found cp history history-substring-search
ant bower cabal cake coffee cpanm docker gas git github gitignore gnu-utils go golang
heroku jira knife knife_ssh lein mercurial mix mvn nanoc postgres perl redis-cli rebar
repo sbt scala sfffe svn svn-fast-info vagrant node npm nvm composer phing bundler
capistrano gem jruby pow rake rbenv ruby rvm thor zeus fabric pip python virtualenv
 debian systemd)

source $ZSH/oh-my-zsh.sh

alias ll='ls -alh'

alias ghc='stack exec -- ghc'
alias ghci='stack exec -- ghci'

# User configuration

export PATH="/opt/packer:/opt/vagrant/bin:/home/sitano/perl5/bin:/opt/packer:/opt/vagrant/bin:/home/sitano/perl5/bin:/home/sitano/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/sitano/Projects/go/bin:/home/sitano/Projects/gocode/bin:/home/sitano/scala/bin:/home/sitano/.cask/bin:/home/sitano/.ec2/bin:/home/sitano/.cargo/bin:/home/sitano/.local/bin"
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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
export SSH_KEY_PATH="$HOME/.ssh/john.koepi.rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# autoload bashcompinit
# bashcompinit
# source /etc/bash_completion

# Less Scheme
export LESS_TERMCAP_mb=$'\033[01;31m'
export LESS_TERMCAP_md=$'\033[01;38;5;74m'
export LESS_TERMCAP_me=$'\033[0m'
export LESS_TERMCAP_se=$'\033[0m'
export LESS_TERMCAP_so=$'\033[38;5;246m'
export LESS_TERMCAP_ue=$'\033[0m'
export LESS_TERMCAP_us=$'\033[04;38;5;146m'
export PERL_LOCAL_LIB_ROOT="/home/sitano/perl5"
export PERL_MB_OPT="--install_base /home/sitano/perl5"
export PERL_MM_OPT="INSTALL_BASE=/home/sitano/perl5"
export PERL5LIB="/home/sitano/perl5/lib/perl5/x86_64-linux-gnu-thread-multi:/home/sitano/perl5/lib/perl5"
export PATH="/home/sitano/perl5/bin:$PATH"

export ALTERNATE_EDITOR=emacs EDITOR=emacs VISUAL=emacs

export PATH="/opt/vagrant/bin:$PATH"
export PATH="/opt/packer:$PATH"

# Haskell / Stack
export PATH="$HOME/.local/bin:$PATH"

# User specific environment and startup programs
export GOROOT=$HOME/Projects/go
export GOPATH=$HOME/Projects/gocode
export GOOS=linux
export GOARCH=amd64
export PATH=$PATH:$HOME/bin:$GOROOT/bin:$GOPATH/bin:$HOME/scala/bin
export PATH=$PATH:$HOME/.cask/bin

# Node.JD
export PATH=$PATH:$HOME/Projects/node-v7.9.0-linux-x64/bin

#EC2 Configuration
export EC2_HOME=~/.ec2
export EC2_URL=https://ec2.eu-west-1.amazonaws.com
export EC2_CERT=
export EC2_PRIVATE_KEY=
export PATH=$PATH:$EC2_HOME/bin

#Scala
export SCALA_HOME=~/scala

# Debian Packages
export DEBFULLNAME="Ivan Prisyazhniy"
export DEBEMAIL="john.koepi@gmail.com"
export GPG="john.koepi@gmail.com"

# WeChall
export WECHALLUSER="sitano"
export WECHALLTOKEN=""

# AWS completion
source '/home/sitano/.local/bin/aws_zsh_completer.sh'

# AWS Azure
source '/usr/local/az/az.completion'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
