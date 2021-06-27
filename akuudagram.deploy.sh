#!/bin/bash

kubectl apply -f ./deploy/akuudagram.aws-secret.yaml
kubectl apply -f ./deploy/akuudagram.backend.deployment.yaml
kubectl apply -f ./deploy/akuudagram.backend.service.yaml
#kubectl apply -f ./deploy/akuudagram.backend-feed.deployment.yaml
#kubectl apply -f ./deploy/akuudagram.backend-feed.service.yaml
#kubectl apply -f ./deploy/akuudagram.backend-user.deployment.yaml
#kubectl apply -f ./deploy/akuudagram.backend-user.service.yaml
sleep 5

kubectl apply -f ./deploy/akuudagram.frontend.deployment.yaml
kubectl apply -f ./deploy/akuudagram.frontend.service.yaml

kubectl apply -f ./deploy/akuudagram.rproxy.deployment.yaml
kubectl apply -f ./deploy/akuudagram.rproxy.service.yaml
                  
