docker save -o /orange/repos/images/ose3-builder-images.tar \
    registry.access.redhat.com/jboss-webserver-3/webserver30-tomcat7-openshift:latest \
    registry.access.redhat.com/jboss-webserver-3/webserver30-tomcat7-openshift:1.1 \
    registry.access.redhat.com/jboss-eap-7/eap70-openshift \
    registry.access.redhat.com/openshift3/nodejs-010-rhel7:v3.3 \
    registry.access.redhat.com/jboss-webserver-3/webserver30-tomcat8-openshift \
    registry.access.redhat.com/jboss-eap-6/eap64-openshift \
    registry.access.redhat.com/jboss-amq-6/amq62-openshift \
    registry.access.redhat.com/jboss-datagrid-6/datagrid65-openshift \
    registry.access.redhat.com/jboss-decisionserver-6/decisionserver63-openshift \
    registry.access.redhat.com/jboss-processserver-6/processserver63-openshift \
    registry.access.redhat.com/jboss-fuse-6/fis-java-openshift:1.0 \
    registry.access.redhat.com/jboss-fuse-6/fis-karaf-openshift:1.0-15 \
    registry.access.redhat.com/rhel7/rhel \
    registry.access.redhat.com/redhat-sso-7/sso70-openshift \
    registry.access.redhat.com/rhscl/mysql-56-rhel7 \
    registry.access.redhat.com/rhscl/postgresql-94-rhel7 \
    registry.access.redhat.com/cloudforms/cfme4:5.6.2.2-1 \
    registry.access.redhat.com/rhscl/mongodb-26-rhel7 \
    registry.access.redhat.com/openshift3/ruby-20-rhel7 \
    registry.access.redhat.com/openshift3/nodejs-010-rhel7 \
    registry.access.redhat.com/openshift3/perl-516-rhel7:v3.3 \
    registry.access.redhat.com/openshift3/php-55-rhel7 \
    registry.access.redhat.com/openshift3/python-33-rhel7 \
    registry.access.redhat.com/openshift3/mysql-55-rhel7 \
    registry.access.redhat.com/openshift3/postgresql-92-rhel7 \
    registry.access.redhat.com/openshift3/mongodb-24-rhel7 \
    registry.access.redhat.com/openshift3/jenkins-1-rhel7:v3.3 \
    registry.access.redhat.com/openshift3/jenkins-slave-maven-rhel7:v3.3 \
    registry.access.redhat.com/openshift3/jenkins-slave-nodejs-rhel7:v3.3
while true; do
read -p "remove docker image ?" yn
    case $yn in
[Yy]* ) docker rmi $(docker images -q); break;;
[Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
