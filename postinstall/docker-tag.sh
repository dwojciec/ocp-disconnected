#!/bin/bash
#execution of the oc get service registry to capture the IP of the REGISTRY
export REGISTRY=$(oc get service docker-registry -t '{{.spec.clusterIP}}{{"\n"}}')
echo "DOCKER REGISTRY IP: $REGISTRY"
# tar all images
docker tag registry.access.redhat.com/jboss-webserver-3/webserver30-tomcat7-openshift:latest $REGISTRY:5000/jboss-webserver-3/webserver30-tomcat7-openshift:latest
docker tag registry.access.redhat.com/jboss-webserver-3/webserver30-tomcat7-openshift:1.1 $REGISTRY:5000/jboss-webserver-3/webserver30-tomcat7-openshift:1.1
docker tag registry.access.redhat.com/jboss-eap-7/eap70-openshift $REGISTRY:5000/jboss-eap-7/eap70-openshift
docker tag registry.access.redhat.com/openshift3/nodejs-010-rhel7:v3.3 $REGISTRY:5000/openshift3/nodejs-010-rhel7:v3.3
docker tag registry.access.redhat.com/jboss-webserver-3/webserver30-tomcat8-openshift $REGISTRY:5000/jboss-webserver-3/webserver30-tomcat8-openshift
docker tag registry.access.redhat.com/jboss-eap-6/eap64-openshift $REGISTRY:5000/jboss-eap-6/eap64-openshift
docker tag registry.access.redhat.com/jboss-amq-6/amq62-openshift $REGISTRY:5000/jboss-amq-6/amq62-openshift
docker tag registry.access.redhat.com/jboss-datagrid-6/datagrid65-openshift $REGISTRY:5000/jboss-datagrid-6/datagrid65-openshift 
docker tag registry.access.redhat.com/jboss-decisionserver-6/decisionserver63-openshift $REGISTRY:5000/jboss-decisionserver-6/decisionserver63-openshift 
docker tag registry.access.redhat.com/jboss-processserver-6/processserver63-openshift $REGISTRY:5000/jboss-processserver-6/processserver63-openshift 
docker tag registry.access.redhat.com/jboss-fuse-6/fis-java-openshift:1.0 $REGISTRY:5000/jboss-fuse-6/fis-java-openshift:1.0
docker tag registry.access.redhat.com/jboss-fuse-6/fis-karaf-openshift:1.0-15 $REGISTRY:5000/jboss-fuse-6/fis-karaf-openshift:1.0-15
docker tag registry.access.redhat.com/rhel7/rhel $REGISTRY:5000/rhel7/rhel
docker tag registry.access.redhat.com/redhat-sso-7/sso70-openshift $REGISTRY:5000/redhat-sso-7/sso70-openshift
docker tag registry.access.redhat.com/rhscl/mysql-56-rhel7 $REGISTRY:5000/rhscl/mysql-56-rhel7
docker tag registry.access.redhat.com/rhscl/postgresql-94-rhel7 $REGISTRY:5000/rhscl/postgresql-94-rhel7
docker tag registry.access.redhat.com/cloudforms/cfme4:5.6.2.2-1 $REGISTRY:5000/cloudforms/cfme4:5.6.2.2-1
docker tag registry.access.redhat.com/rhscl/mongodb-26-rhel7 $REGISTRY:5000/rhscl/mongodb-26-rhel7
docker tag registry.access.redhat.com/openshift3/ruby-20-rhel7 $REGISTRY:5000/openshift3/ruby-20-rhel7
docker tag registry.access.redhat.com/openshift3/nodejs-010-rhel7 $REGISTRY:5000/openshift3/nodejs-010-rhel7
docker tag registry.access.redhat.com/openshift3/perl-516-rhel7:v3.3 $REGISTRY:5000/openshift3/perl-516-rhel7:v3.3
docker tag registry.access.redhat.com/openshift3/php-55-rhel7 $REGISTRY:5000/openshift3/php-55-rhel7
docker tag registry.access.redhat.com/openshift3/python-33-rhel7 $REGISTRY:5000/openshift3/python-33-rhel7
docker tag registry.access.redhat.com/openshift3/mysql-55-rhel7 $REGISTRY:5000/openshift3/mysql-55-rhel7
docker tag registry.access.redhat.com/openshift3/postgresql-92-rhel7 $REGISTRY:5000/openshift3/postgresql-92-rhel7
docker tag registry.access.redhat.com/openshift3/mongodb-24-rhel7 $REGISTRY:5000/openshift3/mongodb-24-rhel7
docker tag registry.access.redhat.com/openshift3/jenkins-1-rhel7:v3.3 $REGISTRY:5000/openshift3/jenkins-1-rhel7:v3.3
docker tag registry.access.redhat.com/openshift3/jenkins-slave-maven-rhel7:v3.3 $REGISTRY:5000/openshift3/jenkins-slave-maven-rhel7:v3.3
docker tag registry.access.redhat.com/openshift3/jenkins-slave-nodejs-rhel7:v3.3 $REGISTRY:5000/openshift3/jenkins-slave-nodejs-rhel7:v3.3
docker images | grep $REGISTRY
