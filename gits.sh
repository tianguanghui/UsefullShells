#!/bin/bash

read choose


if [ ! ${choose} ]; then
	git log
elif [[ ${choose} == "pc" ]]; then
    git branch | xargs echo "git push origin "
    git branch | xargs git push origin 
elif [[ ${choose} == "pm" ]]; then
	echo "git push origin master"
    git push origin master
else
    echo "没参数：git log"
    echo "pc：git push origin current_branch"
    echo "pm：git push origin master"
    echo "=== 任意键退出 ==="
    exit 1
fi


