# MariaDB Projects

[![License: GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html) <!-- MariaDB is typically GPLv2, adjust if needed -->

Welcome to my MariaDB Projects repository! This repository is a collection of projects, examples, tutorials, and integrations related to [MariaDB](https://mariadb.org/), the community-developed, commercially supported fork of the MySQL relational database management system.

## About MariaDB

MariaDB is designed as a drop-in replacement for MySQL with more features, new storage engines, fewer bugs, and better performance. Key aspects include:

- **MySQL Compatibility:** Aims for high compatibility with MySQL.
- **Pluggable Storage Engines:** Offers a wide choice, including InnoDB, Aria, MyRocks, and the columnar **ColumnStore** engine for analytics.
- **Performance & Scalability:** Features like thread pooling and advanced replication options (including Galera Cluster for synchronous multi-master replication).
- **Modern SQL:** Supports JSON functions, temporal tables, Common Table Expressions (CTEs), window functions, and more.
- **Security:** Provides robust security features like role-based access control and audit plugins.
- **Open Source:** Community-driven development with commercial support available.

This repository explores these capabilities through practical examples.

## Repository Structure

This repository is organized to cover various aspects of MariaDB development and administration:

```
mariadb/
├── .github/                 # GitHub specific files
├── docs/                    # General documentation (Architecture, Best Practices, Setup)
├── examples/                # Examples by use case/feature
│   ├── oltp/                # Transactional examples
│   ├── olap_columnstore/    # ColumnStore analytics examples
│   ├── htap/                # Hybrid Transactional/Analytical examples
│   ├── replication_ha/      # Replication & High Availability (Galera)
│   ├── storage_engines/     # Specific storage engine demos
│   └── modern_sql/          # JSON, Temporal Tables, CTEs examples
├── integrations/            # Integrating MariaDB with other tools
│   ├── maxscale/            # MaxScale proxy examples
│   ├── connectors/          # Language connectors (Python, Java, etc.)
│   ├── bi_tools/            # BI tool integration (Grafana, Tableau)
│   └── message_queues/      # Kafka, RabbitMQ integration
├── performance/             # Performance tuning & benchmarking
│   ├── benchmarking/
│   └── query_optimization/
├── scripts/                 # Utility scripts (Data Gen, Backup, Setup)
│   ├── data_generation/
│   ├── backup_restore/
│   ├── setup/
│   └── monitoring/
├── tutorials/               # Step-by-step guides
│   ├── getting_started/
│   ├── galera_cluster/
│   └── columnstore_basics/
├── .gitignore
├── LICENSE                  # License file (Likely GPLv2)
└── README.md                # You are here!
```

- **`docs/`**: Foundational documentation on MariaDB architecture, best practices, and environment setup.
- **`examples/`**: Practical implementations categorized by use case (OLTP, OLAP, HTAP) and specific MariaDB features.
- **`integrations/`**: Code demonstrating how to connect and use MariaDB with other technologies like MaxScale, language connectors, BI tools, and message queues.
- **`performance/`**: Resources focused on benchmarking MariaDB and optimizing query performance.
- **`scripts/`**: Reusable scripts for common tasks like data generation, backups, environment setup, and monitoring.
- **`tutorials/`**: Guided walkthroughs for learning specific MariaDB concepts or features.

Each project or example within these directories should contain its own `README.md` with specific instructions.

## Getting Started

1.  **Clone the repository:**
    ```bash
    # Replace with your actual repo URL if different
    git clone https://github.com/FernandoCastro-IT/mariadb.git
    cd mariadb
    ```
2.  **Explore:** Navigate to the directory of interest (e.g., `cd examples/oltp`).
3.  **Follow Instructions:** Read the `README.md` file within the specific subdirectory for setup and execution steps.

## Contributing

Contributions are highly encouraged! If you have a MariaDB project, example, integration, or tutorial to share:

1.  **Fork** the repository.
2.  Create a **new branch** (`git checkout -b feature/your-contribution`).
3.  Add your project, ensuring it fits the repository structure and includes a clear `README.md`.
4.  **Commit** your changes (`git commit -am 'Add new MariaDB example for X'`).
5.  **Push** to the branch (`git push origin feature/your-contribution`).
6.  Open a **Pull Request**.

Please ensure your contributions are well-documented and follow any existing coding standards.

## License

This repository is licensed under the GNU General Public License v2.0. See the [LICENSE](LICENSE) file for details. MariaDB itself is primarily licensed under GPLv2.
