# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: isfernan <isfernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/24 15:44:00 by isfernan          #+#    #+#              #
#    Updated: 2021/03/05 13:42:14 by isfernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12.0

COPY	telegraf.conf setup.sh ./

RUN		apk update &&\
		apk add openssl &&\
		apk add vsftpd &&\
		rm -rf /var/cache/apk/*

#FTPS conf
RUN		echo -e "user\nuser" | adduser user -h /ftps_user;
RUN		chown user:user /ftps_user
RUN		touch /var/log/vsftpd.log
RUN		echo "user" >> /etc/vsftpd/vsftpd.userlist

#SSL
RUN		openssl req -x509 -out /etc/ssl/certs/vsftpd.crt -keyout /etc/ssl/private/vsftpd.key -newkey rsa:2048 -nodes -sha256 -subj '/CN=localhost'

# Install telegraf
RUN 	apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ telegraf && \
		mkdir -p /etc/telegraf && \
		mv telegraf.conf /etc/telegraf/

EXPOSE	20 21 31000

CMD		sh setup.sh