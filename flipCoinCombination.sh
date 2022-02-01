#!/bin/bash -x

read -p "Enter number of times to flip a combination : " numberOfFlips

#In all case Heads-->0
#In all case Tails-->1

function flipCoinWinner(){
	local -n keys=$1
	local -n values=$2
	max_value=0
	max_value_index=0
	for(( i=0; i<${#values[@]}; i++ ))
	do
		if(( values[i] >= max_value ))
		then
			max_value=${values[i]}
			max_value_index=$i
		fi
	done
	echo "The winning combination is ${keys[$max_value_index]} with ${max_value}%"
}

echo "SINGLET-COMBINATION";

declare -A singletFreq
singletFreq[H]=0
singletFreq[T]=0

for(( flip=1; flip<=numberOfFlips; flip++ ))
do
	echo -n "Flip-$flip is "
	coinValue=$(( RANDOM%2 ))
	if [ $coinValue -eq 0 ]
	then
		echo "Heads";
	(( singletFreq[H]++ ))
	else
		echo "Tails";
	(( singletFreq[T]++ ))
	fi
done

for key in ${!singletFreq[@]}
do
	percentage=$(( ${singletFreq[$key]}*100/numberOfFlips ))
	singletFreq[$key]=$percentage
	echo "Percentage of $key is ${singletFreq[$key]}%"
done



echo "DOUBLET-COMBINATION"

declare -A doubletFreq
doubletFreq[HH]=0
doubletFreq[HT]=0
doubletFreq[TH]=0
doubletFreq[TT]=0

for(( flip=1; flip<=numberOfFlips; flip++ ))
do
	echo -n "Flip-$flip is "
        coin_1_Value=$(( RANDOM%2 ))
	coin_2_Value=$(( RANDOM%2 ))
	if [[ $coin_1_Value -eq 0 && $coin_2_Value -eq 0 ]]
	then
		echo "Heads Heads";
	(( doubletFreq[HH]++ ))
	elif [[ $coin_1_Value -eq 0 && $coin_2_Value -eq 1 ]]
	then
		echo "Heads Tails";
	(( doubletFreq[HT]++ ))
	elif [[ $coin_1_Value -eq 1 && $coin_2_Value -eq 0 ]]
	then
		echo "Tails Heads";
	(( doubletFreq[TH]++ ))
	else
		echo "Tails Tails";
	(( doubletFreq[TT]++ ))
	fi
done

for key in ${!doubletFreq[@]}
do
	percentage=$(( ${doubletFreq[$key]}*100/numberOfFlips ))
	doubletFreq[$key]=$percentage
	echo "Percentage of $key is ${doubletFreq[$key]}%"
done



echo "TRIPLET-COMBINATION"

declare -A tripletFreq
tripletFreq[HHH]=0
tripletFreq[HHT]=0
tripletFreq[HTH]=0
tripletFreq[HTT]=0
tripletFreq[THH]=0
tripletFreq[THT]=0
tripletFreq[TTH]=0
tripletFreq[TTT]=0

for(( flip=1; flip<=numberOfFlips; flip++ ))
do
	echo -n "Flip-$flip is "
        coin_1_Value=$(( RANDOM%2 ))
	coin_2_Value=$(( RANDOM%2 ))
	coin_3_Value=$(( RANDOM%2 ))
	
	case $coin_1_Value$coin_2_Value$coin_3_Value in
		000)
			echo "Heads Heads Heads";
			(( tripletFreq[HHH]++ ))
		;;
		001)
			echo "Heads Heads Tails";
			(( tripletFreq[HHT]++ ))
		;;
		010)
			echo "Heads Tails Heads";
			(( tripletFreq[HTH]++ ))
		;;
		011)
			echo "Heads Tails Tails";
			(( tripletFreq[HTT]++ ))
		;;
		100)
			echo "Tails Heads Heads";
			(( tripletFreq[THH]++ ))
		;;
		101)
			echo "Tails Heads Tails";
			(( tripletFreq[THT]++ ))
		;;
		110)
			echo "Tails Tails Heads";
			(( tripletFreq[TTH]++ ))
		;;
		111)
			echo "Tails Tails Tails";
			(( tripletFreq[TTT]++ ))
		;;
	esac
done

for key in ${!tripletFreq[@]}
do
	percentage=$(( ${tripletFreq[$key]}*100/numberOfFlips ))
	tripletFreq[$key]=$percentage
	echo "Percentage of $key is ${tripletFreq[$key]}%"
done


singlet_combination=( ${!singletFreq[@]} )
singlet_percentages=( ${singletFreq[@]} )
doublet_combination=( ${!doubletFreq[@]} )
doublet_percentages=( ${doubletFreq[@]} )
triplet_combination=( ${!tripletFreq[@]} )
triplet_percentages=( ${tripletFreq[@]} )

#appending all 3 arrays and assigning into other array
total_combinations+=( ${singlet_combination[@]} ${doublet_combination[@]} ${triplet_combination[@]} )
total_percentage+=( ${singlet_percentages[@]} ${doublet_percentages[@]} ${triplet_percentages[@]} )

echo "Sorting"
echo "Sorted singlet percentages :"
echo "$( printf "%s\n" "${singlet_percentages[@]}" | sort -n) "

echo "Sorted doublet percentages :"
echo "$( printf "%s\n" "${doublet_percentages[@]}" | sort -n) "

echo "Sorted triplet percentages :"
echo "$( printf "%s\n" "${triplet_percentages[@]}" | sort -n) "

echo "WINNERS"
echo "For Singlet Combination"
flipCoinWinner singlet_combination singlet_percentages
echo "For Doublet Combination"
flipCoinWinner doublet_combination doublet_percentages
echo "For Triplet Combination"
flipCoinWinner triplet_combination triplet_percentages
echo "For All Combinations"
flipCoinWinner total_combinations total_percentage
