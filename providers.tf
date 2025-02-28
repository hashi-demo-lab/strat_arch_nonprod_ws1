terraform {
  required_version = ">= 1.0.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
  
  default_tags {
    tags = {
      Owner       = var.owner
      TTL         = var.ttl
      Deployment  = var.deployment_name
      Environment = var.deployment_name
      Terraform   = "true"
    }
  }
}