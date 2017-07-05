## Use local docker images

Setup docker to point to minikube host

`eval $(minikube docker-env)`

Then build the image and make sure to tag it, since that's how you'll reference it

## Kubectl commands

Create a kubernetes deployment:

`kubectl create -f deployment.yml`

List all deployments

`kubectl get deployment`

Delete kubernetes pods:

`kubectl delete pods <pod-name>`

Delete kubernetes deployment:

`kubectl delete deployment <deployment-name>`

List all pods

`kubectl get pods`

Retrieve pod name

`POD_NAME=$(kubectl get pods | tail -1 | cut -d’ ' -f1)`

Check logs for a container:

`kubectl logs -f <POD> -c <CONTAINER>`

Expose a deployment to the external world:

`kubectl expose deployment workshop-kubernetes --type=LoadBalancer`

List all services

`kubectl get service`

To see what's going on with pods, use describe and look at the events section

`kubectl describe pods <POD>`

## Minikube

Once the service is exposed you can open it in the browser using:

`minikube service workshop-kubernetes`

## GCloud

Inital setup (including authentication) can be done via

`gcloud init`

Create the cluster

`gcloud container clusters create workshop-kubernetes --num-nodes=2 --machine-type=n1-standard2`

## Useful links

Running kubernetes locally:

https://kubernetes.io/docs/tutorials/stateless-application/hello-minikube/

Google Cloud quickstart with Kubernetes:

https://cloud.google.com/container-engine/docs/quickstart

