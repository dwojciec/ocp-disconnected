#!/bin/bash
#execution of the oc get service registry to capture the IP of the REGISTRY
export REGISTRY=$(oc get service docker-registry -t '{{.spec.clusterIP}}{{"\n"}}')
echo "DOCKER REGISTRY IP: $REGISTRY"
# tar all images
docker pull $REGISTRY:5000/jboss-webserver-3/webserver30-tomcat7-openshift:latest
docker pull $REGISTRY:5000/jboss-webserver-3/webserver30-tomcat7-openshift:1.1
docker pull $REGISTRY:5000/jboss-eap-7/eap70-openshift
docker pull $REGISTRY:5000/openshift3/nodejs-010-rhel7:v3.3
docker pull $REGISTRY:5000/jboss-webserver-3/webserver30-tomcat8-openshift
docker pull $REGISTRY:5000/jboss-eap-6/eap64-openshift
docker pull $REGISTRY:5000/jboss-amq-6/amq62-openshift
docker pull $REGISTRY:5000/jboss-dapullrid-6/dapullrid65-openshift 
docker pull $REGISTRY:5000/jboss-decisionserver-6/decisionserver63-openshift 
docker pull $REGISTRY:5000/jboss-processserver-6/processserver63-openshift 
docker pull $REGISTRY:5000/jboss-fuse-6/fis-java-openshift:1.0
docker pull $REGISTRY:5000/jboss-fuse-6/fis-karaf-openshift:1.0-15
docker pull $REGISTRY:5000/rhel7/rhel
docker pull $REGISTRY:5000/redhat-sso-7/sso70-openshift
docker pull $REGISTRY:5000/rhscl/mysql-56-rhel7
docker pull $REGISTRY:5000/rhscl/postgresql-94-rhel7
docker pull $REGISTRY:5000/cloudforms/cfme4:5.6.2.2-1
docker pull $REGISTRY:5000/rhscl/mongodb-26-rhel7
docker pull $REGISTRY:5000/openshift3/ruby-20-rhel7
docker pull $REGISTRY:5000/openshift3/nodejs-010-rhel7
docker pull $REGISTRY:5000/openshift3/perl-516-rhel7:v3.3
docker pull $REGISTRY:5000/openshift3/php-55-rhel7
docker pull $REGISTRY:5000/openshift3/python-33-rhel7
docker pull $REGISTRY:5000/openshift3/mysql-55-rhel7
docker pull $REGISTRY:5000/openshift3/postgresql-92-rhel7
docker pull $REGISTRY:5000/openshift3/mongodb-24-rhel7
docker pull $REGISTRY:5000/openshift3/jenkins-1-rhel7:v3.3
docker pull $REGISTRY:5000/openshift3/jenkins-slave-maven-rhel7:v3.3
docker pull $REGISTRY:5000/openshift3/jenkins-slave-nodejs-rhel7:v3.3
echo "Checking Docker images $REGISTRY:5000"
docker images | grep $REGISTRY
echo "Verify that all the image streams now have the tags populated"
oc get imagestreams -n openshift
