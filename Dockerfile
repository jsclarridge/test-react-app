FROM node:18 AS build

WORKDIR /app

COPY package.json ./
COPY yarn.lock ./

RUN yarn install

COPY public ./public
COPY src ./src

RUN yarn run build

FROM gcr.io/distroless/nodejs:14

WORKDIR /app

COPY --from=build /app/build .
