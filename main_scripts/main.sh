#!/bin/bash

echo -e "$(tput setaf 3)$(tput bold)===============================Running Main.sh=================================$(tput sgr0)\n"

ls -lah "$@" | grep '.sh'

echo -e "$(tput setaf 3)$(tput bold)****************Ensure scripts 1 - 4 are listed********************$(tput sgr0)\n"
read -n 1 -s -p "$(tput setaf 3)$(tput bold)Press any key to continue or ctrl+c to cancel.$(tput sgr0)"
echo -e "\n"
echo -e "$(tput setaf 3)$(tput bold)=====================done======================$(tput sgr0)\n"

$(sleep 5)

SCRIPT_PATH="$(pwd)/1-update_software_directories.sh"
if [ ! -f $SCRIPT_PATH ]
then
        echo -e "File does not exist!"
else
        echo -e "$(tput setaf 3)$(tput bold)=====================Executing $SCRIPT_PATH=======================$(tput sgr0)\n"

        "$SCRIPT_PATH"
fi
