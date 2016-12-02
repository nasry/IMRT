#!/bin/bash


cd /home/test/IMRT/harvester_focused/$1/;
while [ ! -f crawler-beans.cxml ];
do
 sleep 0.1;
done
sed -i 's/<property name="compress" value="false"\/>/<property name="compress" value="true"\/>/g' crawler-beans.cxml;
