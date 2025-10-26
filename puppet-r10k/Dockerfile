FROM ghcr.io/teamzuzu/zuzu-devops:main
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM"
ARG RUNNER_VERSION=2.329.0
ENV GITHUB_PERSONAL_TOKEN ""
ENV GITHUB_OWNER ""
ENV GITHUB_REPOSITORY ""
RUN apt install -y --no-install-recommends vim jq gnupg2 apt-transport-https ruby procps && gem install -VN puppet r10k puppet-lint --clear-sources --no-document && useradd -m github && usermod -aG sudo github && echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && date > /root/puppet-r10k_build-date
COPY /*.* /
WORKDIR /home/github
COPY --chown=github:github entrypoint.sh ./entrypoint.sh
RUN curl -O -L https://github.com/actions/runner/releases/download/v$RUNNER_VERSION/actions-runner-linux-arm64-$RUNNER_VERSION.tar.gz && tar xzf ./actions-runner-linux-arm64-$RUNNER_VERSION.tar.gz &&  ./bin/installdependencies.sh && chmod u+x ./entrypoint.sh && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*
USER github
ENTRYPOINT ["/home/github/entrypoint.sh"]
