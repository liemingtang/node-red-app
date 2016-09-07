# node-red-app

This repo contains the docker image that can be used to run a node-red application on a specific port.

You can also initialise the docker container with a specify flow file to run it.  

It may be handy if you want to deploy node-red apps on cloud services like AWS.



Step 1: ensure that you have an application flow json file ready.  
	note: if you just want to start with an empty one.  You can use the empty file that comes with this repo e.g., flow_app.json  

Step 2: create a local folder for node-red
	e.g., mkdir /local/data/folder 
	note: this folder can be empty or it can be a previous node-red application folder.  

Step 3: run build.sh script in this directory:
	sudo ./build.sh my-nodered-image 

Step 4: start node-red container and app in this directory.
	sudo ./run.sh flow_app.json /local/data/folder/ 1880 my-nodered-image 

	note: this will start the node-red application on port 1880 my-nodered-image
	note: if your local folder /local/data/folder is empty, the node-red app will initialise this folder with node-red files.  It will contain settings.js flow_app.json and lib/ folder.  Next time you start another container with the same directory, it will pick up whatever is in this folder.  


Test app on browser: 
	e.g., 
	http://localhost:1880 


Note: for security, you should add admin login credentials in the settings.js file in the node-red directory.



Install new node-red npm modules. 
Option 1: update the Dockerfile and build an new image. 

Option 2: e.g., for dev and testing)

Run npm install on the /local/data/folder the container was started on.   
Note: need to stop and start the container after install to reflect the new nodes in the interface. 

e.g.,
> cd /local/data/folder
> npm install node-red-packages
> sudo docker stop nodered-1880
> sudo docker start nodered-1880 
