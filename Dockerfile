FROM node:10.16.3-alpine AS build

WORKDIR /projects/vue-app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run build


FROM nginx:latest

COPY --from=build /projects/vue-app/dist /usr/share/nginx/html