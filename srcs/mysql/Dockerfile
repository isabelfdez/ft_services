# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: isfernan <isfernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/24 15:45:29 by isfernan          #+#    #+#              #
#    Updated: 2021/03/01 19:09:47 by isfernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.0

#Install MariaDB
RUN apk update && \
	apk add mariadb mariadb-client openrc && \
	rm -rf /var/cache/apk/*

COPY telegraf.conf setup.sh ./

# Comment next line for new wordpress
COPY wordpress.sql		wordpress.sql

# Install telegraf
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ telegraf && \
	mkdir -p /etc/telegraf && \
	mv telegraf.conf /etc/telegraf/

RUN chmod 777 setup.sh

EXPOSE 3306

CMD sh setup.sh