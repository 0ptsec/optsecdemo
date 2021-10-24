# optsecdemo
scripts associated with the sensor webinar

You can download the github repository directly onto the raspberry pi or to another location and copy or paste commands as you go.

The following scripts will need to be modified with the relevant path, ports, and account information nessesary to operate in your environment.
Each script is also documented with further information as to what is needed to fuction:
- iamhere.sh
- system_info_report.sh
- system_info_send.sh
- autossh_connect.sh


The first step would be to follow the numbered order and work your way through each step. All commands have been documented and can be cut and pasted directly into an SSH session to the raspberry pi. 
- 1-sensor_boot_from_SSD.txt
- 2-sensor_manual_cfg_actions.txt
- ***3-run scripts from within the "main_scripts" folder***
- 4-sensor_env_cfg.txt
- 5-sensor_last_items.txt

***NOTES:*** 

***Durring step 3, make sure to start with "main.sh" this will kick off the other scripts so the install and setup are performed in an appropriate order.***

***To make bash scripts executable, make sure to " sudo chmod +x" any ".sh" files OR run the script with "sudo bash" in front of the script.(ex.."sudo bash main.sh")***
***FYI-you may need to supply the absolute path to the scripts while using "sudo"***

***If the bash scripts do not run, or there are symbols not recognized, make sure to check for a potential carraige return issue. This issue arrises when documents are saved on a windows system and then downloaded and run on a linux system. It has to do with CRLF(\r\n) carraige returns and line feeds (windows) vs just LF(\n) line feeds (linux) in text documents. I have setup the directory with an "attributes" file to prevent this durring download, but if there are still carraige return issues, you can fix the document by following the below which should remove the windows carraige returns \r from the file:***
- open the file with vi "vi -b 'filename'"
- get into command mode by pressing ":"
- run the following on the document "%s/\r$//"
- run ":x" to close the document

