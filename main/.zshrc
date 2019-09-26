export ZPLUG_HOME=/home/linuxbrew/.linuxbrew/opt/zplug
source $ZPLUG_HOME/init.zsh
source $HOME/bin/_fzf-funcs
source $HOME/.lf_icons
source /usr/local/share/chruby/chruby.sh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

export FZF_BASE=/home/vincent/.fzf
export OMNIVIM_EDITOR=nvim
PLANG='ruby'
PLANG_EXT='rb'

HISTSIZE=1000
SAVEHIST=1000

setopt kshglob
setopt auto_cd
setopt prompt_subst # Make sure prompt is able to be generated properly.
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3 # defer until other plugins like oh-my-zsh is loaded
BULLETTRAIN_PROMPT_ORDER=(
  dir
  git
)
BULLETTRAIN_PROMPT_SEPARATE_LINE=false
BULLETTRAIN_PROMPT_CHAR=""
BULLETTRAIN_GIT_BG=green

export KEYTIMEOUT=10
bindkey -M viins 'jk' vi-cmd-mode

zplug "plugins/bundler", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/common"-aliases, from:oh-my-zsh
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
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

bindkey -s '^O' 'lf\n'

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
        BUFFER="fg"
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


alias gi="sudo gem install"
alias tau="tar -zxvf"
alias info="info --vi-keys"
alias e=$EDITOR
alias -g Y='| tmux loadb -'
alias P="tmux saveb -"
alias rn='ranger'
alias -g HE='--help | less'
alias publicip='curl https://ipinfo.io/ip'
alias -g L='| cless'
alias red='ruby -pe'
alias ov='python ~/bin/omnivim.py'
alias psa='ps aux | sort -nrk 3,3 | head -n 5'
alias ra='ri -a'
alias g=hub
alias ls='ls --color'
alias inf=pinfo
alias se='sed -s -n -E'
alias gc='git commit -m'


alias so='socli -siq'

