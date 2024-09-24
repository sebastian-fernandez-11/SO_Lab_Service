#!/bin/bash
SERVICE_NAME="updateService.service"
cd /home/sebas/Escritorio/SO_Lab_Service/NodeService
git fetch origin

LOCAL_COMMIT=$(git rev-parse HEAD)
REMOTE_COMMIT=$(git rev-parse origin/Deployment)

if [ "$LOCAL_COMMIT" != "$REMOTE_COMMIT" ]; then
    echo "Updating branch"
    git pull origin Deployment

    systemctl restart $SERVICE_NAME
    echo "Branch updated"
    sudo systemctl daemon-reload
    sudo systemctl restart update-deployment.timer
else
    echo "Branch up to date"
fi
