#!/bin/bash

WEB_VERSION="${1:-latest}"
echo "Generating version: $WEB_VERSION"

gcloud container clusters get-credentials workshop-kubernetes-staffing --zone=europe-west1-c
docker-compose build web
docker tag web gcr.io/techops-infradel/web:$WEB_VERSION
gcloud docker -- push gcr.io/techops-infradel/web:$WEB_VERSION

kubectl set image deployment/workshop-kubernetes-web web=gcr.io/techops-infradel/web:$WEB_VERSION

kubectl rollout status deployment/workshop-kubernetes-web
