FROM node:10.13.0-alpine

WORKDIR /app  

COPY package*.json /app/

RUN apk add --no-cache tzdata
RUN apk add git
ENV TZ=America/Argentina/Buenos_Aires

RUN npm install -g npm
RUN npm install --prod -f

COPY . /app/

EXPOSE 3001

CMD NODE_ENV=prod npm run start