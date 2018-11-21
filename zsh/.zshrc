source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/dotfiles/zsh/

## Command history configuration
if [ -z $HISTFILE ]; then
    HISTFILE=$HOME/.zsh_history
fi
HISTSIZE=10000
SAVEHIST=10000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data


# Example aliases
alias www='~/www/'
#alias ls='ls -p'
#alias la='ls -a'
#alias ll='ls -l'
alias g='git'
alias grep='grep --color=always'
alias ta='tmux attach'
alias tmuxs='tmux start-server;tmux source-file ~/.tmux.conf'
alias plx='sudo networksetup -setwebproxystate Wi-Fi'
alias t='tar cf'
alias gdt='~/bin/git-delta'
alias ce='open -a CotEditor'
alias flets='cd ~/www/flets-w'
alias dc='docker-compose'
alias dm='docker-machine'
alias hant='~/office_product/hant-project'




# You may need to manually set your language environment
export LANG=ja_JP.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi


## cd -[tab] でpushd
setopt autopushd

## history 保管
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

## zmv
autoload -Uz zmv


# ローカルファイル読み込み
[ -f $ZSH/.zshrc.local ] && source $ZSH/.zshrc.local

# ローカルファイル読み込み
[ -f $ZSH/tmuxinator.zsh ] && source $ZSH/tmuxinator.zsh

# docker-compose用補完機能
fpath=(~/dotfile/zsh/completion $fpath)
autoload -Uz compinit && compinit -i


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


PATH="/Users/repros/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/repros/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/repros/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/repros/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/repros/perl5"; export PERL_MM_OPT;


# recent directories stack START
autoload -Uz compinit && compinit

zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

typeset -ga chpwd_functions

if is-at-least 4.3.11; then
  autoload -U chpwd_recent_dirs cdr
  chpwd_functions+=chpwd_recent_dirs
  zstyle ":chpwd:*" recent-dirs-max 500
  zstyle ":chpwd:*" recent-dirs-default true
  zstyle ":completion:*" recent-dirs-insert always
fi
# recent directories stack END

zstyle ':prezto:module:prompt' pwd-length 'long'
