#!/bin/bash -x

read -p "Enter Your Favourite Number here : " number

isFullTime=2
isPartTime=1
isJobless=0

logHourPerDay=8
perHourCost=100
salary=0

	if [ $number -eq $isFullTime ]
		then
			salary=$((logHourPerDay*perHourCost))
                        echo "Nandha Joined As Full-Time Job"
	elif [ $number -eq $isPartTime ]
                then
                        salary=$((logHourPerDay*perHourCost))
                        salary=$((salary/2))
                        echo "Nandha Joined As Part-Time Job"
        elif [ $number -eq $isJobless ]
		then
                     	echo "Nandha seems Jobless"
	else
                     echo "Please Check Your Input , It's Invalid :("
                fi

echo "Income Is $salary"
