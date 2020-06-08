ARG ALPINE_VERSION
FROM alpine:$ALPINE_VERSION

ARG COMPOSER_VERSION
ADD https://getcomposer.org/download/$COMPOSER_VERSION/composer.phar /usr/local/bin/composer

ARG USER_ID=1000
ARG USER_NAME=www
ARG GROUP_ID=1000
ARG GROUP_NAME=www

RUN apk add --update --no-cache \
    php7-cli \
    php7-apcu \
    php7-common \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-exif \
    php7-fileinfo \
    php7-fpm \
    php7-gd \
    php7-iconv \
    php7-imagick \
    php7-intl \
    php7-json \
    php7-mbstring \
    php7-mcrypt \
    php7-opcache \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-pdo_sqlite \
    php7-phar \
    php7-posix \
    php7-session \
    php7-xdebug \
    php7-simplexml \
    php7-tokenizer \
    php7-xml \
    php7-xmlwriter \
    php7-zip \
    php7-zlib \
    git \
    openssh \
    sqlite \
    yarn \
    && addgroup -g $GROUP_ID $GROUP_NAME \
    && adduser -D -u $USER_ID -G $GROUP_NAME $USER_NAME \
    && install -d -o $USER_NAME -g $GROUP_NAME /opt/project \
    && ln -s /usr/bin/php7 /usr/local/bin/php \
    && chmod 0755 /usr/local/bin/composer \
    && echo "zend_extension=xdebug.so" > /etc/php7/conf.d/xdebug.ini \
    && yarn global add docsify-cli \
    && :

WORKDIR /opt/project
USER $USER_NAME:$GROUP_NAME