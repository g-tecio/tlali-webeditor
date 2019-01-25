FROM node:lts-alpine
RUN npm install -g http-server

#We are not using forever so lets comment this
#RUN npm install -g forever 
#RUN npm install -g forever-service	


RUN mkdir -p /tl-viewer

#We could change the COPY for a git clone directly from the repo
COPY . /tl-viewer

#With the following command now we are going to work in this directory, is like cd /route
WORKDIR /tl-viewer

#Here we install the dependencies of the projects 
RUN npm install

#Im not sure what does this commands do but its important 
ENV NODE_ENV=build

COPY . /tl-viewer
RUN npm run build
 
#RUN  npm run build && forever start --minUptime 1000 --spinSleepTime 1000 nuxt.config.js
#As we can see we didnt use forever because it works without it, its not needed in docker

ENV HOST 0.0.0.0
EXPOSE 3000
CMD [ "npm", "start"]

#run this docker with this commands pls:

#sudo docker build -t tlaliviewer -f Dockerfile .
#sudo docker run -it --rm -d -p 3000:3000 --name tlv tlaliviewer
#We are naming the docker run with "tlv" just in case we want to kill it, we know the name and its not random
<<<<<<< HEAD
=======

>>>>>>> aa960e45f06b7d13270c1723f947ff1968ca99b6
