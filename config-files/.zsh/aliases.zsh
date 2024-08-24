alias ls='ls --color=tty'
alias ll='ls -la'

alias up='docker compose up'
alias down='docker compose down'

alias squash='git reset $(git merge-base main $(git rev-parse --abbrev-ref HEAD))'
alias squashm='git reset $(git merge-base master $(git rev-parse --abbrev-ref HEAD))'

alias check='docker run --rm --volume="$PWD:/check" mstruebing/editorconfig-checker'