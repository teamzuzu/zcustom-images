FROM ghcr.io/teamzuzu/zuzu-devops:main

ARG TARGETPLATFORM
ENV TARGETPLATFORM=${TARGETPLATFORM:-linux/amd64}

ENV GITHUB_PERSONAL_TOKEN=""
ENV GITHUB_OWNER=""
ENV GITHUB_REPOSITORY=""
ENV DEBIAN_FRONTEND=noninteractive

RUN apt install -qy --no-install-recommends vim jq gnupg2 apt-transport-https procps puppet puppet-lint r10k

# github
RUN useradd -m github && usermod -aG sudo github && echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && date > /root/puppet-r10k_build-date

WORKDIR /home/github
COPY --chmod=755 /*.* .
RUN /home/github/install_runner.sh $TARGETPLATFORM
RUN rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*
USER github
ENTRYPOINT ["/home/github/entrypoint.sh"]
