# .bashrc configuration file

# Git aliases
alias g='git'
alias ga='git add'
alias gs='git status'
alias gc='git commit'
alias gp='git push'

# printf syntax correction
printf "This is a corrected printf statement."

# Correct stty commands
stty -echo
# Other stty configurations can go here.

# Ports alias
alias p1='ssh -L 8080:localhost:80 user@hostname'
alias p2='ssh -L 4443:localhost:443 user@hostname'
