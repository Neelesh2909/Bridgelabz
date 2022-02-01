#!/bin/bash

read -p "Enter a number : " Number

if [ $Number -eq 1 ]
then
	echo "Unit";
elif [ $Number -eq 10 ]
then
	echo "Ten";
elif [ $Number -eq 100 ]
then
	echo "Hundred";
elif [ $Number -eq 1000 ]
then
	echo "Thousand";
elif [ $Number -eq 10000 ]
then
	echo "Ten Thousand";
else
	echo "Invalid Number.Please enter numbers like(1,10,100,1000,10000)";
fi