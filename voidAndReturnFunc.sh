#!/bin/bash -x

echo "This is Void Function";
x=20;
y=30;
function add(){
	echo "Addition : $(($1+$2))"
}
add $x $y

echo "******************"

echo "This is Return Function";

function multiply(){
	echo "Multiplication : $(($1*$2))"
}

output="$(multiply $x $y)"
echo $output