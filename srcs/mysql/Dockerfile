# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: isfernan <isfernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/24 15:45:29 by isfernan          #+#    #+#              #
#    Updated: 2021/03/10 20:41:37 by isfernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.0

#Install MariaDB
RUN apk -U upgrade && \
	apk add mariadb mariadb-client mysql openrc && \
	rm -rf /var/cache/apk/*

COPY	/src/my.cnf				/etc/
COPY	/src/wordpress.sql		/
COPY	/src/setup.sh			/
COPY	/src/telegraf.conf		/
COPY    /src/init_file          /

RUN mkdir -p /run/mysqld && \
    chown -R root:root /run/mysqld

# Install telegraf
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ telegraf && \
	mkdir -p /etc/telegraf && \
	mv telegraf.conf /etc/telegraf/

RUN chmod 777 setup.sh

EXPOSE 3306

CMD sh setup.sh