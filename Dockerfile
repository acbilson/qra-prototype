FROM node:lts-alpine as dev

WORKDIR /home/qra/src

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

ENTRYPOINT ["npm", "run", "serve"]

FROM dev as build

RUN npm run build

# hangs container so I can copy /dist to host
ENTRYPOINT ["tail", "-f", "/dev/null"]
