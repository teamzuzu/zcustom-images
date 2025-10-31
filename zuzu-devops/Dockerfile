FROM debian:stable-slim
ENV DEBIAN_FRONTEND=noninteractive

RUN apt -q update && \
apt install -qy --no-install-recommends sudo wget curl git openssh-client ca-certificates python3 python3-requests gpg && mkdir /root/.ssh/ && ssh-keyscan github.com > /root/.ssh/known_hosts

RUN rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/* ;  mkdir /var/lib/dpkg/ ; touch /var/lib/dpkg/status

RUN date > /root/zuzu_devops_build_date
