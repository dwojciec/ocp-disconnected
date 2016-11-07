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

#scripts
**create** directory: we have to create the source package. 

* sync.sh : Sync the packages and create the repository for each of them
* 

**load** directory:
Once the repository server created we have to load all sources (rpm, docker images, git repos) on the target system.

