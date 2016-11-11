#!/bin/bash



echo "Changing ports ..."

# get the port from kibernates api
app=$(curl -s http://192.168.1.205:8080/api/v1/namespaces/default/pods/$HOSTNAME/ | jq -r '.metadata.labels.app')
p1=$(curl -s http://192.168.1.205:8080/api/v1/namespaces/default/services/$app | jq -r '.spec.ports[0].nodePort')
p2=$(curl -s http://192.168.1.205:8080/api/v1/namespaces/default/services/$app | jq -r '.spec.ports[1].nodePort')

# change ports in harvester java application setting file
sed -i "s/8046/$p1/g" /home/test/IMRT/conf/settings_HarvestControllerApplication_focused1.xml;
sed -i "s/8192/$p2/g" /home/test/IMRT/conf/settings_HarvestControllerApplication_focused1.xml;

# change port in the service
ssh root@192.168.1.205 "kubectl get service/$app -o json  | jq  '.spec.ports[0].port = $p1 | .spec.ports[0].targetPort = $p1 | .spec.ports[1].port = $p2 | .spec.ports[1].targetPort = $p2' > service.json ; kubectl replace  -f service.json"


#echo "Sourcing /etc/profile ...";
#source /etc/profile;



#echo "Restarting harvester applications ...";
#/home/test/IMRT/conf/restart.sh;



echo "Add admin, access-server and bitarkive to /etc/hosts ...";
echo -e "192.168.1.51    admin \n192.168.1.52    bitarchieve \n192.168.1.59    access-server" >> /etc/hosts;


echo "Add the container hostname < $HOSTNAME > and its IP in the admin, access-server and bitarvieve to known as harvester ...";
ssh test@192.168.1.51 "echo 192.168.1.205    $HOSTNAME >> /etc/hosts";
ssh test@192.168.1.52 "echo 192.168.1.205    $HOSTNAME >> /etc/hosts";
ssh test@192.168.1.59 "echo 192.168.1.205    $HOSTNAME >> /etc/hosts";

echo "Start harvester ...";
/home/test/IMRT/conf/startall.sh;
