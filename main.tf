provider "aws" {
  region = var.region
  
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

module "application" {
  source  = "app.terraform.io/company-foobar/application/aws"
  version = "~> 0.0.2"
  ami_name = "packer-linux-aws-python-app"
  region = var.region
  vpc_id = aws_default_vpc.default.id
}

module "database" {
  source  = "app.terraform.io/company-foobar/database/aws"
  version = "~> 0.0.1"
  role = module.application.compute_role
}