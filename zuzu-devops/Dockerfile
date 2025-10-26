FROM debian:stable-slim

RUN apt -q update && apt install -qy --no-install-recommends sudo curl git openssh-client ca-certificates python3 python3-requests debconf dialog

RUN echo "[user]\n  name = simonc\n  email = simonc@gmail.com\n" > /root/.gitconfig

RUN rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/* ;  mkdir /var/lib/dpkg/ ; touch /var/lib/dpkg/status

RUN date > /root/zuzu_devops_build_date
