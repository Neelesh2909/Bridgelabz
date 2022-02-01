#!/bin/bash -x

read -p "Enter first  Number : "  a
read -p "Enter second Number : "  b
read -p "Enter third Number : "  c
read -p "Enter fourth Number : "  d
read -p "Enter fifth Number : "  e

sum=$(($a+$b+$c+$d+$e));
avg=$(($sum/5));

echo "Sum is : $sum";
echo "Average is : $avg";