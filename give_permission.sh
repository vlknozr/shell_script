#!/bin/bash

# Author : Volkan Ozer
# Since : 01.01.2018
#
# Program gives permission to a specified file

# check if any argument is given
if [ $# -ge 1 ];
then
	echo "This script does not accept any argument, exiting."
	exit;
fi

echo "Enter a file name : "
read fileName
if [ -f $fileName ]; 
then
	echo "File $fileName is exists.";
else
	echo "$fileName does not exist, exiting."
	exit;
fi

# read permissions for admin
echo "Give Permission For Admin 0-) Nothing 1-) Read 2-) Write 3-) Execute (000, 100, 020, 003...) : "
read admin

array=("${admin:0:1}" "${admin:1:1}" "${admin:2:3}")

sum=0
for i in "${array[@]}"; 
do     
  if [ $i -eq 1 ];
  then
    sum=$((400+$sum));
  elif [ $i -eq 2 ];
  then 
    sum=$((200+$sum));
  elif [ $i -eq 3 ];
  then 
	sum=$((100+$sum)) ;
  else [ $i -eq 0 ];
    sum=$((0+$sum));
  fi
done

# read permissions for group
echo "Give Permission For Group 0-) Nothing 1-) Read 2-) Write 3-) Execute (000, 100, 020, 003...) : "
read group

array=("${group:0:1}" "${group:1:1}" "${group:2:3}")

for i in "${array[@]}"; 
do     
  if [ $i -eq 1 ];
  then
    sum=$((40+$sum))
  elif [ $i -eq 2 ];
  then 
    sum=$((20+$sum))   
  elif [ $i -eq 3 ];
  then 
	sum=$((10+$sum)) 
  else [ $i -eq 0 ];
    sum=$((0+$sum))
  fi
done

# read permissions for others
echo "Give Permission For Others 0-) Nothing 1-) Read 2-) Write 3-) Execute (000, 100, 020, 003...) : "
read other

array=("${other:0:1}" "${other:1:1}" "${other:2:3}")

for i in "${array[@]}";
 do     
  if [ $i -eq 1 ];
  then
    sum=$((4+$sum))
  elif [ $i -eq 2 ];
  then 
    sum=$((2+$sum))   
  elif [ $i -eq 3 ];
  then 
	sum=$((1+$sum)) 
  else [ $i -eq 0 ];
    sum=$((0+$sum))
  fi
done

chmod $sum $fileName

echo "Permissions are given."
