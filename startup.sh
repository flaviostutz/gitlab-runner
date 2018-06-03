#!/bin/bash

if [ "$GITLAB_URL" == "" ] || [ "$REGISTRATION_TOKEN" == "" ] || [ "$DESCRIPTION" == "" ]; then
    echo "ERROR: You have to specify GITLAB_URL, REGISTRATION_TOKEN and DESCRIPTION environment variables for this container to run"
    exit 1

elif [ ! -f /registered ]; then
    echo "Registering this runner on $GITLAB_URL with token $REGISTRATION_TOKEN and description $DESCRIPTION.."
    gitlab-runner register -n \
        --url $GITLAB_URL \
        --registration-token $REGISTRATION_TOKEN \
        --executor docker \
        --description $DESCRIPTION \
        --docker-image "docker:stable" \
        --docker-volumes /var/run/docker.sock:/var/run/docker.sock

    EXIT_CODE=$?
    if [ $EXIT_CODE == 0 ]; then
        touch /registered
    else
        echo "Failed to register this Runner. Exiting."
        exit $EXIT_CODE
    fi
fi

echo "Starting Gitlab Runner..."
/usr/bin/dumb-init /entrypoint run --user=gitlab-runner --working-directory=/home/gitlab-runner
