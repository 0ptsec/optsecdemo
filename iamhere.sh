#!/bin/bash 

#Modify this script with the appropriate "username", "DNS name and domain","sensorname", and appropriate path for writing.
#Place in the /bin directory or a sub directory of your choosing. If you create a subdirectory, make sure your cron jobs reflect the correct path.

#send iamhere message to sensor monitor server.
echo `uname -n`" is here!"`timedatectl | grep "Local time:"` | ssh <username>@<device name>.<domain> -T  "cat >  /home/<username>/<sensorname>_ishere.txt" 

