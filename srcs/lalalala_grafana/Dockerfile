# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: isfernan <isfernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/24 15:44:13 by isfernan          #+#    #+#              #
#    Updated: 2021/02/26 14:45:54 by isfernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.0

RUN apk update 
	
#Intall Grafana
RUN		apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community/ &&\
		rm -rf /var/cache/apk/*gz

COPY	datasource.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
COPY	dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml
COPY	services.json /usr/share/grafana/public/dashboards/services.json

EXPOSE 3000

CMD /usr/sbin/grafana-server --config=/usr/share/grafana/conf/grafana.ini --homepath=/usr/share/grafana