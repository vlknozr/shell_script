#!/bin/bash

# Author : Volkan Ozer
# Since : 01.01.2018
#
# Program encrypts or decrypts files with gpg

# check if any argument is given
if [ $# -ge 1 ];
then
	echo "This script does not accept any argument, exiting."
	exit;
fi

# read if this is an encrypt or a decrypt
echo "Encrypt or decrypt? (encrypt) : ";
read choice;
if [ -z $choice ]; 
	then
	echo "Nothing has choosen, exiting.";
	exit;
fi

# read file name
echo "File name : "
read fileName
if [ -z $fileName ]; 
then
	echo "no file entered, exiting.";
	exit;
fi

# check file's existance
if [ -f $fileName ]; 
then
	echo "File $fileName exists.";
else
	echo "$fileName does not exist.";
	exit;
fi

# function to encrypt given file
encrypt () {
	gpg -e -r dad_580@hotmail.com $1;
	echo "File is encrypted."
}

# function to decrypt given file
decrypt () {
	gpg $1;
	echo "File is decrypted."
	echo "DO NOT FORGET TO DELETE THE DECRYPTED FILES!";
}

# if choice is encrypt, encrypt it
if [[ $choice == "encrypt" ]]; 
then
	encrypt $fileName
else
	decrypt $fileName
fi
