#!/bin/bash
REPO_LIST="rhel-7-server-rpms rhel-7-server-optional-rpms rhel-7-server-extras-rpms rhel-7-server-rh-common-rpms rhel-ha-for-rhel-7-server-rpms rhel-7-server-ose-3.3-rpms rhel-7-server-openstack-8-rpms rhel-7-server-openstack-8-director-rpms"

for repo in $REPO_LIST
do
  echo "decompress : tar xvf  $repo"
  tar xvf $repo
done
