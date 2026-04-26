FROM ghcr.io/teamzuzu/zuzu-devops:main
RUN mkdir /mirror
COPY mirror.sh /root
EXPOSE 80
CMD ["bash", "/root/mirror.sh"]
