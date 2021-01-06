#! /bin/bash

#assignment 1
# Excercise 3 load_reduce
# Name: Eoghan O'Connor
# ID: 16110625
#Description: Displays number of processes of each user on your pc
#				Displays busiest user to the least busiest		  
#				Terminates any process using over 60& CPU.
#

#Retrieving the number of processes.
proc=$(ps -au| tail -n +2|head -n -4| wc -l);

echo "Number of processes running: $proc"

#Display no. of process for each user

#Make List of all users on a file
ps aux| awk '$1 !="USER" {print$1}'> names

#Make an unique file of users in a file
sort names | uniq> uniq_list

#Make simple column titles
echo -e "\nProcs \t Users \n"

#Loop to read each user name and count no. of entries
while read xuser
do
x=$(grep "$xuser" names | wc -l)
echo -e "$x \t $xuser"
done < uniq_list

#echo new line and exit
echo -e "\n"

#remove any temporary files
rm names uniq_list


#Retrieving the busiest user by sorting all the users
#by the highest to lowest amount of cpu used.
Busiest_user=$(ps -aux | sort -rnk3 | head -1 | awk ' {print$1}');
Busiest_CPU=$(ps -aux | sort -rnk3 | head -1 | awk ' {print$3}');
echo " The busiest user is $Busiest_user CPU usage: $Busiest_CPU %"

#Killed process

#rounding cpu value
rounded=$(echo $Busiest_CPU | sed 's/\..$//')

#Getting PID of busiest user
Busiest_PID=$(ps -aux | sort -rnk3 | head -1 | awk ' {print$2}');

#Killing any process over 60% CPU
if (( $rounded > 60 ));then
echo " killing $Busiest_user as it is over 50%"
kill $Busiest_PID
fi



