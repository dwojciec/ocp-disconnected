docker save -o /orange/repos/images/ose3-logging-metrics-images.tar \
    registry.access.redhat.com/openshift3/logging-deployer \
    registry.access.redhat.com/openshift3/logging-elasticsearch \
    registry.access.redhat.com/openshift3/logging-deployment \
    registry.access.redhat.com/openshift3/logging-kibana \
    registry.access.redhat.com/openshift3/logging-fluentd \
    registry.access.redhat.com/openshift3/logging-auth-proxy \
    registry.access.redhat.com/openshift3/metrics-deployer \
    registry.access.redhat.com/openshift3/metrics-hawkular-metrics \
    registry.access.redhat.com/openshift3/metrics-cassandra \
    registry.access.redhat.com/openshift3/metrics-heapster \
    registry.access.redhat.com/openshift3/logging-curator
while true; do
read -p "remove docker image ?" yn
    case $yn in
[Yy]* ) docker rmi $(docker images -q); break;;
[Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
