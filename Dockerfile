# Base Image
FROM php:7.4-cli

#Install system dependencies and Composer
RUN apt-get update && apt-get install -y \
 unzip \
 git \ 
 zip \
 curl \
 && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory inside the container
WORKDIR /app

# Copy all files
COPY . .

# Install PHP dependencies
RUN composer install

# Run PHPUnit tests by default
CMD ["vendor/bin/phpunit", "--testdox"]
