FROM php:8.1.17-apache

RUN apt-get update && apt-get install -y git

RUN docker-php-ext-install mysqli && \
    docker-php-ext-enable mysqli

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www
