shell_session_update() { :; }

# colors
export COLOR_RED="\[\033[01;31m\]"
export COLOR_GREEN="\[\033[01;32m\]"
export COLOR_WHITE="\[\033[01;37m\]"
export COLOR_GREY="\[\033[00m\]"
export COLOR_BLUE="\[\033[01;34m\]"
export COLOR_YELLOW="\[\033[01;33m\]"

# set username color. red -> root, green -> everyone else
export COLOR_USERNAME=$COLOR_GREEN
if [ "$(id -u)" = "0" ]; then
   export COLOR_USERNAME=$COLOR_RED
fi

# set PS1 to show fancy prompt
export PS1="$COLOR_USERNAME\u$COLOR_WHITE@$COLOR_BLUE\h$COLOR_GREY[$COLOR_YELLOW\w$COLOR_GREY]$COLOR_USERNAME\$ $COLOR_GREY"

# useful shortcuts
alias fsearch='grep -rnw "." -e '
alias lsblk='diskutil list'
alias dc='cd ~/dev'
alias ..='cd ..'
alias ll='ls -la'
alias l='ls -la'
alias rc='source ~/.bashrc'
alias bashrc='source ~/.bashrc'

# git shortcuts
alias gstatus='git status'
alias gcommit="git commit -m"
alias gpush="git push"
alias gpull="git pull"

function gadd(){
	git add ${1:-.}
}

function gall(){
	if [ -z "$1" ]; then
		echo 'add a commit message. Usage:'
		echo 'gall "commit message"'
		return 1
	fi

	echo "git add ."
	git add .
	echo "git commit -m \"$*\""
	git commit -m "$*"
	echo "git pull"
	git pull
	echo "git push"
	git push
}

# edit shortcut. default param is "."
function e(){
	subl	 ${1:-.}
}

# mac open shortcut. default param is "."
function o(){
	open ${1:-.}
}
