!#bin/bash

echo  -e "\e[36m how much disk space has been used?"
df -h
echo ""
echo ""
echo ""

echo -e  "\e[36m how much RAM memory is free?"
free -h
echo ""
echo ""
echo ""

echo -e "\e[36m how many connections there are to the current machine?"
netstat
echo ""
echo ""
echo ""
 
echo -e "\e[36m who is logged in?"
who 

echo ""
echo ""
echo ""

