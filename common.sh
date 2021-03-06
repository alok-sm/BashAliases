shell_session_update() { :; }

# colors
export COLOR_RED="\[\033[01;31m\]"
export COLOR_GREEN="\[\033[01;32m\]"
export COLOR_WHITE="\[\033[01;37m\]"
export COLOR_GREY="\[\033[00m\]"
export COLOR_BLUE="\[\033[01;34m\]"
export COLOR_YELLOW="\[\033[01;33m\]"
export COLOR_TEAL="\[\033[01;36m\]"

# set username color. red -> root, green -> everyone else
export COLOR_USERNAME=$COLOR_GREEN
if [ "$(id -u)" = "0" ]; then
   export COLOR_USERNAME=$COLOR_RED
fi

# set PS1 to show fancy prompt
export PS1="$COLOR_USERNAME\u$COLOR_WHITE@$COLOR_BLUE\h$COLOR_GREY[$COLOR_YELLOW\w$COLOR_GREY] $COLOR_TEAL\$(parse_git_branch)$COLOR_GREY\n$COLOR_USERNAME\$ $COLOR_GREY"

# useful shortcuts
alias fsearch='grep -rnw "." -e '
alias dc='cd ~/dev'
alias ..='cd ..'
alias ll='ls -la'
alias l='ls -la'
alias rc='source ~/.bash_profile'
alias lf='find . -maxdepth 1 -type f'
alias ld='find . -maxdepth 1 -type d'
alias c='clear'
alias x='exit'
alias ~='cd ~'
alias p2="python"
alias p3="python3"
alias jsonprint="python -m json.tool"
alias porta='cd dev/HciResearch/Porta/'

# git shortcuts
alias gstatus='git status'
alias gcommit="git commit -m"
alias gpush="git push"
alias gpull="git pull"
alias venv="source virtualenv_run/bin/activate"

function gadd(){
	git add ${1:-.}
}

function gall(){
	if [ -z "$1" ]; then
		echo 'add a commit message. Usage:'
		echo 'gall "commit message"'
		return 1
	fi

	git add .
	git commit -m "$*"
	git pull
	git push
}

# edit shortcut. default param is "."
function e(){
	subl ${1:-.}
}

# mac open shortcut. default param is "."
function o(){
	open ${1:-.}
}

# real path to print real path of a file
realpath() { echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"; };

# print parent process id
ppid() { ps -p ${1:-$$} -o ppid=; }

# print list of all ancestors
ancestors(){
    ppid=$(ppid $1)
    echo $ppid
    [ $ppid -gt 1 ] &&  findFather $ppid
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

