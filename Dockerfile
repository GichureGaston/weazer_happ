FROM ubuntu:latest
RUN 
LABEL authors="gaston"

ENTRYPOINT ["top", "-b"]
