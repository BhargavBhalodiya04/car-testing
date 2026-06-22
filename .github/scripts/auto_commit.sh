#!/bin/bash

COMMITS=$((RANDOM % 3 + 3))   # 3-5 commits

echo "Creating $COMMITS commits..."

for ((i=1;i<=COMMITS;i++))
do
    echo "$(date) - Random Commit $i - $RANDOM" >> activity.log

    git add activity.log

    git commit -m "chore: automated update #$i"

    # Wait random 10-60 seconds
    sleep $((RANDOM % 50 + 10))
done
