#!/bin/bash

# Author : Volkan Ozer
# Since : 01.01.2018
#
# Program converts a number to equivelant of it in another base

# check if any argument is given
if [ $# -ge 1 ];
then
	echo "This script does not accept any argument, exiting."
	exit;
fi

# read base of the number
echo "Enter base of the number (bin, oct, dec, hex) :"
read base
if [ -z $base ]; 
then
	echo "no base entered, exiting.";
	exit;
fi

# which base number in it
if [ "$base" = "bin" ];      #bin
then    
    inType=2
elif [ "$base" = "oct" ];    #oct
then    
    inType=8   
elif [ "$base" = "dec" ];    #dec
then      
    inType=10
elif [ "$base" = "hex" ];    #hex
then    
    inType=16
fi

# read number
echo "Enter a number : "
read number
if [ -z $number ]; 
then
	echo "No number entered, exiting.";
	exit;
fi

# read new base for the number
echo "Enter new base for the number (bin, oct, dec, hex) :                           "
read newBase
if [ -z $newBase ]; 
then
	echo "no base entered, exiting.";
	exit;
fi

# which base wanted to convert the number
if [ "$newBase" = "bin" ]; 
then    
    outType=2
elif [ "$newBase" = "oct" ]; 
then    
    outType=8   
elif [ "$newBase" = "dec" ]; 
then    
    outType=10
elif [ "$newBase" = "hex" ]; 
then    
    outType=16
fi

# conversion
result=$(echo "obase=$outType;ibase=$inType;$number" | bc)
echo $result
