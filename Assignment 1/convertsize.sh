#!/bin/bash

size=$1 #taking input from user

a=1024
b=$((1024*1024))
c=$((1024*1024*1024))

if [ ${size: (-2)} == "KB" ]; #executes the block if the given user input is in KB format
then
	length=${#size}-2 #length of the entire user input
	number=${size:0:$length} #extracting the number by excluding the size format
	B=$((number * a))
	KB=$number
	echo "Bytes = $B"
	echo "Kilobytes = $KB"
	printf "Megabytes = "
	echo "scale=2; $number / $a" | bc #performing division using bc command and specifying decimal precision
	printf "Gigabytes = "
	echo "scale=4; $number / $b" | bc

elif [ ${size: (-2)} == "MB" ]; #executes the block if the given user input is in MB format
then    
	length=${#size}-2
	number=${size:0:$length}
	MB=$number
	KB=$((number*a))
	B=$((KB*a))
    echo "Bytes = $B"
	echo "Kilobytes = $KB"
	echo "Megabytes = $MB"
	printf "Gigabytes = "
	echo "scale=4; $number / $a" |bc

elif [ ${size: (-2)} == "GB" ]; #executes the block if the given user input is in GB format
then
	length=${#size}-2
	number=${size:0:$length}
	GB=$number
	MB=$((number*a))
	KB=$((MB*a))
	B=$((KB*a))
    echo "Bytes = $B"
	echo "Kilobytes = $KB"
	echo "Megabytes = $MB"
	echo "Gigabytes = $GB"

elif [ ${size: (-1)} == "B" ]; #executes the block if the given user input is in Bytes
then
	length=${#size}-1
	number=${size:0:$length}
	B=$number
	echo "Bytes = $B"
	printf "Kilobytes = "
	echo "scale=4; $number / $a" | bc
	printf "Megabytes = "
	echo "scale=4; $number / $b" | bc
	printf "Gigabytes = "
	echo "scale=4; $number / $c" | bc

else #executes and returns a warning message if the input given is invalid
	echo "Invalid input"
fi