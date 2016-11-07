#!/bin/bash
DATE_SYNCHRO="20160711-1"
REPO_LIST="rhel-7-server-rpms rhel-7-server-extras-rpms rhel-7-server-ose-3.3-rpms"
REPO_FOLDER="/data/repo/$DATE_SYNCHRO"
REPO_CONF="$REPO_FOLDER/local.repo"
mkdir -p $REPO_FOLDER
rm -f $REPO_CONF
for repo in $REPO_LIST
do
  echo "Sync of $repo"
  reposync --gpgcheck -lm --repoid=$repo --download_path=$REPO_FOLDER
  mkdir -p $REPO_FOLDER/$repo
  createrepo -v $REPO_FOLDER/$repo -o $REPO_FOLDER/$repo
done
