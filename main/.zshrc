export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh
# source $HOME/bin/_fzf-funcs
source $HOME/.lf_icons
# source /usr/local/share/chruby/chruby.sh
# source /usr/local/share/chruby/auto.sh
# chruby ruby-2.7.0-preview1

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

# export fpath=($HOME/.autoload $fpath)

export FZF_BASE=/home/vincent/.fzf
set rtp+=~/.fzf

HISTSIZE=1000
SAVEHIST=1000

autoload zmv
setopt kshglob
setopt auto_cd
setopt prompt_subst # Make sure prompt is able to be generated properly.
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

SSH_ENV=$HOME/.ssh/environment

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
    echo succeeded
    chmod 600 ${SSH_ENV}
    . ${SSH_ENV} > /dev/null
    /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# Make stderr bold red
exec 2>>( while read X; do print "\e[1;31m${X}\e[0m" > /dev/tty; done & )

zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3 # defer until other plugins like oh-my-zsh is loaded
BULLETTRAIN_PROMPT_ORDER=(
  dir
  git
)
BULLETTRAIN_PROMPT_SEPARATE_LINE=false
BULLETTRAIN_PROMPT_CHAR=""
BULLETTRAIN_GIT_BG=white
BULLETTRAIN_GIT_EXTENDED=false

export KEYTIMEOUT=10
bindkey -M viins 'jk' vi-cmd-mode

zplug "plugins/bundler", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/ruby", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/ubuntu", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh, defer:3
zplug "plugins/git", from:oh-my-zsh, defer:3
zplug "plugins/per-directory-history", from:oh-my-zsh
zplug "timothyrowan/betterbrew-zsh-plugin"
zplug "MichaelAquilina/zsh-you-should-use"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "hlissner/zsh-autopair", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load


export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_COMPLETION_TRIGGER=''

zsa() {
   echo "\n$1\n" >> ~/.zshrc
   source ~/.zshrc
}

zombies() {
    ps -eo pid=,stat= | awk '$2~/^Z/ { print $1 }' | paste -sd,
}

ign() { curl -sLw n https://www.gitignore.io/api/$@ ;}


fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER=" fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

magic-enter () {
    if [[ -z $BUFFER ]]
    then
            zle clear-screen
    else
	zle accept-line
fi
}
zle -N magic-enter
bindkey '^J' magic-enter

bindkey '^[f' forward-word
bindkey '^[b' backward-word
bindkey '^F' forward-char
bindkey '^B' backward-char
bindkey '^K' kill-line
bindkey '^U' kill-whole-line

bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

bindkey -s '^O' ' lf\n'

alias -g HE='--help | less'
alias -g L='| less'
alias -g NE='2 > /dev/null'
alias -g NUL='> /dev/null 2>&1'
alias -g Y='| tmux loadb -'
alias -s {yml,yaml,rb}=nvim
alias P="tmux saveb -"
alias e=$EDITOR
alias g=hub
alias gc='git commit -m'
alias gi="sudo gem install"
alias inf=pinfo
alias info="info --vi-keys"
alias ls='ls --color'
alias please='sudo'
alias publicip='curl https://ipinfo.io/ip'
alias ra='ri -a'
alias red='ruby -pe'
alias rn='ranger'
alias se='sed -s -n -E'
alias so='socli -siq'
alias tau="tar -zxvf"

export ATHAME_ENABLED=0

export LC_ALL=en_US.UTF-8

