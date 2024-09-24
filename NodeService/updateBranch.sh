#!/bin/bash
SERVICE_NAME="updateService.service"
cd /home/sebas/Escritorio/SO_Lab_Service/NodeService
git fetch origin

LOCAL_HASH=$(git rev-parse HEAD)
REMOTE_HASH=$(git rev-parse origin/deployment)

if ["$LOCAL_HASH" != "$REMOTE_HASH"]; then
    echo "Updating branch"
    git checkout deployment
    git pull origin deployment

    systemctl restart $SERVICE_NAME
    echo "Branch updated"
    sudo systemctl daemon-reload
    sudo systemctl restart update-deployment.timer
else
    echo "Branch up to date"
fi
