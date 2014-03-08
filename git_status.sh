#!/bin/bash

function git_deleted {
	[[ $(git status 2> /dev/null | grep deleted:) != "" ]] && echo "-"
}

function git_added {
	[[ $(git status 2> /dev/null | grep "Untracked files:") ]] && echo "+"
}

function git_modified {
	[[ $(git status 2> /dev/null | grep "modified:") != "" ]] && echo "*"
}

function git_dirty {
	echo "$(git_added)$(git_modified)$(git_deleted)"
}

function git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d'
	###-e "s/* \(.*\)/[\l$(git_dirty)]/"
}

export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n $(git_branch)$ '
