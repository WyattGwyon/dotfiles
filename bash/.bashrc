
BLUE="\033[1;34m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
RESET="\033[0m"
BOLD="\033[1m"

export MAIL="clouden@student.42madrid.com"

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

: <<'END_COMMENT'
cd() {
    # Change directory
    builtin cd "$@" || return

    # Only deactivate if the previous directory had a venv
    # Compare the previous directory venv with the new one
    local new_venv=""

    # Check if .venv or venv exists in the new directory
    if [[ -f "./.venv/bin/activate" ]]; then
        new_venv="./.venv/bin/activate"
    elif [[ -f "./venv/bin/activate" ]]; then
        new_venv="./venv/bin/activate"
    fi

    # If there’s a new venv and it's different from current, deactivate old
    if [[ -n "$new_venv" ]]; then
        if [[ -n "$VIRTUAL_ENV" ]]; then
            deactivate 2>/dev/null
        fi
        source "$new_venv"
        echo "Activated venv: $VIRTUAL_ENV"
    fi
}
END_COMMENT

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
