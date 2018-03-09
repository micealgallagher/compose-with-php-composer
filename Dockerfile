FROM tmaier/docker-compose

RUN apk --update --repository=http://dl-4.alpinelinux.org/alpine/edge/testing add
RUN apk --update add wget curl git php7 php7-curl php7-openssl php7-json php7-phar php7-dom php7-mbstring php7-zlib php7-tokenizer && rm /var/cache/apk/*
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
