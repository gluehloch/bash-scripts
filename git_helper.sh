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
    git branch | sed -n '/\* /s///p'
	###git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' 
	###-e "s/* \(.*\)/[\l$(git_dirty)]/"
	###
}

export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\] [$(git_branch)] [$(git_dirty)] \n$ '


alias gll='git log --graph --pretty=oneline --abbrev-commit'

function git_info() {

    if [ -n "$(git symbolic-ref HEAD 2> /dev/null)" ]; then
        # print informations
        echo "git repo overview"
        echo "-----------------"
        echo

        # print all remotes and thier details
        for remote in $(git remote show); do
            echo $remote:
            git remote show $remote
            echo
        done

        # print status of working repo
        echo "status:"
        if [ -n "$(git status -s 2> /dev/null)" ]; then
            git status -s
        else
            echo "working directory is clean"
        fi

        # print at least 5 last log entries
        echo 
        echo "log:"
        git log -5 --oneline
        echo 

    else
        echo "you're currently not in a git repository"

    fi
}
