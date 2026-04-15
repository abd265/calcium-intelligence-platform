#!/bin/bash

# Get the name of the current directory to use as the repo name
REPO_NAME=$(basename "$PWD")

# 1. Initialize git if it hasn't been already
if [ ! -d ".git" ]; then
    git init
    echo "Initialized empty Git repository."
else
    echo "Git repository already initialized."
fi

# 2. Add all files
git add .

# 3. Commit changes
read -p "Enter commit message (default: 'Initial commit'): " MESSAGE
MESSAGE=${MESSAGE:-"Initial commit"}
git commit -m "$MESSAGE"

# 4. Create the repo on GitHub and push
# --public makes it public; change to --private if preferred
# --source=. tells GitHub to use the current directory
# --push pushes the local commits immediately
echo "Creating GitHub repository: $REPO_NAME..."
gh repo create "$REPO_NAME" --public --source=. --remote=origin --push

echo "Successfully pushed to https://github.com/$(gh api user -q .login)/$REPO_NAME"