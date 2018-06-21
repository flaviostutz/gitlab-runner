# gitlab runner
This is an extension of official Gitlab Runner container that uses environment properties to register the container on startup.

### Usage
docker-compose.yml

```
version: '3.5'

services:
  gitlab-runner:
    image: flaviostutz/gitlab-runner:ubuntu-v10.8.0
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - GITLAB_URL=https://gitlab.com
      - REGISTRATION_TOKEN=[YOUR_TOKEN_HERE]
      - NAME=Testing name with space
      - TAG_LIST=tag-1,tag-2
``` 
