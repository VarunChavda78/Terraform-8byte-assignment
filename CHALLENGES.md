# Challenges Faced and Resolutions

This document outlines the technical challenges encountered during the assignment and how they were resolved.

---

## 1. Availability Zone Misconfiguration

### Issue:
While creating the public subnet, an invalid availability zone value was used (`ap-south-1` instead of a specific AZ).

### Root Cause:
AWS requires subnets to be created within a specific availability zone (e.g., `ap-south-1a`, `ap-south-1b`).

### Resolution:
I Removed the availability zone configuration and allowed AWS to automatically assign a valid availability zone.

---

## 2. EC2 Instance Not Receiving a Public IP

### Issue:
After successful EC2 creation, the instance did not receive a public IP address.

### Root Cause:
The subnet was created without public IP auto-assignment enabled, and AWS does not assign public IPs to existing instances.

### Resolution:
I Enabled `associate_public_ip_address = true` at the EC2 instance level and recreated the instance to ensure public IP assignment.

---

## 3. Docker Installation Verification on EC2

### Issue:
Docker is not work without sudo, before this i already give permission still

### Root Cause:
Docker installation needed to be automated to match assignment requirements.

### Resolution:
I again ssh into server, It is working
---

## 4. ci.yml is not work

### Issue:
ci.yml file is not work because it is inside of workflows folder but this folder is not inside .github folder

### Resolution:
I put that folder inside .github and it is works
---

## Conclusion

Each challenge provided an opportunity to better understand AWS behavior, Terraform state management, and CI/CD best practices.  
All issues were resolved using standard DevOps approaches aligned with real-world production environments.
