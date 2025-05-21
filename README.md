# 🌐 AWS Infrastructure with Terraform

This repository contains reusable infrastructure code to provision and manage AWS networking and compute resources using Terraform. It includes:

- A custom VPC with public subnet
- Internet gateway and route tables
- Security group with custom ingress/egress rules
- EC2 instances for Kubernetes (master and workers)

---

## 📁 Folder Structure

```
infra/
├── modules/
│   ├── vpc.tf
│   ├── subnet.tf
│   ├── internet-gateway.tf
│   ├── route-table.tf
│   ├── route-table-association.tf
│   ├── security-group.tf
│   └── ec2.tf
│
└── environments/
    ├── main.tf              # References ../modules as module
    ├── variables.tf         # Input variables like AWS region
    ├── terraform.tfvars     # Values for variables
    └── backend.tf           # S3 + DynamoDB backend config
```

---

## 🚀 Getting Started

### 1. Prerequisites

- AWS CLI configured (`aws configure`)
- Terraform installed (`>= 1.3`)
- S3 bucket and DynamoDB table created for remote state

### 2. Initialize Terraform

```bash
cd infra/environments
terraform init
```

### 3. Plan and Apply

```bash
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

---

## 🧹 Cleanup

To destroy resources:

```bash
terraform destroy -var-file="terraform.tfvars"
```

To reset Terraform state (optional):

```bash
rm -rf .terraform
rm terraform.tfstate*
```

---

## 📦 Terraform Backend (Remote State)

Make sure your `backend.tf` file is configured with the correct S3 bucket and DynamoDB table:

```hcl
terraform {
  backend "s3" {
    bucket         = "counsel-cat-infra-state-bucket"
    key            = "terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "terraform-locks"    			# DynamoDB table to use for state locking
    acl            = "bucket-owner-full-control" 	# S3 ACL (adjust as needed)
    encrypt        = true
  }
}
```

---

## 🤝 Contributions

Feel free to fork this repo and open PRs to improve reusability, modularity, or add additional AWS resources.

---