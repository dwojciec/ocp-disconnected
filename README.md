# ocp-disconnected
Frequently, portions of a datacenter may not have access to the Internet, even via proxy servers. Installing OpenShift Container Platform in these environments is considered a disconnected installation.
An OpenShift Container Platform disconnected installation differs from a regular installation in two primary ways:

* The OpenShift Container Platform software channels and repositories are not available via Red Hat’s content distribution network.

* OpenShift Container Platform uses several containerized components. Normally, these images are pulled directly from Red Hat’s Docker registry. In a disconnected environment, this is not possible.

A disconnected installation ensures the OpenShift Container Platform software is made available to the relevant servers, then follows the same installation process as a standard connected installation. This topic additionally details how to manually download the container images and transport them onto the relevant servers.

### [Reference] (https://docs.openshift.com/container-platform/3.3/install_config/install/disconnected_install.html)

To prepare the source package you need 1 RHEL VM. I created a EC2 instance VM on AWS (AMI ID: ami-8b8c57f8 ) with EBS (Elastic Block Storage) 200 GiB.

#**Syncing Repositories** 
```
# rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release

```

**register the server** with the Red Hat Customer portal

```
# subscription-manager register

```
**attach** to a subrsciption that provides Openshit Container Platform channels.

```
# subscription-manager list --available

```

Then, find the pool ID for the subscription that provides OpenShift Container Platform, and attach it:


```
# subscription-manager attach --pool=<pool_id>
# subscription-manager repos --disable="*"
# subscription-manager repos \
    --enable="rhel-7-server-rpms" \
    --enable="rhel-7-server-extras-rpms" \
    --enable="rhel-7-server-ose-3.3-rpms"
```

You need the ***createrepo*** and ***reposync*** (part or yum-utils) utility

```
# yum -y install yum-utils createrepo docker git

```

You are ready now to create the source package

#Required Software and Components
**create** directory: you will find several script to prepare and create the source package. 

RPM part
 
* *sync.sh* : Sync the packages and create the repository for each of them and create a tar file for each rpms package.  The REPO_LIST variable contents the list of rpms to prepare.

##Syncing Docker images and Preparing Images for Export 

DOCKER part



* *docker-image-ose.sh*:  OpenShift Container Platform containerized components 
* save-ose.sh: create a **ose3-images.tar** file

* *docker-log-metrics.sh*: OpenShift Container Platform containerized components for the additional centralized log aggregation and metrics aggregation components.
* *save-log* : create a **ose3-logging-metrics-images.tar** file

* *docker-demo.sh* : load all official docker images needed during a PoC.  Red Hat-certified Source-to-Image (S2I) builder image.
* *save-demo.sh* : create a tar file **ose3-builder-images.tar** on each docker image.

* *docker-dev.sh*: Additional docker images like (wildfly, gogs, nexus, sonarqube, gitlab, etc...)
* *save-dev.sh* : create a **ose-devgit-images.tar** file



##Transport

To be able to move all sources files I setup an http server on my AWS VM :

```
# yum install httpd
```

and I copy all tar files inside /var/www/html/repos.
```
# cp -a /path/to/repos /var/www/html/
# chmod -R +r /var/www/html/repos
# restorecon -vR /var/www/html
```

Once done you can use a script like *wget-tar.sh* to download all tar files on your external disk or on a server.

##Restore


**load** directory:
Once the repository server created we have to load all sources (rpm, docker images, git repos) on the target system.

