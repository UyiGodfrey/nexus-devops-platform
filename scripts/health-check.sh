#!/bin/bash

URL="${1:-http://localhost:3000/health}"

echo "Checking Nexus API health at $URL..."

if curl --fail --silent "$URL" > /dev/null; then
    echo "SUCCESS: Nexus API is healthy."
    exit 0
else
    echo "ERROR: Nexus API health check failed."
    exit 1
fi
