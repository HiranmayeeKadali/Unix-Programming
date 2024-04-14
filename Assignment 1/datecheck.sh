#!/bin/bash

m=$1 #Taking month as input from user
d=$2 #Taking date as input from user
y=$3 #Taking year as input from user

case $m in #checks if given month matches and executes corresponding block of code 

	jan | mar | may | jul | aug | oct | dec | Jan | Mar | May | Jul | Aug | Oct | Dec | JAN | MAR | MAY | JUL | AUG | OCT | DEC)

		if [ $d -lt 32 ]; #checks if number of days are less than 32
		then
			echo "EXISTS! $m $d $y is someone's birthday."
			
		else #executes if days are greater than 31
			echo "BAD INPUT: $m does not have $d days."
		fi
		;;
	
	apr | jun | sep | nov | Apr | Jun | Sep | Nov | APR | JUN | SEP | NOV)

		if [ $d -lt 31 ]; #checks if number of days are less than 31
		then
			echo "EXISTS! $m $d $y is someone's birthday."

		else #executes if days are greater than 30
			echo "BAD INPUT: $m does not have $d days."
		fi
		;;
	
	feb | Feb | FEB | 02)

		if [ $d -lt 29 ]; #checks if number of days are less than 29
		then
			echo "EXISTS! $m $d $y is someone's birthday."

		elif [ $d -gt 29 ]; #checks if number of days are greater than 29
		then
			echo "BAD INPUT: Feb does not have $d days."

		else #executes if days are equalto 29 and checks if the year is leap year or not
			if [[ `expr $y % 4` -eq 0 && `expr $y % 100` -ne 0 ]];
			then
				echo "EXISTS! $m $d $y is someone's birthday."

			elif [[ `expr $y % 100` -eq 0 && `expr $y % 400` -eq 0 ]];
			then
				echo "EXISTS! $m $d $y is someone's birthday."

			else
				echo "BAD INPUT: $m does not have $d days: it is not a leap year."
			fi
		fi
		;;
esac

case $m in #checks if the given month number matches and executes the corresponding block

	01 | 03 | 05 | 07 | 08 | 10 | 12)

		if [ $d -lt 32 ]; #checks if days are less than 32
        then
            echo "EXISTS! $m $d $y is someone's birthday."
        else #executes if days are greater than 31 and returns a warning message with month name
            if [ $m -eq 01 ];
            then
                echo "BAD INPUT: Jan doesn't have $d days."

            elif [ $m -eq 03 ];
            then
                echo "BAD INPUT: Mar doesn't have $d days."

            elif [ $m -eq 05 ];
            then
                echo "BAD INPUT: May doesn't have $d days."

            elif [ $m -eq 07 ];
            then
                echo "BAD INPUT: Jul doesn't have $d days."

			elif [ $m -eq 08 ];
            then
                echo "BAD INPUT: Aug doesn't have $d days."

			elif [ $m -eq 10 ];
            then
                echo "BAD INPUT: Oct doesn't have $d days."

			elif [ $m -eq 12 ];
            then
                echo "BAD INPUT: Dec doesn't have $d days."
            fi  
        fi
		;;

	04 | 06 | 09 | 11)

		if [ $d -lt 31 ]; #checks if the days are less than 31
		then
            echo "EXISTS! $m $d $y is someone's birthday."
        else #executes if days are greater than 30 and returns a warning message with month name
				if [ $m -eq 04 ];
				then
					echo "BAD INPUT: Apr doesn't have $d days."
			
				elif [ $m -eq 06 ];
                then
                    echo "BAD INPUT: Jun doesn't have $d days."

				elif [ $m -eq 09 ];
                then
                    echo "BAD INPUT: Sep doesn't have $d days."

				elif [ $m -eq 11 ];
                then
                    echo "BAD INPUT: Nov doesn't have $d days."
				fi
            fi
		;;
esac
