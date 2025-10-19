apt -y update
apt -y upgrade
apt install -y --no-install-recommends curl sudo git openssh-client ca-certificates python3 python3-requests
apt-get clean
rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*
mkdir /var/lib/dpkg/ ; touch /var/lib/dpkg/status

# git
echo "
# This is Git's per-user configuration file.
[user]
        name = simonccc
        email = simonc@gmail.com" > /root/.gitconfig

# build time
date > /root/zuzu_devops_build_date
