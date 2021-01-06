#! /bin/bash

# assignment 1.
# Excercise 2 sys_info
# Name: Eoghan O'Connor
# ID: 16110625
# Description: Prints details of the Pc
#			   The number of system paritions	
#			   Displays available disc space
#			   Prints CPU model name,speed and cache size
#			   Prints memory information.

# Print the User, User ID, Host Name and Machine Type
echo "The current user is: $USER"
echo "The current user id is: $UID"
echo "The current host is: $HOSTNAME"
echo "The current machine is: $XDG_CURRENT_DESKTOP"
echo ""

# Print number of file system partitions,
# available disk space and percentage of used space from sys info
num_part=$(df | tail -n+2 | wc -l)
echo "Number of partions: $num_part"

#Retrieving Available space from sys info
home_space=$(df ~/ -h | tail -n 1 | awk '{print$4}')
echo "Home partion space is: $home_space"

#Percent of used space from sys info
home_percent=$(df . -h | tail -n 1 | awk '{print$5}')
echo "Home's used space is: $home_percent %"

echo ""

# Look from the following in file proc/cpuinfo
# then Print:CPU model name, CPU speed, CPU cahce size
model=$(grep "model name" /proc/cpuinfo | tail -n 1)
echo "$model"

cpu_speed=$(grep "cpu MHz" /proc/cpuinfo | tail -n 1)
echo "The : $cpu_speed"

cpu_cache=$(grep "cache size" /proc/cpuinfo | tail -n 1)
echo "The CPU cache is: $cpu_cache"
echo ""

# Print Total memory size from proc/meminfo/
total=$(grep "MemTotal" /proc/meminfo)
echo "The total memory for this device is: $total"

#Get size of free memory from /proc/meminfo
freeSpace=$(grep "MemFree" /proc/meminfo)
echo "The free memory for this device is: $freeSpace"
