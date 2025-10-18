FROM debian:stable-slim
COPY setup.sh /root
COPY /id_rsa /root/.ssh/
RUN  bash -x /root/setup.sh
