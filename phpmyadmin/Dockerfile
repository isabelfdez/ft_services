# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: isfernan <isfernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/12 16:13:44 by isfernan          #+#    #+#              #
#    Updated: 2021/02/16 18:25:33 by isfernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.0

# No sé si el openrc hace falta -> COMPROBAR
RUN apk update && apk add wget && apk add openrc
RUN mkdir www/ &&\
	apk add php php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz && \
    tar -xvf phpMyAdmin-5.0.4-all-languages.tar.gz && \
    mv phpMyAdmin-5.0.4-all-languages phpmyadmin && \
    mv phpmyadmin /www && \
    rm phpMyAdmin-5.0.4-all-languages.tar.gz

COPY config.inc.php	/www/phpmyadmin/

RUN rm /www/phpmyadmin/config.sample.inc.php

EXPOSE 5000

CMD php -S 0.0.0.0:5000 -t /www/phpmyadmin
