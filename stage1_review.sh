#!/bin/bash -x

#echo "Creating the files in stage1_review directory"
touch Add.java Sub.js Multiply.py Division.cs
for file in `ls -p | grep -v / | grep -v .sh`
do
	folderName=`echo $file | awk -F. '{print $1}'`
	subfolderName=`echo $file | awk -F. '{print $2}'`
	#echo "checking for already existing directory ${folderName}/${subfolderName}"
	if [ -d $folderName/$subfolderName ]
	then
		rm -r $folderName
	fi
	#echo "creating folder ${folderName}/{subfolderName}"
	mkdir -p $folderName/$subfolderName
	#echo "moving ${file} to ${folderName}/${subfolderName}"
	mv $file ./$folderName/$subfolderName
done
