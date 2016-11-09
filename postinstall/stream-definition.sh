#!/bin/bash
TEMPLATE_LIST="image-streams-rhel7.json  jboss-image-streams.json"
export REGISTRY=$(oc get service docker-registry -t '{{.spec.clusterIP}}{{"\n"}}')
SERVER_IP=$REGISTRY:5000
for template in $TEMPLATE_LIST
do
  oc delete -n openshift -f $template
  cp $template $template.new
  echo "change 'registry.access.redhat.com' by $SERVER_IP"
  sed -i "s@registry.access.redhat.com@${SERVER_IP}@g" $template.new
  sed -i "s@/rhscl/@/openshift/@g" $template.new
  sed -i "s@/openshift3/@/openshift/@g" $template.new
  sed -i "s@/jboss-webserver-3/@/openshift/@g" $template.new
  sed -i "s@/jboss-eap-6/@/openshift/@g" $template.new
  sed -i "s@/jboss-eap-7/@/openshift/@g" $template.new
  sed -i "s@/jboss-decisionserver-6/@/openshift/@g" $template.new
  sed -i "s@/jboss-processserver-6/@/openshift/@g" $template.new
  sed -i "s@/jboss-datagrid-6/@/openshift/@g" $template.new
  sed -i "s@/jboss-datavirt-6/@/openshift/@g" $template.new
  sed -i "s@/jboss-amq-6/@/openshift/@g" $template.new
  sed -i "s@/redhat-sso-7/@/openshift/@g" $template.new
  echo "Updating $template image streams"
  oc create -f $template.new -n openshift
done
