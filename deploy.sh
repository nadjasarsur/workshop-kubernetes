#!/bin/bash

cd terraform; terraform destroy -force

cd ..; docker-compose build
docker tag workshop gcr.io/techops-infradel/workshop
gcloud docker -- push gcr.io/techops-infradel/workshop

cd terraform; terraform plan -out infrastructure.plan
terraform apply
gcloud container clusters get-credentials workshop-kubernetes-staffing --zone=europe-west1-c

cd ../; kubectl create -f kubernetes/deployment.yml
kubectl expose deployment workshop-kubernetes --type=LoadBalancer

echo """
Run the following to open up the application in your browser
EXTERNAL_IP=$(kubectl describe services workshop-kubernetes | grep "LoadBalancer Ingress" | cut -f2)
open http://$EXTERNAL_IP:9000
"""
