FROM nginx:1.23.1-alpine

ENV TZ=Asia/Tokyo

# nginx config file
COPY ./infra/docker/nginx/*.conf /etc/nginx/conf.d/

WORKDIR /work/src
