# Use the desired PHP version base image
FROM php:8.2-fpm

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libonig-dev \
    libzip-dev

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Copy existing application directory contents
COPY . /var/www

# Copy existing application directory permissions
COPY --chown=www-data:www-data . /var/www

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]








#FROM php:8.2-fpm
#
## Set working directory
#WORKDIR /var/www
#
## Install dependencies
#RUN apt-get update && apt-get install -y \
#    build-essential \
#    libpng-dev \
#    libjpeg-dev \
#    libfreetype6-dev \
#    locales \
#    zip \
#    jpegoptim optipng pngquant gifsicle \
#    vim \
#    unzip \
#    git \
#    curl
#
## Clear cache
#RUN apt-get clean && rm -rf /var/lib/apt/lists/*
#
## Install PHP extensions
#RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
#RUN docker-php-ext-configure gd --with-freetype --with-jpeg
#RUN docker-php-ext-install gd
#
## Copy existing application directory contents
#COPY . /var/www
#
## Copy existing application directory permissions
#COPY --chown=www-data:www-data . /var/www
#
## Change current user to www-data
#USER www-data
#
## Expose port 9000 and start php-fpm server
#EXPOSE 9000
#CMD ["php-fpm"]
