FROM		alpine:3.13.4

LABEL maintener="clorin@student.42.fr" release-date="2021-06-04"

RUN		apk add --no-cache nginx openssl vim

RUN		mkdir -p /run/nginx && chown nginx:nginx /run/nginx

COPY	conf/ /entrypoint/

WORKDIR		/entrypoint

EXPOSE		443

ENTRYPOINT 	["sh", "script.sh"]
