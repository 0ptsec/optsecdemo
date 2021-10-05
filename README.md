# optsecdemo
scripts associated with the sensor webinar

You can download the github directory directly onto the raspberry pi or to another location and copy or paste commands as you go.

The following scripts will need to be modified with the relevant path, ports, and account information nessesary to operate in your environment.
Each script is also documented with further information as to what is needed to fuction:
- iamhere.sh
- system_info_report.sh
- system_info_send.sh
- autossh_connect.sh


The first step would be to follow the numbered order and work your way through each txt file. All commands have been documented and can be cut and pasted directly into an SSH session to the raspberry pi. 
- 1-sensor_boot_from_SSD.txt
- 2-sensor_manual_cfg_actions.txt
- ***3-run scripts from withing the "main_scripts" folder***
- 4-sensor_env_cfg.txt
- 5-sensor_last_items.txt

***NOTE:*** 

***Durring step 3, make sure to start with "main.sh" this will kick off the other scripts so the install and setup are perfromed in an appropriate order.***

***To make bash scripts executable, make sure to " sudo chown +x" any ".sh" files OR run the script with "sudo bash" in front of the script.(ex.."sudo bash main.sh")***
***FYI-you may need to supply the absolute path to the scripts while using "sudo"***
