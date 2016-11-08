#!/bin/bash
cd /home/test/IMRT/conf/
echo Starting all applications on: '192.168.1.60'
if [ -e ./start_HarvestControllerApplication_focused1.sh ]; then 
      ./start_HarvestControllerApplication_focused1.sh
fi






