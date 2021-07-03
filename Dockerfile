#Docker Guide

#Docker has an optimize features
#Checks if the cache memory is the same as the layer, 
#If it the same it uses the cache memory, instead of changing the layer 
FROM node:14.17.1-alpine3.11
#set directory to work, every instruction will be executed in that directory

#RUN addgroup app && adduser -S -G app app
#Executes too lines of code
#USER app 
#Set the user to app

WORKDIR /app
RUN mkdir data

# the dot means current directory
COPY package*.json . 
# Optimization method using the layers
RUN npm install
COPY . . 
# COPY ["hello world.txt","."]
# ADD is the same as COPY

# With 2 extra features:

# get files from URLs
# ADD http://.../file.txt . 

# add zip files and ADD will unzip it
# ADD doc.zip .

#RUN is a build time instruction, exectued at the time of building the image
ENV API_URL=http://user_api.com/
#echo $API_URL

EXPOSE 3000
#Just to document the port that it will be expose

#Shell form (creates a shell to execute the command)
# /bin/sh
# CMD npm start
#command to be exec in runtime instructions
#use when starting a container
#Exec form
# Best option, doesn't open another shell/process
# Easy to overwrite
CMD ["npm","start"]

#Entry Point
# Hard to overwrite
# ENTRYPOINT and CMD have the same use 
# the only way to change it is using the flag --entrypoint
# ENTRYPOINT ["npm","start"]
# ENTRYPOINT npm start