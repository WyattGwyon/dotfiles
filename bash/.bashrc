
BLUE="\033[1;34m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
RESET="\033[0m"
BOLD="\033[1m"

export MAIL="clouden@student.42madrid.com"


parse_git_branch()
{
	git rev-parse --is-inside-work-tree &>/dev/null || return

	branch=$(git branch --show-current 2>/dev/null)
	
	if [ -z "$branch" ]; then
		branch=$(git rev-parse --short HEAD 2>/dev/null)
		branch="detached@$branch"
	fi
	
	echo -n " git($branch) "
}

export PS1="\[$BOLD\]\[$BLUE\]\u@\h:\w\[$RED\]\$(parse_git_branch)\[$YELLOW\]\$ \[$RESET\]"
