#!/bin/bash

# Path to the directory where the repository should be
REPO_PATH="/var/www/html/LenaSYS"
TEMP_PATH="/var/www/html/temp/*"

# Check if the directory is empty
if [ ! "$(ls -A $REPO_PATH)" ]; then
    echo "Directory is empty. Copying repository into ${REPO_PATH}..."
    cp -r $TEMP_PATH $REPO_PATH
else
    echo "Repository already exists or directory is not empty."
fi

# Execute the main container command
exec "$@"
