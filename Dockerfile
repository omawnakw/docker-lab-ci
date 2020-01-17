FROM node:alpine as docker-nginx-example-builder
WORKDIR '/opt/app'
COPY ./package.json .
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=docker-nginx-example-builder /opt/app/build /usr/share/nginx/html
