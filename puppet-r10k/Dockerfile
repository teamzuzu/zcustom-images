FROM ghcr.io/teamzuzu/zuzu-devops:main
ARG TARGETPLATFORM
ENV TARGETPLATFORM=${TARGETPLATFORM:-linux/amd64}
RUN echo "I am running on $TARGETPLATFORM"
ARG RUNNER_VERSION=2.329.0
ENV GITHUB_PERSONAL_TOKEN ""
ENV GITHUB_OWNER ""
ENV GITHUB_REPOSITORY ""
RUN apt install -qy --no-install-recommends vim jq gnupg2 apt-transport-https procps puppet puppet-lint r10k
RUN useradd -m github && usermod -aG sudo github && echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && date > /root/puppet-r10k_build-date
COPY /*.* /
WORKDIR /home/github
COPY --chown=github:github entrypoint.sh ./entrypoint.sh


RUN if [ "$TARGETPLATFORM" = "linux/arm64" ]; then \
  curl -O -L https://github.com/actions/runner/releases/download/v$RUNNER_VERSION/actions-runner-linux-arm64-$RUNNER_VERSION.tar.gz \
  else \
  curl -O -L https://github.com/actions/runner/releases/download/v$RUNNER_VERSION/actions-runner-linux-amd64-$RUNNER_VERSION.tar.gz \
 fi

RUN tar xzf ./actions-runner-linux-*-$RUNNER_VERSION.tar.gz
RUN ./bin/installdependencies.sh && chmod u+x ./entrypoint.sh
RUN rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*
USER github
ENTRYPOINT ["/home/github/entrypoint.sh"]
