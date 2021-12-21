#!/bin/bash 

red='\033[0;31m'
reset='\033[0m'

if [ $# -ne 3 ]
then
	if [ $# -gt 3 ]
	then
		echo -e "${red}many args${reset}"; exit
	else
		echo -e "${red}few args${reset}" ; exit
	fi
fi

count=$(($2 - $1))

if [ $3 -lt $count ]
then
	let "count=$3"
fi

rm -fr gen.txt
touch gen.txt
for ((i = 0 ; i < $count ; i++ ))
do
	rand=$(($1 + $RANDOM % $2))
	exist=`cat gen.txt | grep "$rand" | wc -w`
	if [ $exist -eq 0 ]
	then
		echo -n "$rand " >> gen.txt
	else
		let "i=i-1"
	fi
done
