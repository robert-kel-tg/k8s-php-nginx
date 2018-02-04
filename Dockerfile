FROM php:7.2-fpm-alpine

ENV APP_DIR /server/http
WORKDIR ${APP_DIR}

ADD ./public ${APP_DIR}/public