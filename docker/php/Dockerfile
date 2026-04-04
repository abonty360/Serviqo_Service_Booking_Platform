FROM php:8.2-fpm-bookworm

# Base + build dependencies
RUN apt-get update && apt-get install -y \
    gnupg2 curl apt-transport-https \
    libgssapi-krb5-2 \
    libpng-dev libonig-dev libxml2-dev \
    zip unzip git \
    unixodbc unixodbc-dev \
    build-essential autoconf pkg-config \
    && apt-get clean

# Microsoft repo
RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc \
    | gpg --dearmor -o /usr/share/keyrings/microsoft.gpg

RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/debian/12/prod bookworm main" \
    > /etc/apt/sources.list.d/mssql-release.list

# SQL Server drivers
RUN apt-get update && ACCEPT_EULA=Y apt-get install -y \
    msodbcsql18 mssql-tools18

# PHP extensions
RUN docker-php-ext-install pdo mbstring exif pcntl bcmath gd

# ENV for SQLSRV
ENV ACCEPT_EULA=Y
ENV LD_LIBRARY_PATH="/opt/microsoft/msodbcsql18/lib64"

# Install SQLSRV (PINNED VERSION)
RUN pecl channel-update pecl.php.net \
    && printf "\n" | pecl install sqlsrv-5.12.0 \
    && printf "\n" | pecl install pdo_sqlsrv-5.12.0 \
    && docker-php-ext-enable sqlsrv pdo_sqlsrv

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

CMD ["php-fpm"]