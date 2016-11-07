docker save -o /orange/repos/images/ose-devgit-images.tar \
docker.io/jboss/wildfly \
docker.io/gitlab/gitlab-ce:8.13.3-ce.0 \
docker.io/ayufan/gitlab-i2p \
docker.io/openshift/wildfly-100-centos7 \
docker.io/gitlab/gitlab-runner:alpine-v1.7.0-rc.2 \
docker.io/redis:3.2.3-alpine  \
docker.io/openshiftdemos/sonarqube:6.0 \
docker.io/openshiftdemos/gogs \
docker.io/openshiftdemos/nexus:2.13.0-01
while true; do
read -p "remove docker image ?" yn
    case $yn in
[Yy]* ) docker rmi $(docker images -q); break;;
[Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

