#!/bin/bash -x

isFullTimeEmployee=1;
isPartTimeEmployee=2;
empRatePerHour=40;
employeeCheck=$((RANDOM%3));

case $employeeCheck in
	$isFullTimeEmployee)
			empHours=8
			;;
	$isPartTimeEmployee)
			empHours=4
			;;
	*)
	empHours=0
	;;
esac

salary=$(($empRatePerHour*$empHours));