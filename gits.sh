#!/bin/bash


echo "(NULL)：git status"
echo "pc：git push origin current_branch"
echo "pm：git push origin master"
echo "lu：git log --author username"
echo "rp：git remote prune origin"
echo "dcr：git branch -D (remote branch of current name)"
echo "bsp git branch --set-upstream-to=origin/<branch> branch"
echo "========== Press any key to continue ================== "


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
fi
