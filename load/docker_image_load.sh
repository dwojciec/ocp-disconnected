#!/bin/bash
DOCK_TAR="ose3-builder-images.tar ose3-images.tar ose3-logging-metrics-images.tar ose-devgit-images.tar"
REPO_URL="http://10.0.1.212/repos/images"

mkdir -p /tmp/dockerimage
cd /tmp/dockerimage
for FILE_TAR in $DOCK_TAR
do
   echo “Download docker tar from repository servers”  $REPO_URL/$FILE_TAR
   wget $REPO_URL/$FILE_TAR
   echo “Docker load images ” $FILE_TAR
   docker load -i  $FILE_TAR

done
