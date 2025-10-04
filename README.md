



---

```markdown
# Project1 - Netflix-themed Web Login Page

A Netflix-inspired login page hosted on Apache within Kali Linux Docker containers. This project demonstrates **microservice deployment** using Docker Compose, with multiple services running on different ports.  

This project is ideal for learning:

- Docker & Docker Compose
- Web hosting with Apache
- Multi-container microservice architecture
- UI/UX design inspired by popular streaming platforms

---

## Project Structure

```

project1/
├── Dockerfile           # Base Dockerfile for all services
├── docker-compose.yml   # Compose file for multi-service deployment
├── index.html           # Netflix-themed login page
└── README.md            # Project documentation

````

### Services

| Service Name     | Docker Image       | Port  |
|-----------------|-----------------|-------|
| webseries       | webseries:v1      | 90    |
| animation       | animation:v1      | 91    |
| documentaries   | documentaries:v1  | 92    |
| movies          | movies:v1         | 93    |

Each service runs an independent Apache server serving the same `index.html`. You can customize each service later with different HTML content.

---

## Features

- Netflix-themed login page  
- Custom fonts (Google Fonts: Montserrat, Pacifico)  
- Font Awesome icons for login fields  
- Profile image integration  
- Responsive design and semi-transparent form background  
- Multi-service deployment using Docker Compose  
- Automatic container restart (`unless-stopped`)  

---

## Prerequisites

Ensure the following are installed:

- [Docker](https://docs.docker.com/get-docker/)  
- [Docker Compose](https://docs.docker.com/compose/install/)  
- Git (with SSH access configured)  
- Internet connection (to fetch fonts and icons)

---

## Installation Steps

### 1. Clone Repository via SSH

```bash
git clone git@github.com:<USERNAME>/<REPO_NAME>.git
cd project1
````

> Make sure your SSH key is added to your GitHub account.

### 2. Build Docker Images

You can build each service individually:

```bash
docker build -t webseries:v1 .
docker build -t animation:v1 .
docker build -t documentaries:v1 .
docker build -t movies:v1 .
```

Or use Docker Compose to build all images at once:

```bash
docker-compose build
```

### 3. Run Services using Docker Compose

```bash
docker-compose up -d
```

* `-d` flag runs containers in detached mode.
* All services will restart automatically if the system reboots due to `restart: unless-stopped`.

### 4. Verify Running Containers

```bash
docker ps
```

You should see four containers with ports 90–93 mapped to 80 inside the containers.

### 5. Access Services in Browser

| Service       | URL                                        |
| ------------- | ------------------------------------------ |
| webseries     | [http://localhost:90](http://localhost:90) |
| animation     | [http://localhost:91](http://localhost:91) |
| documentaries | [http://localhost:92](http://localhost:92) |
| movies        | [http://localhost:93](http://localhost:93) |

---

## Stopping Services

```bash
docker-compose down
```

* Stops all running containers and removes them.
* Does **not** remove images. To remove images:

```bash
docker rmi webseries:v1 animation:v1 documentaries:v1 movies:v1
```

---

## Customization

1. **Change HTML content per service**:

   * Create separate HTML files: `webseries.html`, `animation.html`, etc.
   * Update Dockerfile `COPY` command for each service:

   ```dockerfile
   COPY webseries.html /var/www/html/index.html
   ```

2. **Add new services**:

   * Update `docker-compose.yml` with new service name, image, and port.

3. **Change Apache configuration**:

   * Apache runs with default config. Modify `/etc/apache2/sites-available/000-default.conf` if needed.

---

## Git Commands (SSH)

### 1. Add files to staging

```bash
git add .
```

### 2. Commit changes

```bash
git commit -m "Initial commit: Add Docker setup and Netflix login page"
```

### 3. Push to GitHub via SSH

```bash
git push origin main
```

> Replace `main` with your branch name if different.

### 4. Verify push

```bash
git log --oneline
```

---

## Troubleshooting

* **Port conflicts:** Make sure ports 90–93 are free.
* **Permission issues:** Run Docker commands with `sudo` if needed.
* **Container build errors:** Ensure `apt update` runs successfully inside Dockerfile.

---

## Author

**Akash K.A**
MCA 3B

---


Do you want me to create that script?
```
