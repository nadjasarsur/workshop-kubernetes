#!/bin/bash

docker-compose build
cd terraform
terraform plan -out infrastructure.plan
terraform apply
gcloud container clusters get-credentials workshop-kubernetes-staffing --zone=europe-west1-c
kubectl get pods
