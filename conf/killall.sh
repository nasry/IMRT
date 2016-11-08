echo Killing all applications on: '192.168.1.60'
#!/bin/bash
cd /home/test/IMRT/conf/
if [ -e ./kill_HarvestControllerApplication_focused1.sh ]; then 
      ./kill_HarvestControllerApplication_focused1.sh
fi
