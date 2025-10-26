FROM debian:stable-slim
RUN apt update && apt install -y --no-install-recommends sudo curl git openssh-client ca-certificates python3 python3-requests deb-conf dialog
RUN echo "
[user]
  name = simonccc
  email = simonc@gmail.com > /root/.gitconfig"
RUN rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/* ;  mkdir /var/lib/dpkg/ ; touch /var/lib/dpkg/status
RUN date > /root/zuzu_devops_build_date
