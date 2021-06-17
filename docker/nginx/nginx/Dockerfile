FROM debian:buster

LABEL maintener="clorin@student.42.fr" release-date="2021-06-04"

RUN apt-get update -y \
	&& apt-get install -y nginx openssl vim

RUN mkdir -p /nginx

RUN adduser --no-create-home --disabled-password nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/clorin.42.fr.conf /etc/nginx/site-available/clorin.42.fr.conf

RUN ln -s /etc/nginx/site-available/clorin.42.fr.conf /etc/nginx/sites-enabled/clorin.42.fr.conf

RUN chown -R nginx:nginx /var/www/html/
RUN chmod -R a+r /var/www/html/

#implementation of SSL certificates
#RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=France/L=Paris/O=42/OU=42Paris/CN=clorin" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
