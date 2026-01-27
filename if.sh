#! bin/bash

num1=5
num2=7
num3=3

if [[ $num1 -gt $num2 && $num2 -gt $num3 ]]; then
	echo "$num1"

elif [[ $num2 -gt $num1 && $num2 -gt $num3 ]]; then
	echo "$num2"

else
	echo "$num3"

fi
