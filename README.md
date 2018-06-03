# gitlab runner
This is an extension of official Gitlab Runner container that uses environment properties to register the container on startup.

### Usage
docker-compose.yml

```
version: '3.5'

services:
  gitlab-runner:
    image: flaviostutz/gitlab-runner
    volumes:
      - runner1-etc:/etc/gitlab-runner
      - runner1-home:/home/gitlab-runner
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - GITLAB_URL=http://gitlab.com
      - REGISTRATION_TOKEN=##YOURTOKENHERE##
      - DESCRIPTION=My Runner

volumes:
  runner1-etc:
  runner1-home:
``` 
