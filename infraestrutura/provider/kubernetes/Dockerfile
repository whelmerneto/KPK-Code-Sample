FROM php:8.2-fpm

WORKDIR /var/www/html

# Arguments
ARG NEW_RELIC_LICENSE_KEY
ARG NEWRELIC_APP_NAME

RUN apt-get update && apt-get install -y \
    curl \
    zip \
    unzip \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libpq-dev \
    libzip-dev \
    jq

 # Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy build modules.
RUN mkdir build-modules
COPY infraestrutura/provider/kubernetes/modules build-modules

# Install ngnix.
RUN sh build-modules/nginx/install.sh

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd sockets zip

# Install APM.
RUN sh build-modules/apm/install.sh

# Install phpredis
RUN pecl install redis && docker-php-ext-enable redis

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Configure PHP.
RUN sh ./build-modules/php/configure.sh

# Configure ngnix.
RUN sh ./build-modules/nginx/configure.sh
RUN chmod 755 ./build-modules/nginx/entrypoint.d/*

# Add project files.
COPY . .

# Install composer packages.
RUN COMPOSER_ALLOW_SUPERUSER=1 composer update --no-progress --optimize-autoloader --no-dev

# Caching
#RUN php artisan route:clear \
#    && php artisan config:clear \
#    && php artisan route:cache \
#    && php artisan config:cache

# Configure entrypoint.
COPY infraestrutura/provider/kubernetes/entrypoint.sh .

RUN chmod a+rw -R /var/www/html
RUN chmod 755 ./entrypoint.sh
RUN ls -lah

ENTRYPOINT ["./entrypoint.sh"]
