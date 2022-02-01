#!/bin/bash -x

read -p "Enter first number : " a
read -p "Enter second number : " b
read -p "Enter third number : " c


result1=$(($a+b*$c));
result2=$(($a*$b+$c));
result3=$(($c+$a/$b));
result4=$(($a%$b+c));


echo "****Creating a Dict****";
declare -A computationResults

computationResults[result_1]=$result1;
computationResults[result_2]=$result2;
computationResults[result_3]=$result3;
computationResults[result_4]=$result4;

echo "All result : " ${computationResults[@]}
echo "***********************************"
echo "All keys : " ${!computationResults[@]}






echo "****Dict to Array****";
declare -a computationResultsArray
counter=0;
computationResultsArray[((counter++))]=${computationResults[result_1]};
computationResultsArray[((counter++))]=${computationResults[result_2]};
computationResultsArray[((counter++))]=${computationResults[result_3]};
computationResultsArray[((counter++))]=${computationResults[result_4]};
echo ${computationResultsArray[@]}
echo "*****************************"
echo ${!computationResultsArray[@]}



lenArray=${#computationResultsArray[@]}
echo "$lenArray";






echo "*****Desending order******";
for((i=0;i<$lenArray;i++))
do
	for((j=0;j<$((($lenArray-$i)-1));j++))
	do
		if [ ${computationResultsArray[j]} -lt ${computationResultsArray[$((j+1))]} ]
		then
			temp=${computationResultsArray[j]};
			computationResultsArray[$j]=${computationResultsArray[$((j+1))]}
			computationResultsArray[$((j+1))]=$temp;
		fi
	done
done

echo "Array in Decending order : "
echo ${computationResultsArray[@]}








echo "******Acending order******";
for((i=0;i<$lenArray;i++))
do
	for((j=0;j<$((($lenArray-$i)-1));j++))
	do
		if [ ${computationResultsArray[j]} -gt ${computationResultsArray[$((j+1))]} ]
		then
			temp=${computationResultsArray[j]};
			computationResultsArray[$j]=${computationResultsArray[$((j+1))]}
			computationResultsArray[$((j+1))]=$temp;
		fi
	done
done

echo "Array in Acending order : "
echo ${computationResultsArray[@]}

