#!/usr/bin/env bash

set -euo pipefail

# Random number of commits (3-5)
COMMITS=$(( RANDOM % 3 + 3 ))

echo "Creating ${COMMITS} commit(s)..."

# Create the log file if it doesn't exist
touch activity.log

for ((i=1; i<=COMMITS; i++)); do
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

    echo "${TIMESTAMP} | Update ${i} | Random=${RANDOM}" >> activity.log

    git add activity.log

    if git diff --cached --quiet; then
        echo "No changes to commit."
        continue
    fi

    git commit -m "chore: automated update #${i}"

    echo "Created commit ${i}/${COMMITS}"

    # Short pause between commits
    sleep $((RANDOM % 30 + 5))
done

echo "Done."
