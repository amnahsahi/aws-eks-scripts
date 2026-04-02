#!/usr/bin/env bash

set -e

CLUSTER_NAME=$1
NODEGROUP_NAME=${2:-standard-workers}
NODES=$3
REGION=${4:-ap-southeast-2}

if [ -z "$CLUSTER_NAME" ] || [ -z "$NODES" ]; then
  echo "Usage: ./scale-nodegroup.sh <cluster> [nodegroup] <nodes> [region]"
  exit 1
fi

eksctl scale nodegroup \
  --cluster "$CLUSTER_NAME" \
  --name "$NODEGROUP_NAME" \
  --nodes "$NODES" \
  --region "$REGION"

echo "Scaled to $NODES nodes."
