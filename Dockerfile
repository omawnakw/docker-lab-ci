FROM node:alpine as docker-nginx-example-builder
WORKDIR '/opt/app'
COPY ./frontend/package.json .
RUN npm install
COPY ./frontend/ .
RUN npm run build

FROM nginx
COPY --from=docker-nginx-example-builder /opt/app/build /usr/share/nginx/html
