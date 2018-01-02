#!/bin/bash

# Author : Volkan Ozer
# Since : 01.01.2018

# check if any argument is given
if [ $# -ge 1 ];
then
	echo "This script does not accept any argument, exiting."
	exit;
fi

echo "Enter file name you want to change it: "
read fileName
if [ -f $fileName ]; 
then
	echo "File $fileName is exists.";
else
	echo "$fileName does not exist, exiting."
	exit;
fi

echo "Enter new name for the file: "
read newFileName

mv $fileName $newFileName
echo "File name is changed."
