#!/bin/bash

#Modify this script with the appropriate "username", "DNS name and domain","sensorname" and appropriate path for writing.
#Place in the /bin directory or a sub directory of your choosing. If you create a subdirectory, make sure your cron jobs reflect the correct path.

#Define home directory and script path.
OUTFILE_PATH="/home/<username>/sysinfo.out"
SCRIPT_PATH="/bin/system_info_report.sh"

#remove old sysinfo.out file before writing new
rm "$OUTFILE_PATH"

#run report script
"$SCRIPT_PATH"

#send current report to sensor monitor server.
cat "$OUTFILE_PATH" | ssh <username>@<device name>.<domain name> -T "cat > /home/<username>/<sensorname>_system_info_report.txt"
