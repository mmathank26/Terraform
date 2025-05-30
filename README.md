# Terraform Projects

This repository contains Terraform projects for AWS and Azure infrastructure deployment.

## AWS EFS Project

This project sets up an Amazon Elastic File System (EFS) with the following components:

### Components
- EFS File System
- Mount Target
- Security Group
- Default VPC and Subnet Configuration

### Prerequisites
- AWS Account with appropriate permissions
- Terraform installed (version >= 0.12)
- AWS CLI configured with credentials

### Required Variables
Create a `terraform.tfvars` file with the following variables:
```hcl
aws_region        = "us-east-1"
aws_access_key    = "your-access-key"
aws_secret_key    = "your-secret-key"
creation_token    = "your-creation-token"
transition_to_ia  = "AFTER_7_DAYS"  # Optional: AFTER_7_DAYS, AFTER_14_DAYS, AFTER_30_DAYS
```

### Infrastructure Details
- **EFS File System**: General purpose performance mode
- **Security Group**: Allows NFS traffic (port 2049)
- **Network**: Uses default VPC in us-east-1a
- **Subnet**: CIDR block 10.0.1.0/24

### Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Review the execution plan:
```bash
terraform plan
```

3. Apply the configuration:
```bash
terraform apply
```

### Mounting EFS on Mac

1. Install the AWS EFS mount helper:
```bash
brew install amazon-efs-utils
```

2. Create a mount point:
```bash
sudo mkdir /mnt/efs
```

3. Mount the EFS:
```bash
sudo mount -t efs -o tls fs-<your-efs-id>:/ /mnt/efs
```

### Security Considerations
- The security group currently allows NFS traffic from all IPs (0.0.0.0/0)
- Consider restricting the security group to specific IP ranges for production use
- Ensure proper IAM roles and policies are in place

### Cleanup
To destroy the infrastructure:
```bash
terraform destroy
```

Note: The EFS has `prevent_destroy` lifecycle policy enabled. You'll need to remove this policy before destroying the infrastructure.

## Contributing
Feel free to submit issues and enhancement requests.


