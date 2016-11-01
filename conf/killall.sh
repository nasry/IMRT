echo Killing all applications on: '192.168.1.60'
#!/bin/bash
cd /home/test/IMRT/conf/
if [ -e ./kill_HarvestControllerApplication_snapshot1.sh ]; then 
      ./kill_HarvestControllerApplication_snapshot1.sh
fi
if [ -e ./kill_HarvestControllerApplication_focused1.sh ]; then 
      ./kill_HarvestControllerApplication_focused1.sh
fi
if [ -e ./kill_HarvestControllerApplication_focused2.sh ]; then 
      ./kill_HarvestControllerApplication_focused2.sh
fi
if [ -e ./kill_HarvestControllerApplication_focused3.sh ]; then 
      ./kill_HarvestControllerApplication_focused3.sh
fi
if [ -e ./kill_HarvestControllerApplication_focused4.sh ]; then 
      ./kill_HarvestControllerApplication_focused4.sh
fi
