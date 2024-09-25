#!/bin/bash
SERVICE_NAME="update-branch.service"
while true; do
    cd /home/sebas/Escritorio/SO_Lab_Service/NodeService
    git fetch origin

    LOCAL_COMMIT=$(git rev-parse HEAD)
    REMOTE_COMMIT=$(git rev-parse origin/Deployment)

    if [ "$LOCAL_COMMIT" != "$REMOTE_COMMIT" ]; then
        echo "Updating branch"
        git pull origin Deployment
        echo "Branch updated"
    else
        echo "Branch up to date"
    fi
    sleep 30
done

