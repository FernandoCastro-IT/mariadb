#!/bin/bash

# Start port forwarding in the background
kubectl port-forward svc/mariadb 3306:3306 &
PF_PID=$!

# Wait for port forwarding to establish
sleep 5

# Get credentials from secret
ROOT_PASSWORD=$(kubectl get secret mariadb-secrets -o jsonpath="{.data.root-password}" | base64 --decode)
DB_NAME=$(kubectl get secret mariadb-secrets -o jsonpath="{.data.database}" | base64 --decode)
DB_USER=$(kubectl get secret mariadb-secrets -o jsonpath="{.data.user}" | base64 --decode)
DB_PASSWORD=$(kubectl get secret mariadb-secrets -o jsonpath="{.data.password}" | base64 --decode)

echo "Testing connection to MariaDB..."
echo "Running test query as root user..."
mysql -h 127.0.0.1 -P 3306 -uroot -p$ROOT_PASSWORD -e "SHOW DATABASES;"

echo "Running test query as application user..."
mysql -h 127.0.0.1 -P 3306 -u$DB_USER -p$DB_PASSWORD -e "SHOW DATABASES;"

# Kill port forwarding
kill $PF_PID

echo "Connection test complete!"
