# gitlab runner
This is an extension of the official Gitlab Runner image that uses environment properties to register the runner on container startup and unregister on container shutting down.

### Usage
docker-compose.yml

```yml
version: '3.5'

services:
  gitlab-runner:
    image: flaviostutz/gitlab-runner:ubuntu-v12.3.0
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - GITLAB_URL=https://gitlab.com
      - REGISTRATION_TOKEN=[YOUR_TOKEN_HERE]
      - NAME=Testing name with space
      - TAG_LIST=tag-1,tag-2
``` 

### Build

The `.env` file contains the version of the official Gitlab Runner image that is used as the base.
To build an image with a different version just change the `.env` file and run `docker-compose build`.

Make sure the Gitlab Runner image version in `.env` file exists in the [gitlab runner image versions](https://hub.docker.com/r/gitlab/gitlab-runner/tags).
