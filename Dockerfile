FROM nginx:latest

RUN rm -rf /usr/share/nginx/html/*
COPY . /usr/share/ngnix/html/

EXPOSE 80
