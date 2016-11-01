echo Starting linux application: HarvestControllerApplication_snapshot1
cd /home/test/IMRT
PIDS=$(ps -wwfe | grep dk.netarkivet.harvester.heritrix3.HarvestControllerApplication | grep -v grep | grep /home/test/IMRT/conf/settings_HarvestControllerApplication_snapshot1.xml | awk "{print \$2}")
if [ -n "$PIDS" ] ; then
    echo Application already running.
else
    export CLASSPATH=/home/test/IMRT/lib/netarchivesuite-monitor-core.jar:/home/test/IMRT/lib/netarchivesuite-heritrix3-controller.jar:$CLASSPATH;
    java -Xmx1536m  -Ddk.netarkivet.settings.file=/home/test/IMRT/conf/settings_HarvestControllerApplication_snapshot1.xml -Dlogback.configurationFile=/home/test/IMRT/conf/logback_HarvestControllerApplication_snapshot1.xml dk.netarkivet.harvester.heritrix3.HarvestControllerApplication < /dev/null > start_HarvestControllerApplication_snapshot1.log 2>&1 &
fi
