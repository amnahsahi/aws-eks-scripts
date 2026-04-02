#!/usr/bin/env bash

CLUSTER_NAME=$1
REGION=${2:-ap-southeast-2}

if [ -z "$CLUSTER_NAME" ]; then
  echo "Usage: ./update-kubeconfig.sh <cluster-name> [region]"
  exit 1
fi

aws eks --region "$REGION" update-kubeconfig --name "$CLUSTER_NAME"

echo "kubeconfig updated."
kubectl get nodes
