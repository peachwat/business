# E-commerce Store with PrestaShop

This project is a PrestaShop 1.7.8 e-commerce store running in a containerized environment using Docker.

## Tech Stack

*   **PrestaShop:** 1.7.8
*   **Database:** MariaDB 12.1.2
*   **Web Server:** Apache (within the PrestaShop container)
*   **Containerization:** Docker & Docker Compose
*   **Database Management:** phpMyAdmin

## Prerequisites

Before you begin, ensure you have the following installed on your system:

*   [Docker Desktop](https://www.docker.com/products/docker-desktop/)
*   [Git](https://git-scm.com/downloads)
*   **OpenSSL:**
    *   **macOS/Linux:** Should be pre-installed.
    *   **Windows:** Available through [Git Bash](https://gitforwindows.org/) or WSL.

---

## Local Development Setup

Follow these steps to get the development environment running on your local machine.

### 1. Clone the Repository

```bash
git clone https://github.com/peachwat/business.git
cd business
```

### 2. Create a Local SSL Certificate

The local environment uses HTTPS. You need to generate a self-signed certificate for the Apache server to use. These files are ignored by Git and will not be shared.

**A. Create the SSL directory:**

```bash
mkdir -p docker/apache/ssl
```

**B. Generate the certificate:**
Run the following command. It will create a `localhost.crt` and `localhost.key` file in the directory you just created.

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout docker/apache/ssl/localhost.key \
-out docker/apache/ssl/localhost.crt \
-subj "/CN=localhost"
```

### 3. Start the Environment

With the SSL certificate in place, you can now start all the services using Docker Compose.

```bash
docker-compose up -d
```

The services will now be running in the background.

---

## Access URLs and Credentials

*   **Shop URL:** **[https://localhost:8443](https://localhost:8443)**
*   **Admin Panel:** **[https://localhost:8443/admin](https://localhost:8443/admin)**
*   **phpMyAdmin:** **[http://localhost:8081](http://localhost:8081)**

> **Note on SSL:** When you first access a `https://localhost:8443` URL, your browser will show a security warning because the certificate is self-signed. This is expected. You must accept the risk to proceed.

### Credentials

*   **PrestaShop Admin:**
    *   **Email:** `admin@prestashop.com`
    *   **Password:** `admin`
*   **phpMyAdmin:**
    *   **Server:** `mariadb`
    *   **Username:** `root`
    *   **Password:** `admin`

## Project Structure

```
.
├── docker/              # Docker-related configurations (Apache, MariaDB)
├── parser/              # Python scripts for scraping products
├── prestashop_src/      # The PrestaShop source code (the application root)
├── .gitignore           # Files and directories ignored by Git
├── docker-compose.yaml  # Defines the services, networks, and volumes for Docker
└── README.md            # This file
```