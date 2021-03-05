# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: isfernan <isfernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/28 12:57:11 by fulldemo          #+#    #+#              #
#    Updated: 2021/03/05 13:42:52 by isfernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.0

COPY telegraf.conf setup.sh ./

RUN apk update && \
	apk add wget && \
	apk add php php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

# Install Wordpress
RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xvf latest.tar.gz && \
	mkdir /www &&\
	mv wordpress/* /www && \
	rm -rf /var/cache/apk/* && \
	rm -rf latest.tar.gz

COPY ./wp-config.php /www/wp-config.php

# Install telegraf
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ telegraf && \
	mkdir -p /etc/telegraf && \
	mv telegraf.conf /etc/telegraf/

EXPOSE 5050

CMD sh setup.sh