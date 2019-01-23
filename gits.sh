#!/bin/bash


echo "(NULL)：git status"
echo "pc：git push origin current_branch"
echo "pm：git push origin master"
echo "lu：git log --author username"
echo "rp：git remote prune origin"
echo "dcr：git branch -D (remote branch of current name)"
echo "bsp: git branch --set-upstream-to=origin/<branch> branch"
echo "gll: show the file last change info(default parameter is * )"
echo "========== Press any key to continue ================== "

function showLastChanges() {
    if [[ "*" == $1 ]]; then
        # show all of the files in current dir.
       for file in ./*
       do
            if test -f $file; then
                showLastChanges $file
            fi
       done 
    elif [ -f $1 ]; then
        # if single file input. then show the file last change info.
        echo $1 | git log --pretty=format:"%an, %cd, %s [hash: %h]" -1 $1
    else
        echo "file not exist. check your input ${1}"
    fi

}


current_branch=$(git symbolic-ref --short -q HEAD)

read choose


if [ ! ${choose} ]; then
	git status
elif [[ ${choose} == "lu" ]]; then
    git log --author tangkunyin  
elif [[ ${choose} == "pc" ]]; then
    echo "git push origin ${current_branch}"
    git push origin ${current_branch} 
elif [[ ${choose} == "pm" ]]; then
	echo "git push origin master"
    git push origin master
elif [[ ${choose} == "rp" ]]; then
    git remote prune origin
elif [[ ${choose} == "dcr" ]]; then
    git push origin :${current_branch} 
elif [[ ${choose} == "bsp" ]]; then
    git branch --set-upstream-to=origin/${current_branch} ${current_branch} 
elif [[ ${choose} == "gll"  ]]; then
    echo "input fileName of *: "
    read fileName
    showLastChanges $fileName ? $fileName : "*"
fi
