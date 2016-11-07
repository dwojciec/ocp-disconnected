docker save -o /orange/repos/images/ose3-images.tar \
    registry.access.redhat.com/openshift3/ose-haproxy-router \
    registry.access.redhat.com/openshift3/ose-deployer \
    registry.access.redhat.com/openshift3/ose-sti-builder \
    registry.access.redhat.com/openshift3/ose-docker-builder \
    registry.access.redhat.com/openshift3/ose-pod \
    registry.access.redhat.com/openshift3/ose-docker-registry \
    registry.access.redhat.com/openshift3/node \
    registry.access.redhat.com/openshift3/openvswitch \
    registry.access.redhat.com/openshift3/ose \
    registry.access.redhat.com/openshift3/ose-egress-router \
    registry.access.redhat.com/openshift3/ose-f5-router \
    registry.access.redhat.com/openshift3/ose-recycler
while true; do
read -p "remove docker image ?" yn
    case $yn in
[Yy]* ) docker rmi $(docker images -q); break;;
[Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
