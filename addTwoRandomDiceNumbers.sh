#!/bin/bash -x

firstNumber=$(((RANDOM%6)+1));
secondNumber=$(((RANDOM%6)+1));
result=$(($firstNumber+$secondNumber));
echo $result