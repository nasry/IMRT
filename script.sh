#!/bin/bash
p1=$1;
p2=$2;
if [ -n "$p1" ] && [ -n "$p2" ]
then
    echo "changing ports ..."
    sed -i "s/8046/$p1/g" /home/test/IMRT/conf/settings_HarvestControllerApplication_focused1.xml;
    sed -i "s/8192/$p2/g" /home/test/IMRT/conf/settings_HarvestControllerApplication_focused1.xml;
    sleep 1 ;
    echo -e "ports changed\n";

    echo "source /etc/profile";
    source /etc/profile;
    sleep 1;
    echo -e "file sourced\n";

    echo "restarting harvester applications";
    /home/test/IMRT/conf/restart.sh;

    echo "Add admin, access-server and bitarkive to /etc/hosts";
    echo -e "192.168.1.51    admin \n192.168.1.52    bitarchieve \n192.168.1.59    access-server" >> /etc/hosts;

    echo "add the container hostname < $HOSTNAME > and its IP in the admin, access-server and bitarvieve to known as harvester";
    ssh test@192.168.1.51 "echo 192.168.1.205    $HOSTNAME >> /etc/hosts";
    ssh test@192.168.1.52 "echo 192.168.1.205    $HOSTNAME >> /etc/hosts";
    ssh test@192.168.1.59 "echo 192.168.1.205    $HOSTNAME >> /etc/hosts";

    echo "DONE";
else
echo "you have to pass two ports as parametres";
echo $HOSTNAME
fi
