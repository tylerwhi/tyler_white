FROM node:lts-alpine
RUN npm install -g http-server
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 8080
CMD [ "http-server", "dist" ]
docker build -t vuejs/dockerize-vuejs-app 
docker run -it -p 8080:8080 --rm --name dockerize-vuejs-app-1 vuejs/dockerize-vuejs-app
