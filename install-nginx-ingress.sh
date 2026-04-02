#!/usr/bin/env bash

set -e

echo "Installing NGINX Ingress Controller..."

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/aws/deploy.yaml

echo "Waiting for external IP..."

kubectl get svc -n ingress-nginx ingress-nginx-controller --watch
