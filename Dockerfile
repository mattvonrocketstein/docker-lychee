FROM php:7.0-apache
MAINTAINER Jean Blanchard <jean@blanchard.io>

# Configure php & dependencies
RUN apt-get update &&\
  apt-get install -y zlib1g-dev libjpeg62-turbo-dev libpng12-dev imagemagick &&\
  rm -rf /var/lib/apt/lists/* &&\
  docker-php-ext-install exif mysqli zip gd
ADD conf/php.ini /usr/local/etc/php/

# Install Lychee
ENV LYCHEE_VERSION v3.1.4

RUN curl -L https://github.com/electerious/Lychee/archive/${LYCHEE_VERSION}.tar.gz | tar -xzf - --strip 1 &&\
  chown -R www-data:www-data /var/www/html &&\
  chmod -R 770 /var/www/html &&\
  chmod -R 777 /var/www/html/uploads/ &&\
  chmod -R 777 /var/www/html/data/

# Expose volumes
RUN ln -s /var/www/html/uploads /uploads
RUN ln -s /var/www/html/data /data

VOLUME /uploads
VOLUME /data
