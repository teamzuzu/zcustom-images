FROM ghcr.io/teamzuzu/zuzu-devops:main
ENV DEBIAN_FRONTEND=noninteractive
RUN apt install -y --no-install-recommends vim jq gnupg2 apt-transport-https procps puppet puppet-lint r10k
COPY --chmod=755 /r10*.sh /
