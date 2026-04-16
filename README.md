# 🚀 End-to-End DevOps CI/CD Pipeline (AWS + Docker + Terraform)

## 📌 Project Overview

This project demonstrates a complete **DevOps pipeline** where a containerized application is automatically built, pushed, and deployed on AWS using modern DevOps tools.

The goal was to eliminate manual deployment and achieve **fully automated infrastructure provisioning and application deployment**.

---

## 🧰 Tech Stack

* **Cloud:** AWS (EC2)
* **Containerization:** Docker
* **Infrastructure as Code:** Terraform
* **CI/CD:** GitHub Actions
* **Container Registry:** Docker Hub
* **Backend:** Node.js (Express)

---

## 🏗️ Architecture

```
GitHub (Code)
     ↓
GitHub Actions (CI/CD)
     ↓
Docker Build & Push
     ↓
Docker Hub (Image Registry)
     ↓
Terraform (EC2 Provisioning)
     ↓
AWS EC2 (Deployment)
     ↓
Live Application 🌍
```

---

## ⚙️ How It Works

### 1. Infrastructure Provisioning (Terraform)

* Creates AWS EC2 instance
* Configures security groups
* Installs Docker automatically using `user_data`
* Pulls Docker image and runs container

---

### 2. Continuous Integration & Deployment (GitHub Actions)

* Triggered on every `git push`
* Builds Docker image
* Pushes image to Docker Hub
* Connects to EC2 via SSH
* Stops old container and deploys new version

---

### 3. Containerization (Docker)

* Application packaged into Docker image
* Ensures consistent environment across deployments

---

## 🔁 CI/CD Pipeline Flow

1. Developer pushes code to GitHub
2. GitHub Actions pipeline triggers
3. Docker image is built
4. Image is pushed to Docker Hub
5. EC2 pulls latest image
6. Old container is removed
7. New container is deployed automatically

---

## 🌐 Live Application

```
http://<your-ec2-public-ip>:3000
```

---

## 📂 Project Structure

```
.
├── app.js
├── package.json
├── Dockerfile
├── .gitignore
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
└── .github/
    └── workflows/
        └── deploy.yml
```

---

## 🔐 Security Best Practices

* `.pem` files are excluded using `.gitignore`
* Terraform state files are not committed
* Secrets stored securely in GitHub Actions Secrets

---

## 🏆 Key Achievements

* Automated infrastructure provisioning using Terraform
* Implemented CI/CD pipeline using GitHub Actions
* Containerized application using Docker
* Achieved zero manual deployment

---

## 📈 Future Improvements

* Add domain & HTTPS (SSL)
* Use Nginx reverse proxy
* Implement monitoring (CloudWatch)
* Add auto-scaling setup

---

## 🙌 Conclusion

This project reflects a real-world DevOps workflow by integrating **automation, cloud, and containerization**, making deployments faster, reliable, and scalable.

---

### ⭐ If you like this project, feel free to star the repo!
