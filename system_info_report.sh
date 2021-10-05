#!/bin/bash

#Modify the below "out_file_path" variable to a location relevant to your system
#keep in mind, this report will be picked up by report_send script, so the paths should match.

out_file_path=/home/<user name>/sysinfo.out

echo -e "**************************************************************************************************" >> $out_file_path
echo -e "*****************SYSTEM INFO:"`hostname``timedatectl | grep 'Local time'`"****************" >> $out_file_path
echo -e "**************************************************************************************************\n" >> $out_file_path

echo -e "\n\n========================================= HOST INFO ==========================================\n" >> $out_file_path
echo -e "\tHostname:\t"`hostname` >> $out_file_path

echo -e "\n\n========================================== OS INFO ===========================================\n" >> $out_file_path
echo -e "\tOS Info:\t"`cat /etc/os-release` >> $out_file_path

echo -e "\n\n======================================== KERNEL INFO =========================================\n" >> $out_file_path
echo -e "\tKernel Version:\t"`uname -r` >> $out_file_path

echo -e "\n\n========================================= CPU INFO ===========================================\n" >> $out_file_path
echo -e "\tTotal Processor:\t"`grep -c 'processor' /proc/cpuinfo` >> $out_file_path
echo -e "\tCPU Processor Model:\t"`awk -F':' '/^model name/ { print $2 }' /proc/cpuinfo` >> $out_file_path
echo -e "\tCPU Processor Speed:\t"`awk -F':' '/^cpu MHz/ { print $2 }' /proc/cpuinfo` >> $out_file_path
echo -e "\tCPU Cache Size:\t"`awk -F':' '/^cache size/ { print $2 }' /proc/cpuinfo`  >> $out_file_path

echo -e "\n\n========================================== RAM INFO ==========================================\n" >> $out_file_path
echo -e "\tMemory(RAM) Info:\t"`free -mht| awk '/Mem/{print " \tTotal: " $2 "\tUsed: " $3 "\tFree: " $4}'`  >> $out_file_path
echo -e "\tSwap Memory Info:\t"`free -mht| awk '/Swap/{print " \t\tTotal: " $2 "\tUsed: " $3 "\tFree: " $4}'` >> $out_file_path

echo -e "\n\n========================================== IP INFO ===========================================\n" >> $out_file_path
ifconfig | grep 'inet' >> $out_file_path

echo -e "\n\n====================================== ROUTE TABLE INFO ======================================\n" >> $out_file_path
 route -n >> $out_file_path

echo -e "\n\n======================================== NETSTAT INFO ========================================\n" >> $out_file_path
echo -e $(netstat -anltp) "\n" >> $out_file_path

echo -e "\n\n====================================== MOUNT POINT INFO ======================================\n" >> $out_file_path
cat /etc/fstab|grep -v "#" >> $out_file_path

echo -e "\n\n==================================== DISK PARTATION INFO =====================================\n" >> $out_file_path
df -h >> $out_file_path

echo -e "\n\n==================================== PHYSICAL VOLUME INFO ====================================\n" >> $out_file_path
lsblk >> $out_file_path

echo -e "\n\n==================================== RUNNING SERVICE INFO ====================================\n" >> $out_file_path
systemctl list-units | grep running|sort >> $out_file_path

echo -e "\n\n==================================== TOTAL RUNNING SERVICE ===================================\n" >> $out_file_path
echo -e "\tTotal Running service:\t"`systemctl list-units | grep running|sort| wc -l` >> $out_file_path

echo -e "\n\n========================================= BOOT INFO ==========================================\n" >> $out_file_path
ls -l /boot|grep -v total >> $out_file_path

echo -e "\n\n====================================== ACTIVE USER INFO ======================================\n" >> $out_file_path
echo -e "\tCurrent Active User:\t"`w | cut -d ' ' -f 1 | grep -v USER | sort -u` >> $out_file_path

echo -e "\n\n====================================== BRO & TCPDUMP STATE INFO ==============================\n" >> $out_file_path
echo -e "\tCurrent bro Worker Status:\t\n" `broctl status`"\n" >> $out_file_path
echo -e "\tCurrent tcpdump Status:\t\n" `ps -ef | grep 'tcpdump'`"\n" >>$out_file_path
echo -e "\n\n======================================== END REPORT ==========================================\n" >> $out_file_path
