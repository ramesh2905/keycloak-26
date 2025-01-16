### Running Custom keycloak Image in HA mode on a minikube cluster ###

## Prerequisites ##
* Windows/MacOS/Ubuntu VM with the following installed tools
* Minikube cluster
* Docker 
* Kubectl 

## Installation files ##
* Dockerfile
  Build the custom keycloak image using the quay.io/keycloak/keycloak:26.0.6 </br>
  Set the environmental variables needed </br>
  Copy the MSSQL server JDBC driver to the providers directory </br>
  Run the build step in the image to optimize the image </br>
  Build the docker image using the command `docker build . -t customkeycloakimage:26.0.6` </br>
  
* Deployment file
  Create the manifest.yaml with the deployment, service, ingress for the keycloak </br>
  Set the bootstrap admin credentials </br>
  Update the database connection settings </br>
  Modify the other configuration as required </br> 
  Deploy the file running the command `kubectl apply -f manifest.yaml` </br>

## Verification ##
Verify the pods running on the cluster </br>
Access the keycloak on http://localhost:8080/auth </br>

