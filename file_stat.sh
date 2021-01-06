#! /bin/bash

#assignment 1
# Excercise 1 file_stat
# Name: Eoghan O'Connor
# ID: 16110625
# Description:	Displays disk usage, number of files and directories,
#				Retrieves file system information and disk space percentage
#				Checks to see if there is sufficient disk space.
#


#displaying disk usage on home dir sorting in order of biggest to smallest files
#the taking the first and second column to be printed
Biggest_File_size=$(du --max-depth=1 ~/* | sort -n -r | head -1| awk '{print$1}');
Biggest_File_Name=$(du --max-depth=1 ~/* | sort -n -r | head -1| awk '{print$2}');
echo ""
echo " The  Biggest file is $Biggest_File_Name , its size is $Biggest_File_size"

#finding the number of files and number of directories
#Then counting how many there is
No_of_file=$(find  ~/  -type f | wc -l)
No_of_dir=$(find  ~/  -type d | wc -l)

echo ""
echo " The number of files in home  directory is $No_of_file"  
echo ""
echo " The number of directories in home  directory is $No_of_dir"

#retrieving file system info of home dir,
#cutting of headers leaving just top line
#taking just the disk_space percent and 4k block column
disk_space=$(df ~/ |head -2 | tail -1| awk '{print$5}' );
block=$(df ~/ -B4k |head -2 | tail -1| awk '{print$4}' );

echo "Disk space  is $disk_space 4k block $block"

#Checking the size of the 4k block if too big print warning in red.
#if less than 500,000 then print suffiecient in green.
if (("$block" < 5000000));then
echo -e " \e[31mDisk space is running low $disk_space is used"
else echo -e "\e[32mDisk space is sufficient $disk_space is left"
fi

