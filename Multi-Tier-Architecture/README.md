# 🌐 AWS Multi-Tier Architecture with Terraform

This project implements a **Highly Available Multi-Tier Architecture** on AWS using **Terraform**. The architecture includes a public-facing load balancer, auto-scaled Node.js application servers in private subnets, and a secure PostgreSQL database server — all managed as infrastructure as code.

---

## 🏗️ Architecture Overview

The architecture consists of the following components:

### Networking:
- **VPC** with custom CIDR block
- **Public and Private Subnets** (across multiple AZs)
- **Route Tables** with associations for public and private subnets
- **Internet Gateway (IGW)** for public access
- **NAT Gateway** for outbound internet access from private subnets

### Compute:
- **Launch Template** for frontend Node.js application (filtered AMI via `data` block)
- **Auto Scaling Group (ASG)** using the Launch Template
- **Application Load Balancer (ALB)** with:
  - **HTTP (80)** and **HTTPS (443)** listeners
  - Target Group for forwarding traffic to ASG instances

### DNS:
- **Public Route53 DNS** record to map a domain to the ALB
- **Private Route53 Hosted Zone** with DNS record for database access

### Database:
- **Database Server** (filtered AMI via `data` block) deployed in private subnet
- Secure communication only from application tier (no public access)

### Backend:
- **S3 Remote Backend** for storing Terraform state files
- **DynamoDB Table** for state locking to ensure safe parallel usage

---

## 🚀 Features

- Fully automated using Terraform.
- Follows best practices for HA, security, and scalability
- Private database DNS for internal lookups
- TLS termination at ALB
- NAT gateway allows private instances to access the internet securely
- Remote backend for centralized state management

---

## 📁 Project Structure

