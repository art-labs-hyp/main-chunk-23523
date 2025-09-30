FROM php:8.2-apache

WORKDIR /var/www/html

# Senin PHP dosyanı ana sayfa yapıyoruz
COPY main-chunk-23523.php /var/www/html/index.php

# Render'ın verdiği portu kullanması için Apache ayarı
COPY docker-start.sh /usr/local/bin/docker-start.sh
RUN chmod +x /usr/local/bin/docker-start.sh

EXPOSE 10000
CMD ["docker-start.sh"]
