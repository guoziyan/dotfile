lambda="λ"

# Set some frontground color.
fg_color_black="$(tput setaf 0)"
fg_color_red="$(tput setaf 1)"
fg_color_green="$(tput setaf 2)"
fg_color_yellow="$(tput setaf 3)"
fg_color_blue="$(tput setaf 4)"
fg_color_megenta="$(tput setaf 5)"
fg_color_cyan="$(tput setaf 6)"
fg_color_white="$(tput setaf 7)"
reset="$(tput sgr0)"
bold="$(tput bold)"

# Parse git branch.
function parse_git_branch {
  	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1)/"
}

function setStatusColor {
    if [[ $? -ne "0" ]]; then
        echo $fg_color_red
    else
        echo $fg_color_green
    fi
}

# PS1 and CLICOLOR.
export LSCOLORS=gxfxcxdxbxegedabagacad
export CLICOLOR=1
export PS1='\[$bold\]\[$fg_color_green\]$lambda \[$fg_color_megenta\]\w\[$fg_color_blue\]$(parse_git_branch)\[$reset\]  '

# Path settings.
export ANDROID_HOME="/usr/local/opt/android-sdk"
export LLVM_DIR="/usr/local/opt/llvm"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH:$LLVM_DIR/bin:$HOME/Applications/bin"

export EDITOR="atom"



# User alias.
alias brews="brew list -1"
alias l="ls -l"
alias la="ls -a"
alias ll="ls -alh"
alias ga="git add"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -D"
alias gca="git commit -a -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gd="git diff --stat"
alias gl="git log --graph --pretty=format:'%Cgreen%h%Creset - %C(cyan)%an %cd%Creset  %Cred-> %Creset%s' --abbrev-commit --date=short"
alias gm="git merge --no-ff"
alias gp="git push"
alias gpom="git pull origin master"
alias gpt="git push --tags"
alias grep="grep --color=auto"
alias grh="git reset --hard"
alias gst="git status"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias z="_z 2>&1"


# LLVM alias.
alias llvm-ir='clang -Os -S -emit-llvm'


# Enable plugins.
. `brew --prefix`/etc/profile.d/z.sh
