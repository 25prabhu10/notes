---
title: Kubernetes
description: Open-source container orchestration system
---

# Kubernetes

Kubernetes is an open-source **container orchestration** system for automating software deployment, scaling, and management

- Helps you **manage containerized applications**
- **High availability** or no downtime
- **Scalability** or high performance
- **Disaster recovery**: backup and restore

## Key Concepts

- **Cluster**: A set of nodes (machines) that run containerized applications
- **Node**: A single machine in the cluster (can be physical or virtual)
- **Pod**: The smallest deployable unit in Kubernetes, which can contain one or more containers
- **Service**: An abstraction that defines a logical set of pods and a policy to access them
- **Deployment**: A higher-level abstraction that manages a set of replicas of a pod
- **Namespace**: A way to divide cluster resources between multiple users
- **ConfigMap**: A way to store configuration data for applications
- **Secret**: A way to store sensitive information, such as passwords or API keys
- **Ingress**: A collection of rules that allow inbound connections to reach the cluster services
- **Volume**: A way to store data that can be shared between containers in a pod
- **DaemonSet**: Ensures that a copy of a pod runs on all or some nodes in the cluster
- **StatefulSet**: Manages the deployment and scaling of a set of pods, and provides guarantees about the ordering and uniqueness of these pods

## Configuration Files

Kubernetes resources are typically defined using YAML or JSON configuration files. These files specify the desired state of the resources, such as the number of replicas, container images, and resource limits

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: platforms-depl
spec:
  replicas: 1
  selector:
    matchLabels:
      app: platformservice
  template:
    metadata:
      labels:
        app: platformservice
    spec:
      containers:
        - name: platformservice
          image: binarythistle/platformservice:latest
```

## Command-Line Tool

The primary command-line tool for interacting with a Kubernetes cluster is `kubectl`. It allows you to deploy applications, inspect and manage cluster resources, and view logs

```bash
# Apply a configuration file to create or update resources
kubectl apply -f [file.yaml]

# Get a list of pods in the default namespace
kubectl get pods

# Get a list of deployments in the default namespace
kubectl get deployments

# Delete a deployment
kubectl delete deployment [deployment-name]

# Get detailed information about a specific pod
kubectl describe pod [pod-name]

# View logs for a specific pod
kubectl logs [pod-name]

# Scale a deployment to a specific number of replicas
kubectl scale deployment [deployment-name] --replicas=[number]

# Get a list of services in the default namespace
kubectl get services

# Create a namespace
kubectl create namespace [namespace-name]

# Switch to a different namespace
kubectl config set-context --current --namespace=[namespace-name]

# Check the rollout status of a deployment
kubectl rollout status deployment [deployment-name]

# Restart a deployment by pulling updated images
kubectl rollout restart deployment [deployment-name]

# Get a list of storage classes in the cluster
kubectl get storageclass

# Get a list of persistent volume claims in the default namespace
kubectl get pvc

# Create a secret from literal values
kubectl create secret generic [secret-name] --from-literal=[key1]=[value1]
```
