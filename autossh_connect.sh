#!/bin/bash 

#Modify this script with the appropriate "username", "DNS name and domain" make sure to pick ports that are not being used by other sensors in your fleet and document appropriately.
#Place in the /bin directory or a sub directory of your choosing. If you create a subdirectory, make sure your cron jobs reflect the correct path.
#Make sure to have generated appropriate rsa keys and setup both the monitoring server and sensor to be able to communicate via ssh keys.
#
#The -M option is a monitoring option. This option uses 2 ports, the one you choose as and the next port up. ex. 25051 and 25052. 
#     Some use -M 0 to turn off the feature and allow the native ssh monitoting to take care of that. I have not found this to be reliable.
#The -R option tells autossh to setup a reverse tunnel and use 5051 on the monitoring servers localhost to map to port 22.  
#The -o are alternate options to tell autossh to not ask for passwords and utilize public keys.
#The -f option tells autossh to drop to the background before running ssh.
#The -N option is used to tell autossh to not execute remote commands, just forward ports.


#create ssh reverse tunnel in order to access the sensor from the remote monitoring server.
autossh -M 25051 -N -f -o "PubkeyAuthentication=yes" -o "PasswordAuthentication=no" -i ~/.ssh/id_rsa -R 5051:localhost:22 <username>@<dns name>.<domain name> &
