FROM debian:buster

LABEL maintener="clorin@student.42.fr" release-date="2021-06-04"

RUN apt-get update -y \
	&& apt-get install -y php-cli php-mysql php-curl php-gd php-intl wget php-fpm vim
RUN mkdir /wordpress

COPY script.sh /wordpress/script.sh
COPY install_wordpress.sh /wordpress/install_wordpress.sh
WORKDIR /wordpress

CMD ["script.sh"]

