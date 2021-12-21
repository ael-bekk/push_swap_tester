#!/bin/bash

Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
BYellow='\033[1;33m'
white='\033[1;37m'
green='\033[0;32m'
red='\033[0;31m'
yell='\033[0;33m'
reset='\033[0m'

if [ $# -lt 2 ] | [ $# -gt 3 ]
then
    if [ $# -gt 3 ]
    then
        echo -e "${red}many args${reset}" >&2; exit
    else
        echo -e "${red}few args${reset}" >&2 ; exit
    fi
fi

if ! [ -f "$1" ]
then
	echo -e "${red}Error : ${white}push_swap ${reset}" >&2 ; exit
fi

if ! [ -f "$2" ]
then
    echo -e "${red}Error : ${white}checker ${reset}" >&2 ; exit
fi 

if [ $# -eq 3 ]
then
	re='^[0-9]+$'
	if ! [[ $3 =~ $re ]] ; then
	   echo -e "${red}Error: ${white}Arg3 Not a number" >&2; exit 1
	fi
fi

test_100 () {
	if [ "$2" == "2" ]
	then
		if [ $1 -le 1 ]
        then
            echo -en "${green}$1"
        else
            echo -en "${red}$1"
		fi
	else if [ "$2" == "3" ]
	then
		if [ $1 -le 3 ]
        then
            echo -en "${green}$1"
        else
            echo -en "${red}$1"
		fi
	else if [ "$2" == "5" ]
	then
		if [ $1 -le 12 ]
		then
			echo -en "${green}$1"
		else
			echo -en "${red}$1"
		fi
	else if [ "$2" == "100" ]
	then
		if [ $1 -le 700 ]
		then
			echo -en "${green}$1"
		else if [ $1 -le 900 ]
			then
				echo -en "${yell}$1"
		else if [ $1 -le 1100 ]
			then
				echo -en "${Cyan}$1"
		else if [ $1 -le 1300 ]
			then
				echo -en "${Purple}$1"
		else if [ $1 -le 1500 ]
			then
				echo -en "${Blue}$1"
		else
			echo -en "${red}$1"
		fi fi fi fi fi
	else
		if [ $1 -le 5500 ]
        then
            echo -en "${green}$1"
        else if [ $1 -le 7000 ]
            then
                echo -en "${yell}$1"
        else if [ $1 -le 8500 ]
            then
                echo -en "${Cyan}$1"
        else if [ $1 -le 10000 ]
            then
                echo -en "${Purple}$1"
        else if [ $1 -le 11500 ]
            then
                echo -en "${Blue}$1"
        else
            echo -en "${red}$1"
        fi fi fi fi fi 
	fi fi fi fi
}

if [ $# -eq 2 ] 
then
	times=1
else if [ $3 -lt 1 ]
then
	times=1
else
	times=$3
fi fi

check () {
	if [ $1 == 0 ]
	then
		echo -e "❌"
	else
	    echo -e "${green}✔${reset}"
	fi
}

rm -rf tests
mkdir -p tests
echo -e "\n${green}<____________________________________Tester by ael-bekk___________________________________>${reset}"

echo -e "\n${white}Manage error${red} push_swap :${reset}"
echo -en "less than INT_MIN : "
err=`./$1 -2147483649  2>&1 | wc -l`
check $err
echo -en "greater than INT_MAX : "
err=`./$1 2147483648   2>&1 | wc -l`
check $err
echo -en "args with non-digit : "
err=`./$1 2 5 6 one 8  2>&1 | wc -l`
check $err
echo -en "duplicate args : "
err=`./$1 1 2 5 4 1 9  2>&1 | wc -l`
check $err

echo -e "\n${white}Manage error${red} checker :${reset}"
echo -en "less than INT_MIN : "
err=`./$2 -2147483649  2>&1 | wc -l`
check $err
echo -en "greater than INT_MAX : "
err=`./$2 2147483648   2>&1 | wc -l`
check $err
echo -en "args with non-digit : "
err=`./$2 2 5 6 one 8  2>&1 | wc -l`
check $err
echo -en "duplicate args : "
err=`./$2 1 2 5 4 1 9  2>&1 | wc -l`
check $err


echo -e "\n${white}Rmandom of${red} Two${white} Numbers :${reset}"
mkdir -p tests/gen_2
avr=0
for ((j = 0 ; j < times ; j++ ))
do
	./generate.sh 0 100 2
	mv gen.txt tests/gen_2/gen_2_$j.txt
	res=$(./$1 `cat tests/gen_2/gen_2_$j.txt` | ./$2 `cat tests/gen_2/gen_2_$j.txt`)
	count=($(./$1 `cat tests/gen_2/gen_2_$j.txt` | wc -l))
	echo -en "${yell}checher ${green}${res} : ${reset}"
	test_100 "$count" 2
	echo -e "${reset} Instruction."
	avr=$(($avr + $count))
done
echo -en "${BYellow}average : "
test_100 "$(($avr / $times))"
echo ""

avr=0
echo -e "\n${white}Random of ${red}3 ${white}Numbers :${reset}"
mkdir -p tests/gen_3
for ((j = 0 ; j < times ; j++ ))
do
	./generate.sh 0 100 3
	mv gen.txt tests/gen_3/gen_3_$j.txt
	res=$(./$1 `cat tests/gen_3/gen_3_$j.txt` | ./$2 `cat tests/gen_3/gen_3_$j.txt`)
	count=($(./$1 `cat tests/gen_3/gen_3_$j.txt` | wc -l))
	echo -en "${yell}checher ${green}${res} : ${reset}"
	test_100 "$count" 3
	echo -e "${reset} Instruction."
	avr=$(($avr + $count))
done
echo -en "${BYellow}average : "
test_100 "$(($avr / $times))"
echo ""

avr=0
echo -e "\n${white}Random of ${red}5 ${white}Numbers :${reset}"
mkdir -p tests/gen_5
for ((j = 0 ; j < times ; j++ ))
do
	./generate.sh  0 100 5
	mv gen.txt tests/gen_5/gen_5_$j.txt
	res=$(./$1 `cat tests/gen_5/gen_5_$j.txt` | ./$2 `cat tests/gen_5/gen_5_$j.txt`)
	count=($(./$1 `cat tests/gen_5/gen_5_$j.txt` | wc -l))
	echo -en "${yell}checher ${green}${res} : ${reset}"
	test_100 "$count" 5
	echo -e "${reset} Instruction."
	avr=$(($avr + $count))
done
echo -en "${BYellow}average : "
test_100 "$(($avr / $times))"
echo ""

avr=0
echo -e "\n${white}Random of ${red}100 ${white}Numbers :${reset}"
mkdir -p tests/gen_100
for ((j = 0 ; j < times ; j++ ))
do
	./generate.sh  0 500000 100
	mv gen.txt tests/gen_100/gen_100_$j.txt
	res=$(./$1 `cat tests/gen_100/gen_100_$j.txt` | ./$2 `cat tests/gen_100/gen_100_$j.txt`)
	count=($(./$1 `cat tests/gen_100/gen_100_$j.txt` | wc -l))
	echo -en "${yell}checher${green} ${res} : ${reset}"
	test_100 "$count" 100
	echo -e "${reset} Instruction."
	avr=$(($avr + $count))
done
echo -en "${BYellow}average : "
test_100 "$(($avr / $times))"
echo ""

avr=0
echo -e "\n${white}Random of ${red}500 ${white}Numbers :${reset}"
mkdir -p tests/gen_500
for ((j = 0 ; j < times ; j++ ))
do
	./generate.sh 0 70000000 500
	mv gen.txt tests/gen_500/gen_500_$j.txt
	res=$(./$1 `cat tests/gen_500/gen_500_$j.txt` | ./$2 `cat tests/gen_500/gen_500_$j.txt`)
	count=($(./$1 `cat tests/gen_500/gen_500_$j.txt` | wc -l))
	echo -en "${yell}checher ${green}${res} : ${reset}"
	test_100 "$count" 500
	echo -e "${reset} Instruction."
	avr=$(($avr + $count))
done
echo -en "${BYellow}average : "
test_100 "$(($avr / $times))"
echo ""
echo ""
