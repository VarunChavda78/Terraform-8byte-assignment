# 8byte DevOps Intern Assignment  
Deploy a Containerized Node.js Application on AWS using Terraform and GitHub Actions

---

## Project Overview

This project demonstrates an end-to-end DevOps workflow for deploying a containerized Node.js application on AWS.  
The setup includes Infrastructure as Code (Terraform), containerization using Docker, and CI automation using GitHub Actions.

The application is deployed on an AWS EC2 instance inside a custom VPC and is accessible publicly via EC2 Public IP.

---

## Technology Stack

- **Cloud Provider:** AWS
- **Infrastructure as Code:** Terraform
- **Containerization:** Docker
- **CI/CD:** GitHub Actions
- **Application:** Node.js (Express)
- **OS:** Ubuntu 22.04
- **Compute:** EC2 (t3.micro)

---

## Architecture Overview

Developer
|
| git push
v
GitHub Repository
|
| GitHub Actions (CI)
| - Build Docker Image
v
Docker Image
|
v
AWS EC2 (Ubuntu 22.04)
|
| Docker Container (Node.js App)
v
Public Internet (Port 3000)

**Folder Structure**

.
├── app.js
├── package.json
├── Dockerfile
├── terraform/
│ ├── main.tf
│ ├── provider.tf
│ ├── variables.tf
│ ├── outputs.tf
│ └── terraform.tfvars
├── .github/
│ └── workflows/
│ └── ci.yml
├── README.md
├── APPROACH.md
└── CHALLENGES.md

**High-level flow:**


---

## ▶️ Steps to Run the Application Locally

### 1️⃣ Install dependencies
```bash
npm install

node app.js

http://localhost:3000

---

## 🐳 Steps to Build & Run Docker Image Locally

### 1️⃣ Build Docker Image
```bash
docker build -t 8byte-intern-app .

### 2️⃣ Run Docker Container
```bash
docker run -p 3000:3000 8byte-intern-app

---

## ☁️ Infrastructure Provisioning using Terraform

### 1️⃣ Initialize Terraform
```bash
terraform init

### 2️⃣ Plan Terraform
```bash
terraform plan

### 3️⃣ Apply Terraform
```bash
terraform apply

---

## 🚀 Deploy Application on EC2

### 1️⃣ SSH into EC2
```bash
ssh ubuntu@<EC2_PUBLIC_IP>

### 2️⃣ Verify Docker installation
```bash
docker --version

### 3️⃣ Clone repository or copy source code
git clone https://github.com/VarunChavda78/Terraform-8byte-assignment.git
cd Terraform-8byte-assignment

### 4️⃣ Build Docker image
docker build -t 8byte-intern-app .

### 5️⃣ Run Docker container
docker run -d -p 3000:3000 -d 8byte-intern-app

### 6️⃣ Access application
http://3.109.47.82:3000
