FROM node:14 AS build

WORKDIR /app

COPY package.json ./
COPY yarn.lock ./

RUN yarn install

COPY public ./public
COPY src ./src

RUN yarn run build

FROM gcr.io/distroless/nodejs:18

WORKDIR /app

COPY --from=build /app/build .
