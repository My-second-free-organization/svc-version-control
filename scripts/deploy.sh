#!/bin/bash
set -euo pipefail
SERVICE=$1
ENV=$2
echo "Deploying $SERVICE to $ENV"
kubectl set image deployment/$SERVICE $SERVICE=$ECR_REGISTRY/$SERVICE:$IMAGE_TAG -n flowforge
kubectl rollout status deployment/$SERVICE -n flowforge --timeout=300s
echo "Deployment complete"
