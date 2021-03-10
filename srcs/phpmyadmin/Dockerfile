# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: isfernan <isfernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/24 15:46:02 by isfernan          #+#    #+#              #
#    Updated: 2021/03/10 19:35:37 by isfernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.0

COPY telegraf.conf setup.sh ./

RUN apk update &&\
	apk add openrc &&\
	apk add wget &&\
	mkdir www/ &&\
	apk add php php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session nginx

# Install PhpMyAdmin
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz &&\
	tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz &&\
	mv phpMyAdmin-5.0.2-all-languages/* /www/ &&\
	rm phpMyAdmin-5.0.2-all-languages.tar.gz

COPY config.inc.php		/www/

# Configure nginx
RUN adduser -D -g 'www' www && mkdir -p /run/nginx www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www
	
COPY nginx.conf /etc/nginx/nginx.conf

# Install telegraf
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ telegraf && \
	mkdir -p /etc/telegraf && \
	mv telegraf.conf /etc/telegraf/

EXPOSE 5000

CMD sh setup.sh