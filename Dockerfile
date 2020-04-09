FROM gitlab/gitlab-runner:ubuntu-v12.9.0

RUN apt-get update && apt-get install -y curl

ENV GITLAB_URL ""
ENV REGISTRATION_TOKEN ""
ENV DESCRIPTION ""

COPY startup.sh /startup.sh

VOLUME [ "/var/run/docker.sock" ]

ENTRYPOINT [ "bash" ]

CMD [ "/startup.sh" ] 
