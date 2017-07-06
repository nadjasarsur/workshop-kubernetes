#!/bin/bash

cd terraform; terraform destroy -force

cd ..; docker-compose build
docker tag web gcr.io/techops-infradel/web
gcloud docker -- push gcr.io/techops-infradel/web

cd terraform; terraform plan -out infrastructure.plan
terraform apply
gcloud container clusters get-credentials workshop-kubernetes-staffing --zone=europe-west1-c

cd ../
kubectl create -f kubernetes/redis-deployment.yml
kubectl create -f kubernetes/redis-service.yml
kubectl create -f kubernetes/web-deployment.yml
kubectl create -f kubernetes/web-service.yml

echo """
Run the following to open up the application in your browser
EXTERNAL_IP=\$(kubectl describe services workshop-kubernetes-web | grep "LoadBalancer Ingress" | cut -f2)
open http://$EXTERNAL_IP:9000
"""
