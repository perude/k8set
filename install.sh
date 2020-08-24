#!/bin/bash
# This script will create alias for k8set.sh script

shopt -s expand_aliases

current_folder=$(pwd)

if grep -q "k8set" ~/.bash_profile
then
    echo "Alias was installed previously, so we will remove old alias."
    sed -i '' '/k8set/d' ~/.bash_profile
fi

if [[ -n "$1" ]] && [[ "$1" = "remove" ]] 
then
    echo "You have executed script with following param : $1, so script after removal of alias it will just exit."
    exit 0
fi    

installation_str="alias k8set=\". $current_folder/k8set.sh\""
echo "Alias will be installed now by adding $installation_str to .bash_profile."
echo "$installation_str" >> ~/.bash_profile
echo "Alias has been installed."

echo "We will define alias for session."
alias k8set=". $current_folder/k8set.sh"
alias | grep "k8set"
echo "Alias for session was defined."

echo "Script has been finished."