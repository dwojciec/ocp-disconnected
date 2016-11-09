#!/bin/bash
CLUSTER_HOSTS="master1 master2 master3 infra1 infra2 node1 node2"

for host in $CLUSTER_HOSTS
do
   echo "From host : $host"
   echo "copy ose.repo into /etc/yum.repos.d directory" 
   scp ose.repo $host:/etc/yum.repos.d/
done
