# gitlab runner

[<img src="https://img.shields.io/docker/pulls/flaviostutz/gitlab-runner"/>](https://hub.docker.com/r/flaviostutz/gitlab-runner)
[<img src="https://img.shields.io/docker/automated/flaviostutz/gitlab-runner"/>](https://hub.docker.com/r/flaviostutz/gitlab-runner)

This is an extension of official Gitlab Runner container that uses environment properties to register the container on startup.

### Usage
docker-compose.yml

```
version: '3.5'

services:
  gitlab-runner:
    image: flaviostutz/gitlab-runner
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - GITLAB_URL=https://gitlab.com
      - REGISTRATION_TOKEN=[YOUR_TOKEN_HERE]
      - NAME=Testing name with space
      - TAG_LIST=tag-1,tag-2
``` 
