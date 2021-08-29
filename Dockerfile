FROM node:latest

RUN mkdir /app
WORKDIR /app

LABEL maintainer="email.sumandey@gmail.com"

ENV PATH /app/node_modules/.bin:$PATH

COPY package.json /app/
RUN npm install -g npm@7.6.0
RUN npm install

# Or if you're using Yarn
# ADD package.json yarn.lock /app/
# RUN yarn install

COPY . /app/

EXPOSE 3000

RUN npm start
