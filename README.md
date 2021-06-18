# Technical_Assessment
Solutions to the technical assessment given by Toki Games

Create a new NetworkPolicy named NP1 in the namespace NS1. Ensure that the new NetworkPolicy allows Pods in namespace NS2 to connect to port 8080 of Pods in namespace NS1. Further ensure that the new NetworkPolicy NP1 does not allow access to Pods, which don't listen on port 8080 and does not allow access from Pods, which are not in namespace NS2.

--> you can refer to networkpolicy.yaml for the solution

Create an EKS cluster using Terraform. Containerize a sample web app to get all aws resources from all aws regions. Deploy the webapp inside the cluster.

--> Create EKS Cluster with terraform - main.tf

--> Created the Docker file - Dockerfile

docker build -t webapp .

docker tag webapp:latest ###########.dkr.ecr.ap-southeast-1.amazonaws.com/eks-webapp:1.0.0.RELEASE

docker push ##########.dkr.ecr.ap-southeast-1.amazonaws.com/eks-demo:latest:1.0.0.RELEASE

Deployment file to deploy web application in the cluster - deployment.yml

To expose the application via ClusterIP - Service.yml

To add ingress controller for the service - ingress.yml
