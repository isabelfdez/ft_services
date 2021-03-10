# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: isfernan <isfernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/05 15:07:55 by isfernan          #+#    #+#              #
#    Updated: 2021/03/10 17:26:00 by isfernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.0

RUN apk update

# Install Grafana
RUN	apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
	mkdir -p /usr/share/grafana/data/

# Install telegraf
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ telegraf && \
	mkdir -p /etc/telegraf

COPY	/src/grafana.db				/usr/share/grafana/data/
COPY	/src/setup.sh				/
COPY	/src/telegraf.conf			/etc/telegraf/

EXPOSE 3000

CMD sh setup.sh
