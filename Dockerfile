# Set node base image
FROM node:4.6

# File Author / Maintainer
MAINTAINER chenwei <acee06.weichen@gmail.com>

## npm
RUN npm install -g pm2

# Provides cached layer for node_modules
ENV PROJECT_ROOT .
ADD ${PROJECT_ROOT}/package.json /tmp/package.json
RUN cd /tmp && npm install && \
    mkdir -p /src && cp -a /tmp/node_modules /src/

# Define working directory
WORKDIR /src
ADD ${PROJECT_ROOT} /src

ENTRYPOINT ["sh", "./docker-entrypoint.sh"]
