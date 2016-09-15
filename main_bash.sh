#!/bin/bash

resettem=$(tput sgr0)
declare -A ssharray
i=0
numbers=""

for script_file in `ls -I "main_bash.sh" ./`
do
	echo -e "\e[1;35m" "The script:" ${i} '==>' ${resettem} ${script_file}
	ssharray[${i}]=${script_file}
	numbers="${numbers} | ${i}"
	i=$((i+1)) 
done

while true
do
	read -p "please input a number [ ${numbers} ]:" choice
	if [[ ! ${choice} = ~^[0-9]+ ]]
	then
		exit 0 
	fi
done

