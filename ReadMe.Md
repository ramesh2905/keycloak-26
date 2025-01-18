### Running Custom keycloak Image in HA mode on a minikube cluster ###

## Prerequisites ##
* Windows/MacOS/Ubuntu VM with the following installed tools
* Minikube cluster
* Docker 
* Kubectl 

## MSSQL database Installation ##
 + Create a deployment file, Example: mssql.yaml 
 + Create a secret.yaml for storing the secret 
 + Deploy the database running the command `kubectl create -f mssql.yaml`
 + Verify the pod and services in the namespace
 
## Keycloak Installation ##
* Dockerfile
  + Build the custom keycloak image using the quay.io/keycloak/keycloak:26.0.6 
  + Set the environmental variables needed 
  + Copy the MSSQL server JDBC driver to the providers directory 
  + Run the build step in the image to optimize the image 
  + Build the docker image using the command `docker build . -t customkeycloakimage:26.0.6` 
  
* Manifest.yaml file
  + Create the manifest.yaml with the deployment, service, ingress for the keycloak 
  + Set the bootstrap admin credentials 
  + Update the database connection settings 
  + Modify the other configuration as required 
  + Deploy the file running the command `kubectl apply -f manifest.yaml` 

## Verification ##
Verify the pods running on the cluster </br>
Access the keycloak on http://localhost:8080/auth </br>
Access Management console on http://localhost:9000/management </br>

