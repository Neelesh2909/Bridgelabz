#!/bin/bash -x

isFullTimeEmployee=1;
isPartTimeEmployee=2;
empRatePerHour=40;
employeeCheck=$((RANDOM%3));
if [ $employeeCheck -eq $isFullTimeEmployee ];
then
	empHours=8;
elif [ $employeeCheck -eq $isPartTimeEmployee ];
then
	empHours=4;
else
	empHours=0;
fi

salary=$(($empRatePerHour*$empHours));