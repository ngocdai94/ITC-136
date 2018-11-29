#!/bin/bash
# Filename: installScript.sh
# Author: Dai Nguyen
# Description: This script will install the "gitSetup.sh" to the
# appropriate location, "/usr/local/bin"

# ASSUMPTIONS:
# The "gitSetup.sh" is located on the desktop.
# No icon image is needed.

# Constant
readonly TEXT_ENTRY="
[Desktop Entry]
Version=0.1
Name=GitInstall
Comment=Git Install Script
Exec=/usr/bin/gnome-terminal -e 'bash -c '/usr/local/bin/gitInstall; bash''
#Icon=/home/dainguyen/Desktop/desk_icon.png
Terminal=false
Type=Application
Categories=Ultility;Application;"

# Get to Desktop folder
cd ~
cd Desktop/

# Create an executable desktop file
touch gitSetup.desktop
echo "$TEXT_ENTRY" > gitSetup.desktop

# Notify user that they will need to enter their root password
echo ""
echo "You may be asked to enter sudo passowrd."

# Install the script to the appropriate location
sudo chmod +x gitSetup.desktop
sudo cp gitSetup.sh /usr/local/bin/gitInstall
sudo chmod +x /usr/local/bin/gitInstall

echo ""
echo "Congratulations, you can now use the GitInstall on the Desktop!"
