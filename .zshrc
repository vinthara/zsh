#!/usr/bin/env zsh
#   _________  _   _ ____   ____ 
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |    
# _ / /_ ___) |  _  |  _ <| |___ 
#(_)____|____/|_| |_|_| \_\\____|
#
 
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=2000
setopt appendhistory


# Complétion 
autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# Crée un cache des complétion possibles
# très utile pour les complétion qui demandent beaucoup de temps
# comme la recherche d'un paquet aptitude install moz<tab>
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
# des couleurs pour la complétion
# faites un kill -9 <tab><tab> pour voir :)
zmodload zsh/complist
setopt extendedglob
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
 
# Correction des commandes
#setopt correctall
unsetopt correct_all 
# Un petit prompt sympa
#autoload -U promptinit
#promptinit
#prompt adam1
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 
# Les alias marchent comme sous bash
alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'
alias lll='ls --color=auto -lh | less'
# marre de se faire corriger par zsh ;)
alias xs='cd'
alias sl='ls'
# mplayer en plein framme buffer ;)
alias mplayerfb='mplayer -vo fbdev -vf scale=1024:768'
# Un grep avec des couleurs :
export GREP_COLOR=31
alias grep='grep --color=auto'
alias xte='nohup xterm &' # xte lancera un xterm qui ne se fermera pas si on ferme le terminal

alias git_perso="cp ~/.gitconfig_perso ~/.gitconfig && sed -i.bak 's/IdentityFile ~\/.ssh\/id_rsa_gitlab_veolia/#IdentityFile ~\/.ssh\/id_rsa_gitlab_veolia/g ; s/#*IdentityFile ~\/.ssh\/\<id_rsa_gitlab\>/IdentityFile ~\/.ssh\/id_rsa_gitlab/g' ~/.ssh/config && ssh -T git@gitlab.com"

alias git_veolia="cp ~/.gitconfig_veolia ~/.gitconfig && sed -i.bak 's/IdentityFile ~\/.ssh\/\<id_rsa_gitlab\>/#IdentityFile ~\/.ssh\/id_rsa_gitlab/g ; s/#*IdentityFile ~\/.ssh\/\<id_rsa_gitlab_veolia\>/IdentityFile ~\/.ssh\/id_rsa_gitlab_veolia/g' ~/.ssh/config && ssh -T git@gitlab.com"


alias jup='conda activate && jupyter-notebook'


#bindkey "\C-f": forward-search-history
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey  "^[[3~"  delete-char
bindkey "^U" backward-kill-line


export PATH="/home/aravinth/google-cloud-sdk/bin:/home/aravinth/anaconda3/condabin:$PATH"
# Pareil pour les variables d'environement :
#export http_proxy="http://hostname:8080/"
#export HTTP_PROXY=$http_proxy
# un VRAI éditeur de texte ;)
export EDITOR=/usr/bin/vim






# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/aravinth/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/aravinth/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/aravinth/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/aravinth/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(starship init zsh)"
