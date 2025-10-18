apt -y update
apt -y upgrade
apt install -y --no-install-recommends curl sudo git openssh-client ca-certificates python3 python3-requests
apt-get clean
rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*
mkdir /var/lib/dpkg/ ; touch /var/lib/dpkg/status

# ssh setup
mkdir /root/.ssh
cd /root/.ssh
ssh-keygen -y -f id_rsa > id_rsa.pub
ssh-keyscan github.com > known_hosts

# git
echo "
# This is Git's per-user configuration file.
[user]
        name = simonccc
        email = simonc@gmail.com" > /root/.gitconfig

# build time
date > /root/zuzu_devops_build_date
