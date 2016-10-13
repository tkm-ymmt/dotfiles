# Path to your oh-my-zsh installation.
export ZSH=$HOME/dotfiles/zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bureau"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias www='~/www/'
#alias ls='ls -p'
#alias la='ls -a'
#alias ll='ls -l'
alias g='git'
alias n='node'
#alias ws='/Applications/WebStorm\ 2.app/Contents/MacOS/webide'
alias ap='sudo /usr/local/Cellar/httpd24/2.4.12/bin/apachectl'
#alias zrc='~/dotfiles/zsh/.zshrc'
alias grep='grep --color=always'
#alias ap='sudo apachectl'
#alias ap='sudo /usr/local/Cellar/httpd/2.2.27/sbin/apachectl'
alias ta='tmux attach'
alias plx='sudo networksetup -setwebproxystate Wi-Fi'
alias t='tar cf'
alias gdt='~/bin/git-delta'
alias ce='open -a CotEditor'
alias flets='cd ~/www/flets-w'
alias dc='docker-compose'
alias dm='docker-machine'
alias hant='~/office_product/hant-project'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git tmux zsh_reload)

source $ZSH/oh-my-zsh.sh

# User configuration

#export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/opt/local/bin:PATH:"
#export PATH="r/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.nodebrew/current/bin:$PATH"
#export NODEBREW_ROOT=~/.nodebrew
#export RBENV_ROOT=/usr/local/var/rbenv

## rbenv の設定
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# export MANPATH="/usr/local/man:$MANPATH"



# You may need to manually set your language environment
export LANG=ja_JP.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"`
# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

## cd -[tab] でpushd
setopt autopushd

## history 保管
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

## zmv
autoload -Uz zmv


#source ~/.bin/tmuxinator.zsh

# ローカルファイル読み込み
[ -f $ZSH/.zshrc.local ] && source $ZSH/.zshrc.local

# ローカルファイル読み込み
[ -f $ZSH/tmuxinator.zsh ] && source $ZSH/tmuxinator.zsh

# docker-compose用補完機能
fpath=(~/dotfile/zsh/completion $fpath)
autoload -Uz compinit && compinit -i

