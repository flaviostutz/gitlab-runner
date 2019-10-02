ARG VERSION=ubuntu
FROM gitlab/gitlab-runner:${VERSION}

ENV GITLAB_URL ""
ENV REGISTRATION_TOKEN ""
ENV DESCRIPTION ""

COPY startup.sh /startup.sh

VOLUME [ "/var/run/docker.sock" ]

ENTRYPOINT [ "bash" ]

CMD [ "/startup.sh" ] 
