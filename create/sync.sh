for repo in \
rhel-7-server-rpms rhel-7-server-extras-rpms \
rhel-7-server-ose-3.3-rpms
do
  reposync --gpgcheck -lm --repoid=${repo} --download_path=/orange/repos
  createrepo -v /orange/repos/${repo} -o /orange/repos/${repo}
done
