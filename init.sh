#!/bin/bash

# Path to the directory where the repository should be
REPO_PATH="/var/www/html/LenaSYS"
TEMP_PATH="/var/www/temp/*"

# Check if the directory is empty
if [ ! "$(ls -A $REPO_PATH)" ]; then
    echo "Directory is empty. Copying repository into ${REPO_PATH}..."
    cp -r $TEMP_PATH $REPO_PATH
    chown -R www-data:www-data $REPO_PATH
else
    echo "Repository already exists or directory is not empty."
fi

chown www-data:www-data /var/www/html/coursesyspw.php
mkdir /var/www/html/githubMetadata
chown -R www-data:www-data /var/www/html/githubMetadata

# Execute the main container command
exec "$@"
