# Approach

Deploy a simple nodejs app on AWS server via Terraform and also included Github Action Pipeline

---

## 1. Application Strategy

A lightweight Node.js (Express) application was used in the assignment.
The application exposes on port 3000 to keep the focus on infrastructure, containerization, and automation rather than application complexity.

---

## 2. Containerization Approach

Docker was chosen to containerize the application to ensure consistency across local, CI, and production environments.

Key considerations:
- I use small image like node:18-alpine for lightweight
- Installed dependencies inside the container
- Exposed port 3000
- Used a single container to keep the setup simple and transparent

This approach ensures that the application runs identically on local machines, CI runners, and EC2 instances.

---

## 3. Infrastructure Design (Terraform)

Infrastructure was provisioned using Terraform to follow Infrastructure as Code (IaC) principles.

### Resources Provisioned:
- Custom VPC
- Public Subnet with Internet access
- Internet Gateway
- Route Table and Route Table Association
- Security Group allowing only required ports (22 and 3000)
- EC2 instance running Ubuntu 22.04

Key design decisions:
- A public subnet was used to allow SSH access and public application access
- Security groups were restricted to only necessary ports
- Docker was installed automatically on EC2 using Terraform `user_data` to reduce manual configuration

This approach makes the infrastructure reproducible, version-controlled, and easy to destroy or recreate.

---

## 4. EC2 Deployment Strategy

The EC2 instance serves as the application host.

Deployment steps:
- SSH into EC2 using a key pair
- Build Docker image directly on the instance
- Run the container with port mapping to expose the application

This approach keeps deployment simple while clearly demonstrating Docker and EC2 integration.

---

## 5. CI Strategy (GitHub Actions)

A GitHub Actions pipeline was implemented to automate Docker image builds.

Pipeline characteristics:
- Triggered on every push to the `main` branch
- Checks out the source code
- Builds the Docker image
- Fails the pipeline if the Docker build fails

The CI pipeline ensures that any change pushed to the repository does not break the containerization process and provides immediate feedback.

---

## 6. Security Considerations

- SSH access restricted to port 22
- Application access restricted to port 3000
- No credentials or secrets committed to the repository
- AWS access managed locally via AWS CLI configuration
