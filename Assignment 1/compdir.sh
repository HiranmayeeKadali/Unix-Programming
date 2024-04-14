#!/bin/bash

directory=$1 #Takes input as directory from the user

if [ -z "$directory" ]; #checks if no argument is given and returns a warning message
then
	echo "No arguments given! Give a directory as input"

else

	if [ -e "$directory" ]; #checks if directory exists
	then
		if [ -w "$directory" ]; #checks for writable permission in current directory
		then
			echo ""
		else
			echo "cannot write compressed file to current directory"
		fi

		size="$(du -m $directory | cut -f1)" #using du command to get size of the directory
		if [ $size -gt 512 ]; #checks if the size of the directory greater than 512MB and returns a warning message if exceeds
		then
			echo "Warning: the directory is $size MB. Proceed? [y/n]" #Asks the user to proceed forward or not
			read inp #takes input from user
			if [ $inp == "y" ]; #executes if y is given as input
			then
				tar -czf $directory.tgz $directory
				echo "Directory $directory archived as $directory.tgz"
			else #terminates the execution if n or any other is given as input
				exit
			fi
		else #if the file size doesn't exceeds 512MB compresses directly without asking the user
			tar -czf $directory.tgz $directory
			echo "Directory $directory archived as $directory.tgz"
		fi
	else #returns a warning message if the directory doesn't exist
		echo "Cannot find directory $directory"
	fi
fi	
