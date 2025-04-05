#!/bin/bash

# Set your GitHub repo path (absolute or relative)
REPO_PATH="/path/to/your/repo"
cd "$REPO_PATH" || exit

# Set a random number between 500 and 600
TOTAL_COMMITS=$((RANDOM % 101 + 500))

echo "Will create $TOTAL_COMMITS commits..."

# Commit loop
for ((i = 1; i <= TOTAL_COMMITS; i++)); do
    # Create/edit a dummy file with a random string
    echo "Commit #$i - $(date) - $RANDOM" >> spamlog.txt

    # Stage changes
    git add spamlog.txt

    # Random commit message
    COMMIT_MSG="Auto commit $RANDOM"
    git commit -m "$COMMIT_MSG"

    # Optional: Delay slightly to prevent race conditions
    sleep 0.2
done

# Final push
echo "Pushing all commits..."
git push origin main
