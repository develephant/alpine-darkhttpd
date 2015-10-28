# alpine-darkhttpd:base
FROM alpine:latest
MAINTAINER Chris Byerley <@develephant>

RUN apk update && apk add --update darkhttpd && \
  mkdir -p /home/www && \
  touch /home/www/index.html && \
  echo '<h1>Hiya!</h1>' > /home/www/index.html && /
  rm -rf /var/cache/apk/*

#Embed www content if the image
#is used as a base for a new build.
ONBUILD RUN rm -rf /home/www/*
ONBUILD COPY ./www/ /home/www/

EXPOSE 80

CMD ["darkhttpd", "/home/www"]
