#! /bin/bash
#
# Author: Nathan Baker <pcnate@gamil.com>
#
# create hidden directory in user's home
# configure npm to use this directory
#

echo -e "\nChecking system\n"

echo -e -n "Checking for node\t\t\t\t"
if type -P "node" &>/dev/null; then
  echo "Yes"
else
  echo "No"
  echo -e "\nPlease install nodejs\n"
  exit 1
fi;

echo -e -n "Checking for npm\t\t\t\t"
if type -P "npm" &>/dev/null; then
  echo "Yes"
else
  echo "No"
  echo -e "\nPlease install nodejs\n"
  exit 1
fi;

echo -e -n "Checking for $HOME/.npm-global\t\t"
if [ -d "$HOME/.npm-global" ]; then
  echo "Yes - skipping"
else
  echo "Created"
  mkdir "$HOME/.npm-global"
fi;

echo -e -n "Checking if PATH already has ~/.npm-global/bin\t"
if grep -Fq ".npm-global" ~/.profile; then
  echo "Yes - skipping"
else
  echo -e "Adding to PATH variable in ~/.profile"

  echo -e "\nPATH=\$PATH:~/.npm-global/bin" >> ~/.profile

  echo -e "Reloading ~/.profile"
  source ~/.profile
fi;

echo -e "\nSetting npm prefix"
npm config set prefix '~/.npm-global'


echo
echo Done
echo Try installing a global package!
echo
echo Report issues with this script to https://github.com/pcnate/npm-configure/issues
echo
