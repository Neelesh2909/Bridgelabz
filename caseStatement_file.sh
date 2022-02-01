#!/bin/bash -x

for item in `ls`
do
   extensionName=`echo $item | awk -F. '{ print $2 }'`
   case $extensionName in
   py)
      echo "$item Is a $extensionName File"
      ;;
   java)
      echo "$item Is a $extensionName File"
      ;;
   sh)
      echo "$item Is a $extensionName File"
      ;;
   js)
      echo "$item Is a $extensionName File"
      ;;
   cs)
      echo "$item Is a $extensionName File"
      ;;
   *)
     echo "Your Given File is Not In Our Bucket :("
     ;;
  esac

done