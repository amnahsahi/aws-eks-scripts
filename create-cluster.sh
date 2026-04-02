#!/usr/bin/env bash

set -e

CLUSTER_NAME=${1:-my-eks-cluster}
REGION=${2:-ap-southeast-2}
NODE_TYPE=${3:-t3.medium}
NODE_COUNT=${4:-2}

echo "Creating EKS cluster: $CLUSTER_NAME in $REGION"

# Check dependencies
for cmd in eksctl aws kubectl; do
  command -v $cmd >/dev/null 2>&1 || { echo "$cmd is required"; exit 1; }
done

eksctl create cluster \
  --name "$CLUSTER_NAME" \
  --region "$REGION" \
  --nodegroup-name standard-workers \
  --node-type "$NODE_TYPE" \
  --nodes "$NODE_COUNT" \
  --nodes-min 1 \
  --nodes-max 4 \
  --managed

echo "Cluster created successfully!"

aws eks --region "$REGION" update-kubeconfig --name "$CLUSTER_NAME"

kubectl get nodes
