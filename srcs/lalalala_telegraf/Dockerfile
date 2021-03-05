# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: isfernan <isfernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/24 15:46:15 by isfernan          #+#    #+#              #
#    Updated: 2021/02/24 15:46:17 by isfernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12.0

RUN		apk update

#Intall Telegraf
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
RUN		rm -rf /var/cache/apk/*

CMD		/usr/bin/telegraf