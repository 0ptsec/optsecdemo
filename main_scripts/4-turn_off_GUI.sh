#!/bin/bash

echo -e "$(tput setaf 3)$(tput bold)===============================Running turn_off_GUI.sh=================================$(tput sgr0)\n"


sudo echo 'gpu_mem=16' | sudo tee -a /boot/config.txt >/dev/null
sudo update-rc.d lightdm disable
echo -e "$(tput setaf 1)$(tput bold)*****MAKE NOTE OF THE FOLLOWING*****$(tput sgr0)\n"
echo -e "$(tput setaf 1)$(tput bold)Disable desktop in System Options ---> Boot / Auto Logon by selecting B1 - Text console, requiring user to logon.$(tput sgr0)\n"
echo -e "$(tput setaf 1)$(tput bold)You will be asked to Finish and reboot afterwards, say yes to reboot.$(tput sgr0)\n"
read -n 1 -s -r -p "After reading, press any key to continue"
echo -e "\n"
sudo raspi-config

echo "$(tput setaf 3)$(tput bold)===================== All Done======================$(tput sgr0)"

