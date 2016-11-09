#!/bin/bash
TAR_LIST="ose3-builder-images.tar  projects.tar  rhel-7-server-optional-rpms.tar   rhel-ha-for-rhel-7-server-rpms.tar ose3-images.tar rhel-7-server-extras-rpms.tar rhel-7-server-ose-3.3-rpms.tar scripts.tar ose3-logging-metrics-images.tar  rhel-7-server-openstack-8-director-rpms.tar  rhel-7-server-rh-common-rpms.tar ose-devgit-images.tar rhel-7-server-openstack-8-rpms.tar rhel-7-server-rpms.tar"
REPO_FOLDER="/data/tar/"
REPOSITORY_SERVER=$1
REPO_URL="http://$REPOSITORY_SERVER/repos"

mkdir -p $REPO_FOLDER
cd $REPO_FOLDER
for repo in $TAR_LIST
do
  echo "wget of $repo"
  wget $REPO_URL/$repo
done
