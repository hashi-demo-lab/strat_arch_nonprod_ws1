# AWS Landing Zone Terraform Configuration

This Terraform configuration deploys an AWS landing zone infrastructure using the `hashi-demos-apj/landingzone/aws` module.

## Prerequisites

- Terraform >= 1.0.0
- AWS account with appropriate permissions
- (Optional) Terraform Cloud account for remote state management

## Usage

1. Clone this repository
2. Create a `terraform.tfvars` file based on the provided example
3. Initialize Terraform:
   ```
   terraform init
   ```
4. Review the planned changes:
   ```
   terraform plan
   ```
5. Apply the configuration:
   ```
   terraform apply
   ```

## Configuration

The following variables can be configured:

### General Configuration
- `region`: AWS region (default: "ap-southeast-2")
- `owner`: Resource owner email address
- `ttl`: Resource time-to-live in hours (default: 48)
- `deployment_name`: Name used to prefix resources (default: "dev")

### Networking Configuration
- `aws_vpc_cidr`: VPC CIDR block (default: "10.200.0.0/16")
- `aws_public_subnets`: List of public subnet CIDR blocks
- `aws_private_subnets`: List of private subnet CIDR blocks

### Feature Flags
- `enable_vpc`: Enable VPC creation
- `enable_http_access`: Enable HTTP access to instances
- `enable_ssh_access`: Enable SSH access to instances
- `enable_tgw`: Enable Transit Gateway
- `enable_ssm`: Enable Systems Manager integration

### SSH Configuration
- `aws_key_pair_key_name`: AWS key pair name
- `ssh_pubkey`: SSH public key content

### Workspace Configuration
- `workspace_type`: Terraform Cloud workspace type (landingZone, development, production, staging)

## Outputs

- `deployment_id`: Unique identifier for the deployment
- `aws_key_pair_key_name`: Name of the created AWS key pair
- `public_subnet_ids`: IDs of public subnets
- `security_group_http_id`: ID of HTTP security group
- `security_group_ssh_id`: ID of SSH security group
- `ssm_instance_profile_name`: Name of SSM instance profile

## Notes

- Set `enable_tgw = true` only if you need AWS Transit Gateway functionality
- For security best practices, always restrict SSH access with `enable_ssh_access = false` in production environments