#########################################################################
# File Name: os_bash.sh
# Author: xiaozhu_9527
# mail: 13478604660@163.com
# Created Time: Fri 08 Apr 2016 07:36:04 PM CST
#########################################################################
#!/bin/bash

reset_terminal=$(tput sgr0)

#get os type
os_type=$(uname -o)
echo -e "\E[32m" "Os Type: " $reset_terminal $os_type

#check os release version
os_release_version=$(cat /etc/issue | grep -e "release")
echo -e "\E[32m" "Release Version: " $reset_terminal $os_release_version 

#check architecture
os_rchitecture=$(uname -m)
echo -e "\E[32m" "Architecture: " $reset_terminal $os_rchitecture 
#kernel version
os_kernel_version=$(uname -r)
echo -e "\E[32m" "Kernel Version: " $reset_terminal $os_kernel_version 

#IP address
ip_addr=$(hostname -I)
echo -e "\E[32m" "Ip Address: " $reset_terminal $ip_addr 

#check DNS
nameservers=$(cat /etc/resolv.conf | egrep "\<nameserver[ ]+" | awk '{print $NF}')
echo -e "\E[32m" "DNS: " $reset_terminal $nameservers 
#check the connect
ping -c 2 16.11.2.138 &> /dev/null && echo 'Internet:connected' || echo 'Internet Disconnect'

#check logged in users
who > /home/who
echo -e "\E[32m" "Logged In Users" $reset_terminal && cat /home/who
rm -f /home/who

#######################################
#show the mem usages
sys_mem_usages=$(awk '/MemTotal/{total_mem=$2}/MemFree:/{free_mem=$2}END{print (total_mem-free_mem)/1024}' /proc/meminfo)
apps_mem_usages=$(awk '/MemTotal/{total_mem=$2}/MemFree:/{free_mem=$2}/^Cached/{cache=$2}/Buffers/{buffer=$2}END{print (total_mem-free_mem-cache-buffer)/1024}' /proc/meminfo)

echo -e "\E[32m" "System Mem Userages" $reset_terminal $sys_mem_usages
echo -e "\E[32m" "Apps Mem Userages" $reset_terminal $apps_mem_usages

#########i#############################
loadaverge=$(top -n 1 -b | grep "load average:" | awk '{print $12 $13 $14}')
echo -e "\E[32m" "Load Averges" $reset_terminal $loadaverge

######################################
disk_usages=$( df -P | egrep -v "Filesystem|tmpfs" | awk 'BEGIN{sum=0}{sum+=$3}END{ print sum/1024/1024}')
echo -e "\E[32m" "Disk Usages" $reset_terminal $disk_usages













