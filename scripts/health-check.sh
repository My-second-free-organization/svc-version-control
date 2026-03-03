#!/bin/bash
SERVICE_URL=$1
for i in {1..30}; do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$SERVICE_URL/health" || true)
  if [ "$STATUS" = "200" ]; then echo "Service healthy"; exit 0; fi
  echo "Waiting... ($i/30)"; sleep 10
done
echo "Health check failed"; exit 1
