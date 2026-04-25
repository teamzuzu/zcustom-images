FROM ghcr.io/teamzuzu/zuzu-devops:main
RUN mkdir /mirror
COPY mirror.sh /mirror
EXPOSE 80
CMD ["bash", "/mirror/mirror.sh"]
