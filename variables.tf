# General configuration
variable "region" {
  description = "AWS region for all resources"
  type        = string
  default     = "ap-southeast-2"
}

variable "owner" {
  description = "Resource owner identified using an email address"
  type        = string
  default     = "aaron"
  
  validation {
    condition     = var.owner == null || can(regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", var.owner))
    error_message = "The owner variable must be a valid email address."
  }
}

variable "ttl" {
  description = "Resource TTL (time-to-live) in hours"
  type        = number
  default     = 48
  
  validation {
    condition     = var.ttl >= 0
    error_message = "TTL value must be non-negative."
  }
}

variable "deployment_name" {
  description = "Deployment name, used to prefix resources"
  type        = string
  default     = "dev"
  
  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.deployment_name))
    error_message = "Deployment name must contain only lowercase letters, numbers, and hyphens."
  }
}

# Networking configuration
variable "aws_vpc_cidr" {
  description = "AWS VPC CIDR block"
  type        = string
  default     = "10.200.0.0/16"
}

variable "aws_public_subnets" {
  description = "AWS public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.200.10.0/24"]
}

variable "aws_private_subnets" {
  description = "AWS private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.200.20.0/24"]
}

# Legacy/unused variables
# Consider removing these if not actually used
variable "address_space" {
  type        = string
  description = "Legacy: The address space for virtual network (unused by module)"
  default     = "10.0.0.0/16"
}

variable "subnet_prefix" {
  description = "Legacy: The address prefix for subnet (unused by module)"
  type        = string
  default     = "10.0.10.0/24"
}

variable "instance_type" {
  description = "Legacy: AWS instance type (unused by module)"
  type        = string
  default     = "t2.micro"
}

variable "admin_username" {
  description = "Legacy: Administrator username (unused by module)"
  type        = string
  default     = "ubuntu"

}

# Authentication variables
variable "hcp_client_id" {
  description = "HCP client ID for authentication"
  type        = string
  default     = null
  sensitive   = true
}

variable "hcp_client_secret" {
  description = "HCP client secret for authentication"
  type        = string
  default     = null
  sensitive   = true
}

# Feature flags
variable "enable_vpc" {
  description = "Enable AWS VPC creation"
  type        = bool
  default     = true
}

variable "enable_http_access" {
  description = "Enable HTTP access to EC2 instances"
  type        = bool
  default     = true
}

variable "enable_ssh_access" {
  description = "Enable SSH access to EC2 instances"
  type        = bool
  default     = true
}

variable "enable_tgw" {
  description = "Enable AWS Transit Gateway"
  type        = bool
  default     = false
}

variable "enable_ssm" {
  description = "Enable AWS Systems Manager"
  type        = bool
  default     = true
}

# SSH configuration
variable "aws_key_pair_key_name" {
  description = "AWS key pair name"
  type        = string
  default     = "key"
}

variable "ssh_pubkey" {
  description = "SSH public key content"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/ByuTnASXmElqUNlm8M0s9qe9JntOfoDXF8cg3A/AXVzgRsU7bisji+db6oNQLQCNVUpOgj7r5+c4lon/DjSyRyGNMwGRDfYcxii/o4p9JTt8AcKWqVfvISi1+rRQ9ZlQrWWkXvuSzWuEuinlzdsopp4oCWNMxswd8GKoAdTmbJA6oFXvikBy6jiuXDXW5VGqOmO6ir6XNsw6hQnv7U4IpKqNyse0o4ttQEkzaZYve4mOepfNdJkY5VacrAyCiBXnKgGdE5AgECWA5CJ5H43h5r+MM/yIiV2UaInetM240j/qbBXaYjyVeYczFDOR7QKGevuszL7I9Ce5U0MbRV9YHboaHDaaWSJOifBUGPQKgrKg0dz/EK/wJkeZAdKZSKVfw48ua/iYfurUJD6cMZ2+2T3tvAu2GfTWY1WFccRrMqnEVEAshUGdXVO8XaHZld+maeGtN6f4euh2TgZhU4radqVfgepMGsVBRFysorY57rvtMR+bpTKSWngYv7KKlkTQ7jtbi8t8vr/05C7AH7yEPdGMg09pPOXz2a62OqdnI5a4yT+W0pYo3ujPHSgQGGIMZxifjNrrORynMNpa5BRfJgAkhjaGuteV0i5gY4CJDAyRrIrxlLJ6TqTNioYtcpJuiBPMbsNIeiCKQ7is68ymk5RMa01JjhODJKA86ssT9Q== aarone@aarone-NHVVW7JKQV"
}

# Workspace configuration
variable "workspace_type" {
  description = "Terraform Cloud workspace type"
  type        = string
  default     = "landingZone"
  
  validation {
    condition     = contains(["landingZone", "development", "production", "staging"], var.workspace_type)
    error_message = "Workspace type must be one of: landingZone, development, production, staging."
  }
}