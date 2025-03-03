module "landingzone" {
  source  = "app.terraform.io/cloudbrokeraz/landingzone/aws"
  version = "1.1.5"

  # Feature flags
  enable_vpc         = var.enable_vpc
  enable_http_access = var.enable_http_access
  enable_ssh_access  = var.enable_ssh_access
  enable_tgw         = var.enable_tgw
  enable_ssm         = var.enable_ssm
  
  # General configuration
  region          = var.region
  owner           = var.owner
  ttl             = var.ttl
  deployment_name = var.deployment_name
  
  # Networking configuration
  vpc_cidr       = var.aws_vpc_cidr
  public_subnets = var.aws_public_subnets
  private_subnets = var.aws_private_subnets
  
  # SSH configuration
  aws_key_pair_key_name = var.aws_key_pair_key_name
  ssh_pubkey            = var.ssh_pubkey
  
  # Workspace configuration
  workspace_type = var.workspace_type
}