#!/bin/bash

# Start Minikube if not already running
if ! minikube status | grep -q "Running"; then
  echo "Starting Minikube..."
  minikube start
else
  echo "Minikube is already running."
fi

# # Add Minikube node to the cluster if node count is less than 2
# NODE_COUNT=$(kubectl get nodes --no-headers | wc -l)
# if [ $NODE_COUNT -lt 2 ]; then
#   echo "Adding Minikube node..."
#   minikube node add
# else
#   echo "Minikube already has enough nodes."
# fi

# Create directory for persistent volume
minikube ssh "sudo mkdir -p /mnt/data && sudo chmod 777 /mnt/data"

# Create Kubernetes namespace if it doesn't exist
NAMESPACE="mariadb"
if ! kubectl get namespace $NAMESPACE; then
  echo "Creating namespace $NAMESPACE..."
  kubectl create namespace $NAMESPACE
else
  echo "Namespace $NAMESPACE already exists."
fi

# Switch to the new namespace
kubectl config set-context --current --namespace=$NAMESPACE

# Apply Kubernetes configurations
echo "Creating persistent volume and claim..."
kubectl apply -f kubernetes/persistent-volume.yaml
kubectl apply -f kubernetes/persistent-volume-claim.yaml

echo "Creating MariaDB secrets..."
kubectl apply -f kubernetes/mariadb-secrets.yaml

echo "Creating MariaDB ConfigMap..."
kubectl apply -f kubernetes/mariadb-configmap.yaml

echo "Deploying MariaDB StatefulSet..."
kubectl apply -f kubernetes/mariadb-statefulset.yaml

echo "Creating MariaDB Service..."
kubectl apply -f kubernetes/mariadb-service.yaml

echo "Waiting for MariaDB pod to be ready..."
kubectl wait --for=condition=ready pod/mariadb-0 --timeout=120s

echo "MariaDB deployment complete!"
echo "To connect to MariaDB, run: kubectl port-forward svc/mariadb 3306:3306"
