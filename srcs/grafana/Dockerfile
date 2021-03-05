# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: isfernan <isfernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/05 15:07:55 by isfernan          #+#    #+#              #
#    Updated: 2021/03/05 15:07:56 by isfernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.0

RUN apk update

COPY datasource.yaml dashboard.yaml dashboards telegraf.conf setup.sh ./

# Install Grafana
RUN	apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Configure Grafana
RUN mv datasource.yaml /usr/share/grafana/conf/provisioning/datasources/ && \
	mv *.json dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/

# Install telegraf
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ telegraf && \
	mkdir -p /etc/telegraf && \
	mv telegraf.conf /etc/telegraf/

EXPOSE 3000

CMD sh setup.sh
