FROM ghcr.io/teamzuzu/zuzu-devops:main
EXPOSE 80
COPY index.html /
COPY articles /articles
CMD ["python3", "-m", "http.server", "80"]
