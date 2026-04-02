#!/usr/bin/env bash

set -e

CLUSTER_NAME=$1
REGION=${2:-ap-southeast-2}

if [ -z "$CLUSTER_NAME" ]; then
  echo "Usage: ./delete-cluster.sh <cluster-name> [region]"
  exit 1
fi

read -p "Are you sure you want to delete $CLUSTER_NAME? (y/N): " confirm
if [[ "$confirm" != "y" ]]; then
  echo "Aborted."
  exit 0
fi

eksctl delete cluster \
  --name "$CLUSTER_NAME" \
  --region "$REGION"

echo "Cluster deleted."
