echo Killing linux application: HarvestControllerApplication_focused2
#!/bin/bash
PIDS=$(ps -wwfe | grep dk.netarkivet.harvester.heritrix3.HarvestControllerApplication | grep -v grep | grep /home/test/IMRT/conf/settings_HarvestControllerApplication_focused2.xml | awk "{print \$2}")
if [ -n "$PIDS" ] ; then
    kill $PIDS;
fi

sleep 2

PIDS=$(ps -wwfe | grep dk.netarkivet.harvester.heritrix3.HarvestControllerApplication | grep -v grep | grep /home/test/IMRT/conf/settings_HarvestControllerApplication_focused2.xml | awk "{print \$2}")
if [ -n "$PIDS" ] ; then
    kill -9 $PIDS;
fi

PIDS=$(ps -wwfe | grep org.archive.crawler.Heritrix | grep -v grep | grep /home/test/IMRT/conf/settings_HarvestControllerApplication_focused2.xml | awk "{print \$2}")
if [ -n "$PIDS" ] ; then
    kill $PIDS;
fi

sleep 2

PIDS=$(ps -wwfe | grep org.archive.crawler.Heritrix | grep -v grep | grep /home/test/IMRT/conf/settings_HarvestControllerApplication_focused2.xml | awk "{print \$2}")
if [ -n "$PIDS" ] ; then
    kill -9 $PIDS;
fi
