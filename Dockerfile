#Multistep build process
#because PROD, nginx webserver is ideal, but we currently use alpine image
#Build Phase and Run Phase

FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html


