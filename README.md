# 🐳 Inception

> System administration using Docker — a 42 project.

---

## 📖 About

**Inception** is a 1337 (42 network) project where you set up a complete web infrastructure using **Docker** and **Docker Compose**.  
Each service runs in its own dedicated container, built from scratch using custom `Dockerfile`.  
The goal is to understand containerization, networking, scurite container ,voulmes.

---

## 📂 Structure

```
inception/
│
├── Makefile                        # Build & manage the infrastructure
│
└── srcs/
    ├── docker-compose.yml          # Orchestrates all services
    │
    └── requirements/
        │
        ├── nginx/
        │   ├── Dockerfile          # Nginx image
        │   └── conf/               # Nginx config files
        │
        ├── wordpress/
        │   ├── Dockerfile          # WordPress + PHP-FPM image
        │   └── tools/              # Setup scripts
        │
        ├── mariadb/
        │   ├── Dockerfile          # MariaDB image
        │   ├── conf/               # MariaDB config files
        │   └── tools/              # Init scripts
        │
        └── bonus/
            ├── adminer/            # DB management UI
            ├── redis/              # Cache for WordPress
            ├── ftp/                # FTP server
            ├── portainer/          # Docker management UI
            └── web/                # Static website
```

---

## ⚙️ Usage

```bash
make build  # Build images
make up     # Start all containers
make down   # Stop and remove containers
make clean  # Remove containers, images, and volumes
```

---

## 🏗️ Infrastructure

### Mandatory Services

| Container | Description | Port |
|---|---|---|
| **nginx** | Web server — only entry point (TLS only) | `443` |
| **wordpress** | WordPress + PHP-FPM | internal |
| **mariadb** | MySQL database for WordPress | internal |

### Network Flow

```
Internet
   │
   ▼ (port 443 — HTTPS only)
[ nginx ]
   │
   ├──▶ [ wordpress / php-fpm ]
   │              │
   │              ▼
   │         [ mariadb ]
   │
   └──▶ [ bonus services ]
```

---

## ⭐ Bonus Services

| Container | Description |
|---|---|
| **redis** | Cache layer for WordPress |
| **ftp** | FTP server pointing to WordPress volume |
| **adminer** | Web-based database management UI |
| **portainer** | Docker container management UI |
| **web** | Custom static website |

---

## 🔑 Key Concepts

- **Docker** — each service runs in an isolated container built from a custom `Dockerfile`
- **Docker Compose** — orchestrates all containers, networks, and volumes
- **Volumes** — persistent storage for WordPress files and MariaDB data
- **Networks** — containers communicate through a private Docker network (no `--link`, no `host` network)
- **TLS** — Nginx serves only HTTPS (TLSv1.2 or TLSv1.3), no HTTP
- **Environment variables** — credentials and config stored in a `.env` file (never hardcoded)
- **No pre-built images** — every image is built from `Debian` via custom `Dockerfile`

---

## 🔒 Security Rules

- Passwords and secrets are stored in a **`.env` file** (not committed to git)
- No `latest` tag — images use a fixed stable version
- No infinite loops (`tail -f`, `sleep infinity`, `while true`) as entrypoints — use proper daemons
- Nginx is the **only** exposed port to the outside (`443`)
- All other services communicate only through the internal Docker network

---

## 📁 Volumes

| Volume | Mounted in |
|---|---|
| WordPress files | `/var/www/html` in wordpress & nginx |
| MariaDB data | `/var/lib/mysql` in mariadb |

---

## 🌐 Domain

The site is accessible at:

```
https://atoufik.42.fr
```

> Configured via `/etc/hosts` on the host machine pointing to `127.0.0.1`.

---

## 📋 Rules

- No `DockerHub` pre-built images (`Debian` base)
- Each service has its own `Dockerfile`
- One process per container

---

## 👤 Author

ataoufik@student.1337.ma

---

*1337 School (42 NETWORK) — Inception project*
