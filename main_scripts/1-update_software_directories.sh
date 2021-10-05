#!/bin/bash

echo -e "$(tput setaf 3)$(tput bold)===============================Running update_software_directories.sh=================================$(tput sgr0)\n"

$(sleep 5)

echo -e "$(tput setaf 1)$(tput bold)This script is only to be run after all phiysical hardware has been assembled and the device set to boot from the SSD!$(tput sgr0)\n"
read -n 1 -s -r -p "$(tput setaf 1)$(tput bold)Press any key to continue or ctrl+c to cancel$(tput sgr0)"

echo -e "\n"

HWD=$(pwd)

echo -e "$(tput setaf 3)$(tput bold)=========================Updating System and installing packages=====================================$(tput sgr0)\n"

sudo apt-get update
sudo apt-get -y full-upgrade
sudo apt-get install -y rpi-eeprom rpi-eeprom-images apg lshw bro broctl bro-aux i2c-tools python3-pil python3-pip rsync screen tcpdump uhubctl

echo -e "$(tput setaf 3)$(tput bold)=========================done - Packages installed=====================================$(tput sgr0)\n"

sudo apt list rpi-eeprom rpi-eeprom-images apg lshw bro broctl bro-aux i2c-tools python3-pil python3-pip rsync screen tcpdump uhubctl | sudo tee "$HWD/software_installed.txt"


echo -e "$(tput setaf 3)$(tput bold)=========================Creating directory structure=====================================$(tput sgr0)\n"
sudo mkdir -p /opt/bro/logs/ /opt/bro/pcaps/ /opt/bro/passerlogs
cd /opt/bro
sudo ln -sf /etc/bro/ etc

echo -e "$(tput setaf 3)$(tput bold)=========================done - directories created=====================================$(tput sgr0)\n"

ls -lah /opt/bro "$@"

cd $HWD


echo "$(tput setaf 3)$(tput bold)=====================done======================$(tput sgr0)"
read -n 1 -s -r -p "$(tput setaf 3)$(tput bold)Press any key to continue to script 2 or ctrl+c to cancel.$(tput sgr0)"

SCRIPT_PATH="$(pwd)/2-configure_bro.sh"
echo "THE PATH IS SET TO $SCRIPT_PATH"
if [ ! -f $SCRIPT_PATH ]
then
       echo "File does not exist!"
else
      echo "$(tput setaf 3)$(tput bold)=====================Running $SCRIPT_PATH=======================$(tput sgr0)"

     "$SCRIPT_PATH"

fi