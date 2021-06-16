#!/bin/bash

set -e

if [ "$GITLAB_URL" == "" ] || [ "$REGISTRATION_TOKEN" == "" ] || [ "$NAME" == "" ]; then
    echo "ERROR: You have to specify GITLAB_URL, REGISTRATION_TOKEN and NAME environment variables for this container to run"
    exit 1

elif [ ! -f /registered ]; then
    echo "Registering this runner on $GITLAB_URL with token $REGISTRATION_TOKEN and description $NAME.."
    gitlab-runner --debug register -n \
        --url $GITLAB_URL \
        --registration-token $REGISTRATION_TOKEN \
        --executor docker \
        --docker-privileged \
        --name "$NAME" \
        --tag-list "$TAG_LIST" \
        --docker-image "flaviostutz/docker-compose:19.03"

    EXIT_CODE=$?
    if [ $EXIT_CODE == 0 ]; then
        touch /registered
    else
        echo "Failed to register this Runner. Exiting."
        exit $EXIT_CODE
    fi
fi


pid=0 #init var
# SIGTERM-handler to unregister de gitlab-runner
shutdown_handler() {
    echo "GOOD BYE"
    gitlab-runner unregister -n "$NAME"
}
# catch the sigterm and unregister the runner
trap 'shutdown_handler' SIGTERM

# starts the gitlab runner as a "secondary" proccess because it should be down when we unregister it in the SIGTERM handler
echo "Starting Gitlab Runner..."

/usr/bin/dumb-init /entrypoint run --user=gitlab-runner --working-directory=/home/gitlab-runner & 

while true
do
  tail -f /dev/null & wait "$!"
done