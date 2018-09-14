#!/bin/bash


echo "(NULL)：git status"
echo "pc：git push origin current_branch"
echo "pm：git push origin master"
echo "lu：git log --author username"
echo "=== Press any key to continue... "

read choose


if [ ! ${choose} ]; then
	git status
elif [[ ${choose} == "lu" ]]; then
    git log --author tangkunyin  
elif [[ ${choose} == "pc" ]]; then
    current_branch=$(git symbolic-ref --short -q HEAD)
    echo "git push origin ${current_branch}"
    git push origin ${current_branch} 
elif [[ ${choose} == "pm" ]]; then
	echo "git push origin master"
    git push origin master
fi


