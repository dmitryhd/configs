#!/bin/bash

# Script for deploying NMS to control server.
# Written by Dmitry Khodakov. 13.11.2013

red='\e[0;31m'
green='\e[0;32m'
NC='\e[0m' # No Color

now=$(date +"%m_%d_%Y_%H_%M_%S")
echo -e "${green}Backuping old NMS folder to backup/NMS_$now${NC}"
sshpass -p 111111 ssh user@192.168.1.1 -t "cp -rf NMS/ backup/NMS_$now" 2> /dev/null

echo -e "${green}Deleting old NMS folder${NC}"
sshpass -p 111111 ssh user@192.168.1.1 -t 'rm -rf NMS/' 2> /dev/null

echo -e "${green}Copying new NMS folder${NC}"
sshpass -p 111111 scp -r ../NMS user@192.168.1.1:/home/user/ 2> /dev/null
sshpass -p 111111 ssh user@192.168.1.1 -t 'cp NMS/nms_app/server_local_settings.py NMS/nms_app/local_settings.py' 2> /dev/null

echo -e "${green}Killing python3${NC}"
sshpass -p 111111 ssh user@192.168.1.1 -t 'killall python3' 2> /dev/null
echo -e "${green}Running new collector${NC}"
sshpass -p 111111 ssh user@192.168.1.1 -t 'cd /home/user/NMS/scripts; bash ./collector_watchdog.sh;' 2> /dev/null
echo -e "${green}restarting apache${NC}"
sshpass -p 111111 ssh root@192.168.1.1 -t 'service httpd restart' 2> /dev/null

echo -e "${green}Chmod cur_pic...${NC}"
sshpass -p 111111 ssh root@192.168.1.1 -t 'chmod a+rw /home/user/NMS/nms_app/static/cur_pic.png' 2> /dev/null

echo -e "${red}-------------------------${NC}"
echo -e "${green}Deploy finished${NC}"
