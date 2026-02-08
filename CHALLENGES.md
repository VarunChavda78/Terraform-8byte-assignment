# Challenges Faced and Resolutions

This document outlines the technical challenges encountered during the assignment and how they were resolved.

---

## 1. Availability Zone Misconfiguration

### Issue:
While creating the public subnet, an invalid availability zone value was used (`ap-south-1` instead of a specific AZ).

### Root Cause:
AWS requires subnets to be created within a specific availability zone (e.g., `ap-south-1a`, `ap-south-1b`).

### Resolution:
Removed the availability zone configuration and allowed AWS to automatically assign a valid availability zone.

---

## 2. EC2 Dedicated Tenancy Error

### Issue:
EC2 instance creation failed with a `VcpuLimitExceeded` error related to dedicated tenancy.

### Root Cause:
The VPC or EC2 instance was implicitly attempting to launch with dedicated tenancy, which is not supported under AWS Free Tier limits.

### Resolution:
Explicitly set the VPC and EC2 tenancy to `default`, ensuring the instance launches as a standard shared tenancy instance.

---

## 3. EC2 Instance Not Receiving a Public IP

### Issue:
After successful EC2 creation, the instance did not receive a public IP address.

### Root Cause:
The subnet was created without public IP auto-assignment enabled, and AWS does not retroactively assign public IPs to existing instances.

### Resolution:
Enabled `associate_public_ip_address = true` at the EC2 instance level and recreated the instance to ensure public IP assignment.

---

## 4. Terraform Resource Dependencies

### Issue:
Some resources depended on others being created first, such as route tables, internet gateways, and subnets.

### Root Cause:
Incorrect or missing references between Terraform resources.

### Resolution:
Used explicit resource references (IDs) to ensure Terraform automatically handled dependency ordering.

---

## 5. Docker Installation Verification on EC2

### Issue:
Ensuring Docker was installed correctly during EC2 provisioning without manual intervention.

### Root Cause:
Docker installation needed to be automated to match assignment requirements.

### Resolution:
Used Terraform `user_data` to install, start, and enable Docker during EC2 initialization.

---

## 6. CI/CD Pipeline Validation

### Issue:
Ensuring the CI pipeline accurately validated Docker builds without overcomplicating deployment.

### Resolution:
Implemented a minimal GitHub Actions workflow focused solely on Docker image build verification triggered on pushes to the main branch.

---

## Conclusion

Each challenge provided an opportunity to better understand AWS behavior, Terraform state management, and CI/CD best practices.  
All issues were resolved using standard DevOps approaches aligned with real-world production environments.
