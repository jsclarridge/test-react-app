FROM node:16 AS build

WORKDIR /app

COPY package.json ./
COPY yarn.lock ./

RUN yarn install

COPY public ./public
COPY src ./src

RUN yarn run build

FROM node:16

RUN yarn global add serve

WORKDIR /app

COPY --from=build /app/build .

CMD ["serve", "-s", "-l", "3000"]
