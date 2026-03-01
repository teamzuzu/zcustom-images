#FROM centos:centos7.9.2009
FROM fedora:40

ENV SBT_VER=1.4.9
ENV NODE_VER=10.13.0

#RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*.repo && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*.repo && yum install wget -y
RUN yum install wget -y
RUN wget -nv -O /tmp/sbt.tar.gz "https://github.com/sbt/sbt/releases/download/v${SBT_VER}/sbt-${SBT_VER}.tgz" && tar xfz /tmp/sbt.tar.gz -C /usr/local
RUN wget -nv -O /tmp/java.rpm --no-cookies --no-check-certificate --header 'Cookie: oraclelicense=accept-securebackup-cookie' http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm && rpm -i /tmp/java.rpm

#RUN curl -s -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
#RUN source /root/.bashrc && nvm install ${NODE_VER}
RUN rm -rf /tmp/java.rpm /tmp/sbt.tar.gz && yum clean all
