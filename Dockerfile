FROM node:8.4.0-alpine

ENV APP_HOME /broker_app

# Install dependencies
RUN apk add --no-cache --virtual build-dependencies make gcc g++ python && \
  apk add --no-cache krb5-dev zeromq zeromq-dev

RUN npm i node-gyp -g

RUN mkdir $APP_HOME
WORKDIR  $APP_HOME
ADD . $APP_HOME
RUN rm -rf node_modules
RUN npm i
# EXPOSE 7777

CMD ["bin/zss-broker", "start"]
