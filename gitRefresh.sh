#!/bin/bash
# Author: Dai Nguyen
# Description: The script will refresh git repository status script

# ASSUMPTIONS:
# Assume the user has clone their repository, or they have repository ready
# on their home directory.

# Constant variables
readonly DIR_CLEAN="nothing to commit, working directory clean"
readonly UPDATED="Already up-to-date."
readonly YES="Y"

# Local variables (not necessary, but it is a good practice to declare at the top)
repoName=""
gitStatus=""
userInput=""
commitAsk=false
lastLineGitStatus=""

############################# FUNCTIONS #################################### 
# Git Pull function
# Update current working branch
function gitPull()
{
	git pull origin master
	commitAsk=true
}

# Git Rebase and Git Merge
# Get changes from the master branch to the working branch
function gitRebase()
{
# Get the current git branch
# Source:
# https://stackoverflow.com/questions/6245570/how-to-get-the-current-branch-name-in-git
	currentBranch=$(git branch | grep \* | cut -d ' ' -f2)
	git fetch origin
	git add -A && git commit -m "Updated file and Upload by Bash Script"
	git rebase -p $currentBranch
}

# Commit all changes to the files and push the file to 
# the master branch
function gitUpload()
{
	#git add -A && git commit -m "Updated file and Upload by Bash Script"
	echo "Please enter your Git username and password to upload files."
	git push origin HEAD:master
}
############################### END #########################################

################################# MAIN ######################################
# Ask user for the repository name
echo ""
echo "What is your repository name you want to refresh?"
read repoName

# Change directory to the repository name
cd $repoName/

# Perform a git status check
echo ""
gitStatus=$(git status)

# Get last line of gitStatus
# source:
# https://stackoverflow.com/questions/39615142/bash-get-last-line-from-a-variable
lastLineGitStatus=$(echo "$gitStatus" | tail -n1)

# Call git pull function if the working directory clean
echo ""
if [ "$lastLineGitStatus" == "$DIR_CLEAN" ]; then
	gitPull
else
	gitRebase
fi

# When the commitAsk is true, this means that current directory of user is nothing to update
# Therefore, when running this script for the first time, it won't ask user to commit and
# upload changes.
#
# However, if it is the other case,
# Ask users if they want to commit their files and upload or they want to do it later
if [ $commitAsk != true ]; then
	echo ""
	echo "Do you want to commit and upload changes to the master branch? (Y/N)"
	read userInput

	if [ "$userInput" == "$YES" ] || [ "$userInput" == "${YES,,}" ]; then
		gitUpload
	fi
fi
################################# END ########################################
