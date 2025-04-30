# MariaDB on Kubernetes with Minikube

![MariaDB and Kubernetes logos](https://raw.githubusercontent.com/kubernetes/kubernetes/master/logo/logo.png)

A comprehensive guide and toolkit for deploying MariaDB in a Kubernetes environment using Minikube. Perfect for development, testing, and learning environments.

## 🌟 Features

- **Complete Deployment Solution**: All necessary Kubernetes configuration files and helper scripts
- **Step-by-Step Tutorial**: Detailed instructions for beginners and experienced users alike
- **Persistent Storage**: Properly configured for data durability across pod restarts
- **Security Best Practices**: Secure credential management using Kubernetes Secrets

## 📋 Prerequisites

Before starting, ensure you have:

- **Docker**: [Installation Guide](https://docs.docker.com/get-docker/)
- **kubectl**: [Installation Guide](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- **Minikube**: [Installation Guide](https://minikube.sigs.k8s.io/docs/start/)
- **Basic knowledge** of command-line operations and database concepts

## 🚀 Quick Start

```bash
# Clone this repository
git clone https://github.com/FernandoCastro-IT/mariadb
cd maria-on-k8s

# Start Minikube (if not already running)
minikube start --cpus=2 --memory=4096

# Run the setup script
chmod +x scripts/setup.sh
./scripts/setup.sh

# Test the connection
chmod +x scripts/test-connection.sh
./scripts/test-connection.sh
```

## 📁 Repository Structure

```
.
├── kubernetes/                     # Kubernetes configuration files
│   ├── persistent-volume.yaml      # PV configuration
│   ├── persistent-volume-claim.yaml # PVC configuration
│   ├── mariadb-secrets.yaml        # Secrets configuration
│   ├── mariadb-configmap.yaml      # ConfigMap configuration
│   ├── mariadb-statefulset.yaml    # StatefulSet configuration
│   └── mariadb-service.yaml        # Service configuration
├── scripts/                        # Helper scripts
│   ├── setup.sh                    # Setup script
│   ├── test-connection.sh          # Connection test script
│   └── cleanup.sh                  # Cleanup script

```

## 📚 Detailed Tutorial

### 1. Environment Setup

Start Minikube with sufficient resources:

```bash
minikube start --cpus=2 --memory=4096
```

Verify Minikube is running:

```bash
minikube status
```

### 2. Deploy MariaDB

Run the setup script to deploy MariaDB:

```bash
./scripts/setup.sh
```

This script:
- Enables necessary Minikube addons
- Creates persistent storage
- Deploys MariaDB with proper configuration
- Sets up a Kubernetes service for access

### 3. Connect to MariaDB

Forward the MariaDB port to your local machine:

```bash
kubectl port-forward svc/mariadb 3306:3306
```

Connect using your preferred MySQL client:

```bash
mysql -h 127.0.0.1 -P 3306 -uroot -p
```

### 4. Verify Data Persistence

Create a test database and table:

```sql
CREATE DATABASE test;
USE test;
CREATE TABLE example (id INT, name VARCHAR(50));
INSERT INTO example VALUES (1, 'Test Data');
SELECT * FROM example;
```

Delete and recreate the pod to verify persistence:

```bash
kubectl delete pod mariadb-0
# Wait for the pod to be recreated
kubectl get pods
```

Reconnect and verify your data is still there:

```sql
USE test;
SELECT * FROM example;
```

### 5. Clean Up

When you're done, clean up the resources:

```bash
./scripts/cleanup.sh
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgements

- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [MariaDB Documentation](https://mariadb.com/kb/en/documentation/)
- [Minikube Project](https://minikube.sigs.k8s.io/)
