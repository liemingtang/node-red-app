FROM nodered/node-red-docker
MAINTAINER Lie Ming Tang


# for creating your own docker image,
# put any additional installation commands here. 

USER root

RUN npm install -g node-red-admin


USER node-red

# expose port for MQTT 
EXPOSE 8880


CMD ["npm", "start", "--", "--userDir", "/data"]
