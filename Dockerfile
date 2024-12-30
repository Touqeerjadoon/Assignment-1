FROM node:16-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=admin

WORKDIR /home/app

COPY ./app/package*.json ./

RUN npm install --production

COPY ./app /home/app

EXPOSE 3000

RUN addgroup -S app && adduser -S app -G app
USER app

CMD ["node", "server.js"]