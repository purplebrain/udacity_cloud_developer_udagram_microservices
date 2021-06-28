#!/bin/bash

# Cleanup everything (pods, deployments, services, hpa, etc.)
kubectl delete all --all

# Configure AWS Secrets
kubectl apply -f ./deploy/akuudagram.aws-secret.yaml

# Deploy backend microservices (feed, users)
kubectl apply -f ./deploy/akuudagram.backend.deployment.yaml
kubectl apply -f ./deploy/akuudagram.backend.service.yaml

# Give some time for the containers to get ready
sleep 5

# Deploy frontend microservice
kubectl apply -f ./deploy/akuudagram.frontend.deployment.yaml
kubectl apply -f ./deploy/akuudagram.frontend.service.yaml

# Deploy reverse-proxy microservice
kubectl apply -f ./deploy/akuudagram.rproxy.deployment.yaml
kubectl apply -f ./deploy/akuudagram.rproxy.service.yaml
 
# [ AUTOSCALING TEST ]
# Deploy metrics-server
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
# Configure auto-scaling for backend
kubectl autoscale deployment akuudagram-backend --cpu-percent=50 --min=1 --max=5
# Run the following in a separate terminal
#   PROMPT> kubectl run --generator=run-pod/v1 -i --tty load-generator --image=busybox /bin/sh
# This will login to load-generator pod's shell. 
# From the pod's shell run the below command. 
#   SHELL> while true; do wget -q -O- http://akuudagram-backend:8081/api/v0/feed; done
