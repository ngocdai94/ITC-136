#!/bin/bash
# Author: Dai Nguyen
# Description: The script will print out user's information, location, and
# sudo privilege.

# Print out user working location
echo ""
workingPath=$(pwd)
#echo "Listing your working directory location. Press enter to proceed"
#read ""
echo "This is your working directory location: $workingPath"

# Print out user name
echo ""
#echo "Listing the current user on this machine"
#read ""
userName=$(whoami)
echo "The current user of this machine is: $userName"


#  Print out user id
echo ""
userID=$(id -u)
echo "Your user id on this machine is: $userID"

# Check if user has sudo privilege
echo ""
isRoot=$(grep 'sudo' /etc/group | awk -F: '{print $4}')
if [ $isRoot == $userName ]; then
	echo "Congratulations, you have root access"
else 
	echo "Sorry, you  don't have root access"
fi

# List all user processes
echo ""
echo "Below is the list all the processes are running on your machine."
echo "To get more information use 'top'"
echo ""
ps aux
