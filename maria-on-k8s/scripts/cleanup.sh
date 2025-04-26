#!/bin/bash

echo "Cleaning up MariaDB deployment..."

echo "Deleting MariaDB Service..."
kubectl delete -f kubernetes/mariadb-service.yaml

echo "Deleting MariaDB StatefulSet..."
kubectl delete -f kubernetes/mariadb-statefulset.yaml

echo "Deleting MariaDB ConfigMap..."
kubectl delete -f kubernetes/mariadb-configmap.yaml

echo "Deleting MariaDB secrets..."
kubectl delete -f kubernetes/mariadb-secrets.yaml

echo "Deleting persistent volume claim..."
kubectl delete -f kubernetes/persistent-volume-claim.yaml

echo "Deleting persistent volume..."
kubectl delete -f kubernetes/persistent-volume.yaml

echo "Cleanup complete!"
