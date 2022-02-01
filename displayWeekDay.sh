#!/bin/bash

read -p "Enter a week day number : " Number

if [ $Number -eq 1 ]
then
	echo "Monday"
elif [ $Number -eq 2 ]
then
	echo "Tuesday"
elif [ $Number -eq 3 ]
then
	echo "Wednesday"
elif [ $Number -eq 4 ]
then
	echo "Thursday"
elif [ $Number -eq 5 ]
then
	echo "Friday"
elif [ $Number -eq 6 ]
then
	echo "Saturday"
elif [ $Number -eq 7 ]
then
	echo "Sunday"
else
	echo "Invalid Weekday Number"
fi