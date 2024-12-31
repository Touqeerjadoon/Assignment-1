FROM node:16-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=admin

WORKDIR /app

COPY ./app/package*.json ./

RUN npm install --production

COPY ./app .

EXPOSE 3000

RUN addgroup -S app && adduser -S app -G app
USER app

CMD ["node", "server.js"]