#!/bin/bash -x

heads=1
tails=0
checkFlip=$((RANDOM%2))

if [ $checkFlip -eq $heads ]
then
	echo "It is Heads";
else
	echo "It is Tails";
fi