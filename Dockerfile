FROM node:latest

RUN mkdir /work
WORKDIR /work

COPY package*.json /work
COPY prisma/ /work

RUN npm install

COPY . .