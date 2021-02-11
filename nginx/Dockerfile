FROM alpine:3.12.0

COPY src/nginx.conf ./root
COPY src/index.html ./root

RUN apk update && apk add nginx && apk add openssl && \
	apk --update add --no-cache openssh

RUN openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 -subj "/C=SP/ST=Spain/L=Madrid/O=42/CN=127.0.0.1" \
		-keyout /etc/ssl/private/isfernan.key \
		-out /etc/ssl/certs/isfernan.crt && \
		openssl dhparam -out /etc/nginx/dhparam.pem 1000

RUN	sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  	&& echo "root:root" | chpasswd \
  	&& rm -rf /var/cache/apk/* \
  	&& sed -ie 's/#Port 22/Port 22/g' /etc/ssh/sshd_config \
  	&& sed -ri 's/#HostKey \/etc\/ssh\/ssh_host_key/HostKey \/etc\/ssh\/ssh_host_key/g' /etc/ssh/sshd_config \
  	&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/g' /etc/ssh/sshd_config \
  	&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_dsa_key/HostKey \/etc\/ssh\/ssh_host_dsa_key/g' /etc/ssh/sshd_config \
  	&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ecdsa_key/HostKey \/etc\/ssh\/ssh_host_ecdsa_key/g' /etc/ssh/sshd_config \
  	&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ed25519_key/HostKey \/etc\/ssh\/ssh_host_ed25519_key/g' /etc/ssh/sshd_config \
  	&& /usr/bin/ssh-keygen -A \
  	&& ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

RUN mkdir /www && chown -R 777 /var/lib/nginx && chown -R 777 /www
RUN rm /etc/nginx/nginx.conf
RUN mv /root/nginx.conf /etc/nginx/nginx.conf
RUN mv /root/index.html /www/index.html
RUN mkdir -p /run/nginx

# Port 80 (http); Port 443 (https); Port 22 (SSH)
EXPOSE 80 443 22

CMD ["nginx", "-g", "daemon off ;"]