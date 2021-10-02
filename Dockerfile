FROM node:14 AS build

WORKDIR /app

COPY package.json ./
COPY yarn.lock ./

RUN yarn install

COPY public ./public
COPY src ./src

RUN yarn run build

FROM gcr.io/distroless/nodejs:14

WORKDIR /app

COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/build .

CMD ["./node_modules/serve/bin/serve.js", "-s", "-l", "3000"]
