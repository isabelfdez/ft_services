# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: isfernan <isfernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 18:43:56 by isfernan          #+#    #+#              #
#    Updated: 2021/02/16 19:20:02 by isfernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.0

RUN apk update && \
	apk add wget && \
	apk add php php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

#Install Wordpress
RUN wget https://es.wordpress.org/latest-es_ES.tar.gz && \
	tar -xvf latest-es_ES.tar.gz && \
	mkdir /www &&\
	mv wordpress /www && \
    rm latest-es_ES.tar.gz && \
	rm -rf /var/cache/apk/*

RUN rm /www/wordpress/wp-config-sample.php

COPY ./wp-config.php /www/wordpress

EXPOSE 5050

CMD php -S 0.0.0.0:5050 -t /www/wordpress
