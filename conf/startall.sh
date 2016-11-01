#!/bin/bash
cd /home/test/IMRT/conf/
echo Starting all applications on: '192.168.1.60'
if [ -e ./start_HarvestControllerApplication_snapshot1.sh ]; then 
      ./start_HarvestControllerApplication_snapshot1.sh
fi
if [ -e ./start_HarvestControllerApplication_focused1.sh ]; then 
      ./start_HarvestControllerApplication_focused1.sh
fi
if [ -e ./start_HarvestControllerApplication_focused2.sh ]; then 
      ./start_HarvestControllerApplication_focused2.sh
fi
if [ -e ./start_HarvestControllerApplication_focused3.sh ]; then 
      ./start_HarvestControllerApplication_focused3.sh
fi
if [ -e ./start_HarvestControllerApplication_focused4.sh ]; then 
      ./start_HarvestControllerApplication_focused4.sh
fi
