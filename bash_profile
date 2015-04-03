# Load bash config.
export BASH_CUSTOM=$HOME/.config/bash

# Alias.
. $BASH_CUSTOM/alias.sh

arrow="λ"

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty)$(parse_git_untrack)$(parse_git_delete))/"
}

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != 'nothing to commit, working directory clean' ]] && echo -e "|*"
}
function parse_git_untrack {
  [[ $(git status 2> /dev/null | grep 'Untracked files:') != '' ]] && echo -e "+"
}
function parse_git_delete {
  [[ $(git status 2> /dev/null | grep 'Changes not staged for commit:') != '' ]] && echo -e "-"
}


# PS1 and clicolor.
export CLICOLOR=1
export PS1='$arrow \W$(parse_git_branch)  '

# Path settings.
export GOPATH=$HOME/code/go
export PATH=$GOPATH/bin:$PATH

# User alias.
alias mocha='mocha --harmony'
alias nodemon='nodemon --harmony'
alias l='ls -l'
alias la='ls -a'
alias ll='ls -alh'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# Enable plugins.
. `brew --prefix`/etc/profile.d/z.sh

