# syntax=docker/dockerfile:1
# stolen from linuxserver

FROM ghcr.io/linuxserver/baseimage-alpine:3.22

# set version label
LABEL build_version="teamzuzu"
LABEL maintainer="teamzuzu"

RUN \
  echo "**** install packages ****" && \
  apk add --no-cache --virtual=build-dependencies \
    build-base \
    perl-app-cpanminus \
    perl-dev && \
  apk add --no-cache \
    apache2 \
    apache2-ctl \
    apache2-utils \
    apache-mod-fcgid \
    bc \
    bind-tools \
    font-noto-cjk \
    irtt \
    openssh-client \
    perl-authen-radius \
    perl-io-socket-inet6 \
    perl-json-maybexs \
    perl-lwp-protocol-https \
    perl-path-tiny \
    smokeping \
    ssmtp \
    sudo \
    traceroute \
    tcptraceroute && \
  echo "**** give setuid access to traceroute & tcptraceroute ****" && \
  chmod a+s /usr/bin/traceroute && \
  chmod a+s /usr/bin/tcptraceroute && \
  echo "**** fix path to cropper.js ****" && \
  sed -i 's#src="/cropper/#/src="cropper/#' /etc/smokeping/basepage.html && \
  echo "**** Cleanup ****" && \
  apk del --purge \
    build-dependencies && \
  rm -rf \
    /tmp/* \
    /root/.cpanm \
    /etc/apache2/httpd.conf

# add local files
COPY root/ /

# ports and volumes
EXPOSE 80

VOLUME /config /data
