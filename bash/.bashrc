
BLUE="\033[1;34m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
RESET="\033[0m"
BOLD="\033[1m"

#vim up yout terminal
set -o vi

# override original cd
cd () {
	# call orignal cd with args
	builtin cd "$@" || return

	# deactivate previous venv if active
	if [[ -n "$VIRTUAL_ENV" ]]; then
		local project_root
		project_root=$(dirname "$VIRTUAL_ENV")

		if [[ "$PWD" != "$project_root"* ]]; then
			deactivate 2>/dev/null
			echo "Deactivated .venv (left project)"
		fi
	fi

	# activate present venv
	if [[ -f "./.venv/bin/activate" ]]; then
		source ./.venv/bin/activate
		echo "Activated .venv in $(pwd)"
		fi
}

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

export INPUTRC="$HOME/.inputrc"
bind -f "$INPUTRC"

if [ -f "$HOME/.bashrc.local" ]; then
	source "$HOME/.bashrc.local"
fi

