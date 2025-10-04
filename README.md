
***

# Netflix-themed Web Login Page - Microservice Deployment with Docker Compose

A Netflix-inspired login page hosted on Apache servers running inside Kali Linux Docker containers. This project showcases **microservice deployment** using Docker Compose, with multiple containerized Apache services serving the same or customizable login pages on different ports.

***

## Project Overview

This project demonstrates:
- Containerizing web applications with Docker
- Multi-service orchestration using Docker Compose
- Hosting web content with Apache HTTP server inside containers
- Designing responsive, Netflix-style UI/UX login pages
- Managing multiple independent services on distinct ports for microservice architecture

***
## Project Structure

```plaintext
project1/
├── Dockerfile            # Base Dockerfile for building Apache-based images
├── docker-compose.yml    # Compose file to deploy all microservices together
├── index.html            # Default Netflix-themed login page HTML
├── README.md             # Project documentation (this file)
└── assets/               # Static assets such as CSS, JS, images (optional)
```

***

## Microservices Overview

| Service Name   | Docker Image       | Host Port |
|----------------|--------------------|-----------|
| webseries      | webseries:v1       | 90        |
| animation      | animation:v1       | 91        |
| documentaries  | documentaries:v1   | 92        |
| movies         | movies:v1          | 93        |

- Each service runs an isolated Apache server container.
- All initially serve the default `index.html` but can be customized independently.

***

## Features

- Netflix-style login page UI  
- Integration of Google Fonts (Montserrat, Pacifico) for typography  
- Font Awesome icons embedded in login input fields  
- Profile image display feature  
- Responsive design with a semi-transparent form overlay on background  
- Multi-container setup managed via Docker Compose  
- Auto container restart (`restart: unless-stopped`) configured for reliability  

***

## Prerequisites

Ensure the following tools are installed on your host system:

- Docker (version 20.x or higher recommended)  
- Docker Compose (version 1.29+ recommended)  
- Git (with configured SSH keys if cloning via SSH)  
- Active internet connection for downloading fonts and icons

***

## Installation & Setup Instructions

### 1. Clone the Repository Using SSH

```bash
git clone git@github.com:<USERNAME>/<REPO_NAME>.git
cd project1
```

> **Note:** Add your SSH key to GitHub for seamless cloning.

### 2. Build Docker Images

Option A: Build each service image individually

```bash
docker build -t webseries:v1 .
docker build -t animation:v1 .
docker build -t documentaries:v1 .
docker build -t movies:v1 .
```

Option B: Build all images together using Docker Compose

```bash
docker-compose build
```

### 3. Launch Containers

Run all services in detached mode with automatic restart enabled:

```bash
docker-compose up -d
```

### 4. Verify Running Containers

```bash
docker ps
```

You should see containers listening on ports 90, 91, 92, and 93.

### 5. Access Services in Browser

| Service       | URL                       |
|---------------|---------------------------|
| webseries     | http://localhost:90        |
| animation     | http://localhost:91        |
| documentaries | http://localhost:92        |
| movies        | http://localhost:93        |

***

## Stopping and Cleaning Up

### Stop all running containers

```bash
docker-compose down
```

### Optional: Remove all images

```bash
docker rmi webseries:v1 animation:v1 documentaries:v1 movies:v1
```

***

## Customization

### Customize HTML for each service

1. Create a unique HTML file for each service:

- `webseries.html`  
- `animation.html`  
- `documentaries.html`  
- `movies.html`

2. In Dockerfile, modify the copy command accordingly for each build:

```dockerfile
COPY webseries.html /var/www/html/index.html
```

### Add New Services

- Add a new service entry to `docker-compose.yml` specifying image and port.  
- Build and deploy images similarly.

### Modify Apache Configuration

- Apache uses default settings within containers.  
- For config tweaks, modify `/etc/apache2/sites-available/000-default.conf` inside container or extend Dockerfile accordingly.

***

## Git Usage (SSH)

```bash
git add .
git commit -m "Add Docker multi-service Netflix login page setup"
git push origin main
git log --oneline
```

***

## Troubleshooting Tips

- **Port Conflicts:** Ensure host ports 90-93 are free before launching.  
- **Permissions:** Use `sudo` if Docker commands fail due to permissions.  
- **Build Errors:** Confirm `apt update` inside Dockerfile runs without errors during build.

***

## Author

**Akash K.A**  


***

