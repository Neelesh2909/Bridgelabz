#!/bin/bash -x

read -p "Enter first number : " num1
if [ $num1 in [0-9][0-9][0-9] ]
then
	$num1=$num1
else
	echo "Please enter a 3 digit number";
	read -p "Enter first number : " num1
fi