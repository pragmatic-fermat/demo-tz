FROM php:8.3-fpm

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && echo "date.timezone = $TZ" > /usr/local/etc/php/conf.d/99-timezone.ini

RUN apt-get update \
    && apt-get install -y --no-install-recommends nginx \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f /etc/nginx/sites-enabled/default

COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY index.php /var/www/html/index.php

EXPOSE 80

CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
