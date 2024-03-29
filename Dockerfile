FROM php:8.0-apache

# Update package list and install system dependencies required for PHP extensions
RUN apt-get update && \
    apt-get install -y \
    libaio1 \
    libsqlite3-dev \
    libcurl4-openssl-dev \
    && docker-php-ext-install pdo_mysql pdo_sqlite curl \
    && rm -rf /var/lib/apt/lists/*

# Increase PHP upload size
RUN { \
        echo 'upload_max_filesize=128M'; \
        echo 'post_max_size=128M'; \
    } > /usr/local/etc/php/conf.d/uploads.ini