terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "cloudbrokeraz"

    workspaces {
      name = "strat_arch_nonprod_ws1"
    }
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5"
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