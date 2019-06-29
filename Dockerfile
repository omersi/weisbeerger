FROM ubuntu:latest

MAINTAINER 'Omer Livne' omer@livne.me


RUN \
apt-get update && \
apt-get install -y nginx curl vim less && \
rm -rf /var/lib/apt/lists/* && \
chown -R www-data:www-data /var/lib/nginx

RUN mkdir /var/www/weissbeerger
COPY weissbeerger /etc/nginx/sites-available/weissbeerger
RUN ln -s /etc/nginx/sites-available/weissbeerger /etc/nginx/sites-enabled/weissbeerger


  # Expose ports.
EXPOSE 80


COPY web/ /var/www/weissbeerger/
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]



