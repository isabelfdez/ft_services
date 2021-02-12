# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: isfernan <isfernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/12 16:13:33 by isfernan          #+#    #+#              #
#    Updated: 2021/02/12 16:13:34 by isfernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.0

RUN apk update && apk add mariadb mariadb-client openrc && \
	rm -rf /var/cache/apk/*

COPY ./setup.sh .

# Comment next line for new wordpress
COPY wordpress.sql		wordpress.sql

RUN chmod 777 setup.sh

EXPOSE 3306

CMD bash start.sh