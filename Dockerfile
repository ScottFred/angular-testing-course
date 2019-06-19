FROM node:12.2

ENV NODE_ENV=development
ENV NPM_CONFIG_LOGLEVEL warn

# install node_modules in /app/node_modules because this is a built-in search path for Modules
WORKDIR /app
COPY package*.json /app/
RUN npm install && npm cache clean --force

# during development, developer will Docker bind mount to include their source code in the container
#   via -v $(pwd)/src:/app/src 
ARG APP_SRC="/app/src"
WORKDIR $APP_SRC
CMD ["node", "index.js"]
