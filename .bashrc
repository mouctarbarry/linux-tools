export PS1="\[\e[32m\]\u \[\e[0m\]\[\e[33m\]\w\[\e[0m\]\[\e[35m\] $ \[\e[0m\]"

alias ls='eza --color=always --group-directories-first'
alias LS='eza --color=always --group-directories-first --icons'
alias sl='eza --color=always --group-directories-first --icons'
alias ll='eza -la --icons --octal-permissions --group-directories-first'
alias l='eza -bGF --header --git --color=always --group-directories-first --icons'
alias llm='eza -lbGd --header --git --sort=modified --color=always --group-directories-first --icons'
alias la='eza --long --all --group --group-directories-first'
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons'
alias lS='eza -1 --color=always --group-directories-first --icons'
alias lt='eza --tree --level=2 --color=always --group-directories-first --icons'
alias l.='eza -a | grep -E '^\.''

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias home='cd ~'
alias c='clear'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias mc='micro'
export GREP_COLORS='ms=01;31:mc=01;31:fn=35:ln=32:bn=32:se=36'

# Git aliases - CORRECTED
alias gs='git status'
alias ga='git add'
alias gc='git commit -S'
alias gaa='git add .'
alias gp='git push origin'
alias gl='git log --oneline --graph --decorate'
alias gco='git checkout'
alias gb='git branch'
alias gpo='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias gundo='git reset --soft HEAD~1'
alias gredo='git reset --hard HEAD@{1}'
alias gdiff='git diff'
alias gst='git stash'

alias rm='rm -i'
alias rmd='rm -r'
alias cleanup='rm -i -rf node_modules dist .DS_Store'

alias ports='netstat -tulpn'
alias ip='curl ifconfig.me'
alias rld='source ~/.bashrc'
alias reld='source ~/.bashrc'

alias f='fzf'
alias edrc='subl ~/.bashrc'
alias catrc='cat ~/.bashrc'

source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k
alias pods='kubectl get pods'
alias nodes='kubectl get nodes'

# Alias généraux
alias kg='kubectl get'
alias kd='kubectl describe'
alias ke='kubectl explain'
alias ka='kubectl apply -f'
alias kc='kubectl create -f'
alias krm='kubectl delete'

# Ressources les plus fréquentes
alias kgp='kubectl get pods -o wide'
alias kgs='kubectl get svc -o wide'
alias kgd='kubectl get deployments -o wide'
alias kgn='kubectl get nodes -o wide'
alias kgns='kubectl get ns'

# Logs & exec
alias klo='kubectl logs'
alias klf='kubectl logs -f'
alias kex='kubectl exec -it'

# YAML rapide
alias kgy='kubectl get -o yaml'
alias kdp='kubectl describe pod'

alias md='mkdir'
bind 'set bell-style none'
printf '\e[?1000l'   # disable terminal mouse bell
printf '\033[5l'
# Disable terminal bell completely
stty -ixon
stty stop undef
stty start undef