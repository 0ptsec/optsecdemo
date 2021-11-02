#!/bin/bash

echo -e "$(tput setaf 3)$(tput bold)===============================Running install_ja3_plugin.sh=================================$(tput sgr0)\n"

local_path=/usr/share/bro/site/

sudo mkdir -p $local_path/ja3/

for one_file in __load__.bro intel_ja3.bro ja3.bro ja3s.bro ; do
        if [ ! -e $local_path/ja3/$one_file ]; then
                sudo curl -sSL "https://raw.githubusercontent.com/salesforce/ja3/cb29184df7949743c64fcb190c902dfe72523e38/bro/$one_file" -o "$local_path/ja3/$one_file"
        fi
done

if ! grep -q '^[^#]*@load \./ja3' $local_path/local.bro ; then
        echo '' | sudo tee -a $local_path/local.bro
        echo '#Load ja3 support libraries' | sudo tee -a $local_path/local.bro
        echo '@load ./ja3' | sudo tee -a $local_path/local.bro
fi

echo -e "$(tput setaf 3)$(tput bold)=====================done======================$(tput sgr0)\n"
read -n 1 -s -r -p "$(tput setaf 3)$(tput bold)Press any key to continue to script 4 or ctrl+c to cancel.$(tput sgr0)"
echo -e "\n"
SCRIPT_PATH="$(pwd)/4-turn_off_GUI.sh"
if [ ! -f $SCRIPT_PATH ]
then
       echo "File does not exist!"
else
      echo -e "$(tput setaf 3)$(tput bold)=====================Running $SCRIPT_PATH=======================$(tput sgr0)\n"

     "$SCRIPT_PATH"

fi

