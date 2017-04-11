FROM php:7.1.3-cli

# PHP additional extensions build & install
RUN apt-get update && apt-get install -y \
    libsqlite3-dev \
    libicu-dev \
    zlib1g-dev \
    libxml2-dev \
    libcurl4-openssl-dev

RUN docker-php-ext-install \
    mbstring \
    simplexml \
    pdo \
    pdo_mysql \
    pdo_sqlite \
    intl \
    bcmath \
    soap \
    zip

# Pecl extensions
RUN pecl install apcu
RUN echo "extension=apcu.so\napc.enable_cli=On" > $PHP_INI_DIR/conf.d/apcu.ini

# Composer install
RUN php -r "readfile('https://getcomposer.org/installer');" | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

# PHPUnit install
RUN curl -L https://phar.phpunit.de/phpunit.phar -o /usr/local/bin/phpunit
RUN chmod +x /usr/local/bin/phpunit

COPY entrypoint.sh /
RUN chmod u+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
