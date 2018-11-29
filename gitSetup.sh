#!/bin/bash
# Author: Dai Nguyen
# Description: This script will setup the User's GitHub

echo "Hi, we will setup your GitHub Repository!"
echo "Please type your user name (i.e John Smith): "
read userName
 
echo ""
echo "What is your email address?"
read userEmail

echo ""
echo "What is your repository URL?"
read repoURL

# Split string to get the repository name
# source:
# https://serverfault.com/questions/417241/extract-repository-name-from-github-url-in-bash
basename=$(basename $repoURL)
repoName=${basename%.*}

# Change directory to the repository
cd $repoName/ 

# Setup username and email address in that directory
git config --local user.name $userName
git config --local user.email $userEmail 

# Congratulations message
echo "Congratulations, your git repository has been setup!"
