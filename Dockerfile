FROM node:latest

RUN mkdir /app
WORKDIR /app

LABEL maintainer="email.sumandey@gmail.com"

ENV PATH /app/node_modules/.bin:$PATH

COPY package.json /app/
RUN npm install

# Or if you're using Yarn
# ADD package.json yarn.lock /app/
# RUN yarn install

COPY . /app/

EXPOSE 4000

CMD ["node", "/app/server.js"]