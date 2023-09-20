FROM node
LABEL authors="Camilo CJ"
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app

COPY . .
RUN npm install -g npm-check-updates \
    ncu -u \
    npm install \
    npm install express \
  
RUN npm ci --only=production
COPY . /app
EXPOSE 3000
CMD [ "babel-node", "app.js" ]
