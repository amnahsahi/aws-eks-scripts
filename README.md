# aws-eks-scripts

Simple Bash scripts to create, manage, and operate Amazon EKS clusters using `eksctl` and `aws-cli`.

## Features

- Create EKS clusters
- Delete clusters safely
- Scale node groups
- Update kubeconfig
- Install NGINX ingress

---

## Requirements

- aws CLI
- eksctl
- kubectl

Make sure you're authenticated:

```bash
aws configure
```

## Usage

Create a cluster
```./create-cluster.sh my-cluster ap-southeast-2 t3.medium 2```

Delete a cluster
```./delete-cluster.sh my-cluster```

Scale node group
```./scale-nodegroup.sh my-cluster standard-workers 3```

Update kubeconfig
```./update-kubeconfig.sh my-cluster```

Install ingress controller
```./install-nginx-ingress.sh```

## Notes
	•	Default region is ap-southeast-2
	•	Scripts assume AWS credentials are already configured
	•	Costs may be incurred when creating clusters


