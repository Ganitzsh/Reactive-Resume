FROM node:alpine AS builder

COPY package.json .
COPY package-lock.json .

RUN npm i

ADD . .

RUN npm run build

FROM nginx:alpine as runner

COPY --from=builder build /usr/share/nginx/html
