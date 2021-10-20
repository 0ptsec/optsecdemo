#!/bin/bash 

#Modify this script with the appropriate "username", "DNS name and domain" make sure to pick ports that are not being used by other sensors in your fleet and document appropriately.
#Place in the /bin directory or a sub directory of your choosing. If you create a subdirectory, make sure your cron jobs reflect the correct path.
#Make sure to have generated appropriate rsa keys and setup both monitoring server and sensor to be able to communicate via ssh keys.


#create ssh reverse tunnel in order to access the sensor from the remote monitoring server.
autossh -M 25051 -N -f -o "PubkeyAuthentication=yes" -o "PasswordAuthentication=no" -i ~/.ssh/id_rsa -R 5051:localhost:22 <username>@<dns name>.<domain name> &
