#!/bin/bash
set -euo pipefail
echo "Running database migrations..."
flyway -url=$DATABASE_URL -user=$DB_USER -password=$DB_PASSWORD migrate
echo "Migrations complete"
