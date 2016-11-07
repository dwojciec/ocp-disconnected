#!/bin/bash
# usage repo.sh <IP address> : example ./repo.sh 10.0.1.211
SERVER_IP=$1
cp ose.repo.template ose.repo
echo "repository server" $SERVER_IP
sed -i "s@<server_IP>@${SERVER_IP}@g" ose.repo 

