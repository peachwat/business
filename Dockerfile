FROM prestashop/prestashop:1.7.8

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt -subj "/C=PL/ST=Pomerania/L=Gdansk/O=PG/OU=./CN=."

RUN rm /etc/apache2/sites-available/000-default.conf

COPY ./docker/ssl/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN rm -rf /var/www/html/*

COPY --chmod=777 ./prestashop_src/ /var/www/html/

RUN a2enmod ssl

RUN apt-get update && apt-get install -y libmemcached-dev zlib1g-dev
RUN pecl install memcached
RUN docker-php-ext-enable memcached
