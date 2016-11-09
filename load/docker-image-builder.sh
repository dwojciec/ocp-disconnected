#!/bin/bash
# usage : docker-image-builder.sh <repository server ip>
# MASTER ONLY
CLUSTER_HOSTS="master1 master2 master3"
DOCK_TAR="ose3-builder-images.tar"
REPOSITORY_SERVER=$1
REPO_URL="http://$REPOSITORY_SERVER/repos/"

for host in $CLUSTER_HOSTS
do
 for FILE_TAR in $DOCK_TAR
 do
   echo "from host : $host"
   echo "Download docker tar from repository servers"  $REPO_URL/$FILE_TAR
# on AWS   ssh -tt ec2-user@$host sudo wget $REPO_URL/$FILE_TAR
   ssh -tt @$host sudo wget $REPO_URL/$FILE_TAR
   echo "Docker load images " $FILE_TAR
# On AWS   ssh -tt ec2-user@$host sudo docker load -i  $FILE_TAR
   ssh -tt $host sudo docker load -i  $FILE_TAR
 done
done
