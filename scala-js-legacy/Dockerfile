FROM fedora:40

ENV SBT_VER=1.4.9
ENV NODE_VER=10.13.0

RUN dnv install wget python2 make g++ -yq

# docker 
RUN dnf install 'dnf-command(config-manager)' -y && dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo && dnf install docker-ce -yq

# sbt 
RUN wget -nv -O /tmp/sbt.tar.gz "https://github.com/sbt/sbt/releases/download/v${SBT_VER}/sbt-${SBT_VER}.tgz" && tar xfz /tmp/sbt.tar.gz -C /usr/local/ --strip-components=1

# java
RUN wget -nv -O /tmp/java.rpm --no-cookies --no-check-certificate --header 'Cookie: oraclelicense=accept-securebackup-cookie' http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm && rpm -i /tmp/java.rpm

#RUN curl -s -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
#RUN source /root/.bashrc && nvm install ${NODE_VER}
RUN rm -rf /tmp/java.rpm /tmp/sbt.tar.gz && dnf clean all
