function toolbox_status() {
	if [ -f "/run/.toolboxenv" ]
	then
		toolbox_name=$(cat /run/.containerenv | grep -E '^name="' | cut -d \" -f 2)
		echo ' ⬣ '
	fi
}

git_status() {
    branch_name=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    branch_status=$(git status --porcelain=v1 2>/dev/null | wc -l | awk '{$1=$1};1')

    if [[ $branch_name == "" ]]; then
        :
    else
        if [[ $branch_status == 0 ]]; then
            echo ':: ['$branch_name'] '
        else
            echo ':: ['$branch_name'*] '
        fi
    fi
}

USER="\u"
HOST="\h"
WORKING_DIR="\W"
GIT="\$(git_status)"
TOOLBOX="\$(toolbox_status)"

export PS1="${TOOLBOX}$WORKING_DIR $GIT> "
