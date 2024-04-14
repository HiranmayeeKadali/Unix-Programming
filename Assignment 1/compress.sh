#!/bin/bash

file=$1 #takes file name as input from user

7z a $file.7z $file &  #using p7zip to compress file
gzip -k $file &        #using gzip to compress file
bzip2 -k $file &       #using bzip2 to compress file
lzop $file &           #using lzop to compress file

wait
 

gz_file=$(ls -l $file.gz | awk '{print $5}')    #retrieves size of gzip compressed file
lzop_file=$(ls -l $file.lzo | awk '{print $5}') #retrieves size of lzop compressed file
bz2_file=$(ls -l $file.bz2 | awk '{print $5}')  #retrieves size of bzip2 compressed file
org_file=$(ls -l $file | awk '{print $5}')      #retrieves size of original file
a=$(ls -l $file.7z | awk '{print $5}')          #retreives size of p7zip compressed file


if [ $gz_file -lt $org_file ] && [ $gz_file -lt $bz2_file ] && [ $gz_file -lt $lzop_file ] && [ $gz_file -lt $a ]; #checks if gzip compressed file is lesser than all other compressed versions and removes all other files
then
    echo "Most compression obtained with gzip. Compressed file is $file.gz"
    rm $file.lzo
    rm $file.bz2
    rm $file
    rm $file.7z
elif [ $lzop_file -lt $gz_file ] && [ $lzop_file -lt $bz2_file ] && [ $lzop_file -lt $org_file ] && [ $lzop_file -lt $a ]; #checks if lzop compressed file is lesser than all other compressed versions and removes all other files
then
    echo "Most compression obtained with lzop. Compressed file is $file.lzo"
    rm $file.gz
    rm $file.bz2
    rm $file
    rm $file.7z
elif [ $bz2_file -lt $gz_file ] && [ $bz2_file -lt $lzop_file ] && [ $bz2_file -lt $org_file ] && [ $bz2_file -lt $a ]; #checks if bzip2 compressed file is lesser than all other compressed versions and removes all other files
then
    echo "Most compression obtained with bzip2. Compressed file is $file.bz2"
    rm $file.gz
    rm $file.lzo
    rm $file
    rm $file.7z
elif [ $org_file -lt $gz_file ] && [ $org_file -lt $lzop_file ] && [ $org_file -lt $bz2_file ] && [ $org_file -lt $a ];#checks if original file is lesser than all other compressed versions and removes all other files
then
    echo "Original file size is lesser than all the compressed files. Original file is retained."
    rm $file.gz
    rm $file.bz2
    rm $file.lzo
    rm $file.7z
elif [ $a -lt $gz_file ] && [ $a -lt $bz2_file ] && [ $a -lt $lzop_file ] && [ $a -lt $org_file ]; #checks if p7zip compressed file is lesser than other files and removes all other files
then
    echo "Most compression obtained with p7zip. Compressed file is $file.7z"
    rm $file.gz
    rm $file.bz2
    rm $file.lzo
    rm $file
fi


