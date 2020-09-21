FROM node:lts-alpine

WORKDIR /home/qra/src

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

ENTRYPOINT ["npm", "run", "serve"]
