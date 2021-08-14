# Container image that runs your code
FROM ubuntu:latest


RUN apt-get update && apt-get install -y \
    python3 \
    vim \
    python3-pip \
    dos2unix

RUN cd /home && mkdir "github-linter-CI"
WORKDIR /home/github-linter-CI
COPY . .
RUN python3 -m pip install -r requirements.txt

RUN ["chmod", "+x", "entrypoint.sh"]
RUN ["dos2unix", "entrypoint.sh"]

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/home/github-linter-CI/entrypoint.sh"]