
# Docker Basics 

## 1. What is Docker?

Docker is a containerization platform that allows you to package an application and its dependencies into a single, lightweight unit called a **container**. This ensures that the application runs consistently across different environments.

### Docker vs Virtual Machines


---

## 2. Install Docker and Verify Installation

### Install Docker (Linux)

```bash
sudo apt update
sudo apt install docker.io -y
````

### Start and Enable Docker

```bash
sudo systemctl start docker
sudo systemctl enable docker
```

### Verify Installation

```bash
docker --version
docker run hello-world
```

---

## 3. Pull an Official Image from Docker Hub

Docker Hub is the official registry for Docker images.

```bash
docker pull python:3.10
```

Verify:

```bash
docker images
```

---

## 4. Run, Stop, and Remove Docker Containers

### Run a Container

```bash
docker run -it python:3.10
```

### List Running Containers

```bash
docker ps
```

### List All Containers

```bash
docker ps -a
```

### Stop a Container

```bash
docker stop <container_id>
```

### Remove a Container

```bash
docker rm <container_id>
```

### Remove an Image

```bash
docker rmi <image_id>
```

---

## 5. Write a Dockerfile for a Simple Python Application

### Sample Python App (`app.py`)

```python
print("Hello from Docker!")
```

### Dockerfile

```dockerfile
# Use official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy files
COPY app.py .

# Run the application
CMD ["python", "app.py"]
```

---

## 6. Build and Run a Docker Image Locally

### Build the Image

```bash
docker build -t my-python-app .
```

### Run the Image

```bash
docker run my-python-app
```

Output:

```text
Hello from Docker!
```

---

## Useful Docker Commands

```bash
docker images        # List images
docker ps -a         # List all containers
docker logs <id>     # View container logs
docker exec -it <id> bash   # Access running container
```

---


# Capstone Project: Streamlit + Docker + Git

## Docker
To run this project locally without installing Python or Streamlit on your host machine:

1. **Clone the repository:**

```bash
   git clone [https://github.com/kunalsolanki22/intern_assignment.git](https://github.com/kunalsolanki22/intern_assignment.git)
   cd Capstone
```

2. **Build the Docker Image:**
   
```bash
sudo docker build -t streamlit-app .

```

3. **Run the Container:**
```bash
sudo docker run -p 8501:8501 streamlit-app

```

4. **Access the App:** Open your browser and navigate to `http://localhost:8501`

---

## Git Workflow & Branching

This project follows the **Feature Branch Workflow** to ensure code stability.

| Branch Name | Purpose |
| --- | --- |
| `main` | Production-ready, stable code. |
| `feature/app-logic` | Development of the Streamlit UI and interaction. |
| `feature/dockerization` | Dockerfile configuration and port testing. |

### Version Tagging

A versioned release has been created for this project:

```bash
git tag -a v1.0 -m "First stable containerized release"
git push origin main --tags

```

---

##  Docker Configuration Details

### Port Mapping

Streamlit's internal port **8501** is mapped to the host's port **8501** to allow browser access.

### Optimization Techniques

* **.dockerignore**: Excludes `.git` and `__pycache__` to reduce build time and image size.
* **Layer Caching**: The `Dockerfile` is structured to install requirements before copying code, ensuring lightning-fast re-builds when code changes.


---
